import sys
import pygame
from pygame.locals import *
from twisted.protocols import basic
from twisted.internet import reactor, protocol


class Game(object):

    background = (0x02, 0x2c, 0x12)

    def __init__(self, surface):
        self.objects = []
        self.surface = surface

    def redraw(self):
        self.surface.fill(self.background)
        self.objects.sort(key=lambda obj: obj.y)
        for obj in self.objects:
            obj.draw(self.surface)


class Dog(object):

    color = (0xff, 0xcc, 0xcc)

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def draw(self, surface):
        pygame.draw.ellipse(surface, self.color,
                            (self.x-4, self.y-6, 9, 7))


class Tree(object):

    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.img = pygame.image.load("tree.png")

    def draw(self, surface):
        x = self.x - self.img.get_width() / 2
        y = self.y - self.img.get_height() + 5
        surface.blit(self.img, (x, y))


class Player(object):

    color = (0xff, 0xff, 0xff)

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def draw(self, surface):
        x = self.x
        y = self.y - 15
        pygame.draw.circle(surface, self.color, (x, y), 5)
        pygame.draw.line(surface, self.color, (x, y), (x, y+10))
        pygame.draw.line(surface, self.color, (x, y+10), (x+5, y+15))
        pygame.draw.line(surface, self.color, (x, y+10), (x-5, y+15))
        pygame.draw.line(surface, self.color, (x, y+5), (x+5, y+5))
        pygame.draw.line(surface, self.color, (x, y+5), (x-5, y+5))


class GameProtocol(basic.LineReceiver):

    def connectionMade(self):
        reactor.callLater(1/20., self.check_for_events)

    def lineReceived(self, line):
        self.factory.game.objects = []
        for obj in line.split():
            # X(%,%d)
            objtype = obj[0]
            cls = {'D': Dog, 'P': Player, 'T': Tree}[objtype]
            x, y = obj[2:-1].split(',')
            x, y = int(x), int(y)
            self.factory.game.objects.append(cls(x, y))
        self.factory.game.redraw()
        pygame.display.flip()

    def check_for_events(self):
        for event in pygame.event.get():
            if event.type == KEYDOWN:
                if event.key == K_LEFT:
                    self.sendLine('LEFT')
                if event.key == K_RIGHT:
                    self.sendLine('RIGHT')
                if event.key == K_UP:
                    self.sendLine('UP')
                if event.key == K_DOWN:
                    self.sendLine('DOWN')
                if event.key == K_ESCAPE:
                    reactor.stop()
        reactor.callLater(1/20., self.check_for_events)


class GameFactory(protocol.ClientFactory):
    protocol = GameProtocol

    def __init__(self, game):
        self.game = game


def main():
    if len(sys.argv) > 1:
        hostname = sys.argv[1]
    else:
        hostname = 'localhost'
    pygame.init()
    screen = pygame.display.set_mode((800, 600))
    pygame.key.set_repeat(250, 30)
    game = Game(screen)
    reactor.connectTCP(hostname, 9898, GameFactory(game))
    reactor.run()


if __name__ == '__main__':
    main()
