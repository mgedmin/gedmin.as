#!/usr/bin/python

import random
import pygame
from pygame.locals import *
from twisted.protocols import basic
from twisted.internet import protocol
from twisted.internet import reactor

class Game:

    def __init__(self, s):
        self.objects = []
        for obj in s.split('; '):
            obj = self.parse(obj)
            if obj is not None:
                self.objects.append(obj)

    def parse(self, s):
        if s.startswith('Tree'):
            # 'Tree(x, y)'[5:-1] == 'x, y'
            x, y = map(int, s[5:-1].split(','))
            return Tree(x, y)
        if s.startswith('Player'):
            # 'Player(name, x, y)'[7:-1] == 'name, x, y'
            name, x, y = s[7:-1].split(',')
            x = int(x)
            y = int(y)
            return Player(name, x, y)
        if s.startswith('Dog'):
            # 'Dog(x, y)'[4:-1] == 'x, y'
            x, y = map(int, s[4:-1].split(','))
            return Dog(x, y)

    def draw(self, surface):
        color = (0x44, 0xaa, 0x14)
        surface.fill(color)
        for obj in self.objects:
            obj.draw(surface)


class Tree:

    img = pygame.image.load('tree.png')

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def draw(self, surface):
        color = (0, 0xff, 0)
        surface.blit(self.img, (self.x, self.y))


class Dog:

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def draw(self, surface):
        color = (0, 0, 0xcc)
        pygame.draw.circle(surface, color, (self.x, self.y),
                           4, 3)


class Player:

    def __init__(self, name, x, y):
        self.name = name
        self.x = x
        self.y = y

    def draw(self, surface):
        somenumber = hash(self.name)
        r = somenumber & 0xFF
        g = (somenumber >> 8) & 0xFF
        b = (somenumber >> 16) & 0xFF
        color = (r, g, b)
        pygame.draw.circle(surface, color, (self.x, self.y),
                           5, 4)


class GameClientProtocol(basic.LineReceiver):

    game = None

    def connectionMade(self):
        self.sendLine('hello %s %d %d' %
                      (self.factory.name,
                       self.factory.x,
                       self.factory.y))
        reactor.callLater(0, self.handleEvents)

    def connectionLost(self, reason):
        try:
            reactor.stop()
        except:
            pass

    def lineReceived(self, line):
        self.game = Game(line)
        self.game.draw(self.factory.screen)
        pygame.display.flip()

    def handleEvents(self):
        if self.game is not None:
            self.game.draw(self.factory.screen)
            pygame.display.flip()
        while True:
            event = pygame.event.poll()
            if event.type == NOEVENT:
                break
            if event.type == KEYDOWN:
                if event.unicode.lower() == 'q':
                    reactor.stop()
                elif event.key == K_ESCAPE:
                    reactor.stop()
                elif event.key == K_LEFT:
                    self.move(-10, 0)
                elif event.key == K_RIGHT:
                    self.move(10, 0)
                elif event.key == K_UP:
                    self.move(0, -10)
                elif event.key == K_DOWN:
                    self.move(0, 10)
            if event.type == QUIT:
                reactor.stop()
        reactor.callLater(0.1, self.handleEvents)

    def move(self, dx, dy):
        self.sendLine('move %d %d' % (dx, dy))


class GameClientFactory(protocol.ClientFactory):
    protocol = GameClientProtocol
    name = 'Jonas'
    x = 700
    y = 100

def main():
    server = 'localhost'
    port = 1234
    factory = GameClientFactory()
    factory.name = random.choice(['Jonas', 'Petras', 'Maryte',
                                  'Ir kt.'])
    factory.x = random.randrange(100, 700)
    factory.y = random.randrange(100, 500)
    print "Connecting to %s, port %d" % (server, port)
    reactor.connectTCP(server, port, factory)

    pygame.init()
    factory.screen = pygame.display.set_mode((800, 600))
    pygame.key.set_repeat(250, 1000/30)
    reactor.run()

if __name__ == '__main__':
    main()
