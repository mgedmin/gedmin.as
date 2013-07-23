import sys
import random
import pygame
from pygame.locals import *


class Game(object):

    background = (0x02, 0x2c, 0x12)

    def __init__(self):
        self.player = Player(200, 100)
        self.dog = Dog(400, 300)
        self.trees = []
        for n in range(50):
            self.trees.append(Tree(random.randrange(800),
                                   random.randrange(600)))

    def draw(self, surface):
        surface.fill(self.background)
        objects = self.trees + [self.dog, self.player]
        objects.sort(key=lambda obj: obj.y)
        for obj in objects:
            obj.draw(surface)

    def update(self):
        self.dog.move()

    def handle_event(self, event):
        if event.type == KEYDOWN:
            if event.key == K_LEFT:
                self.player.move(-5, 0)
            if event.key == K_RIGHT:
                self.player.move(+5, 0)
            if event.key == K_UP:
                self.player.move(0, -5)
            if event.key == K_DOWN:
                self.player.move(0, +5)
            if event.key == K_ESCAPE:
                sys.exit()


class Dog(object):

    color = (0xff, 0xcc, 0xcc)

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self):
        self.x += random.randint(-5, 5)
        self.y += random.randint(-5, 5)

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

    def move(self, dx, dy):
        self.x += dx
        self.y += dy

    def draw(self, surface):
        x = self.x
        y = self.y - 15
        pygame.draw.circle(surface, self.color, (x, y), 5)
        pygame.draw.line(surface, self.color, (x, y), (x, y+10))
        pygame.draw.line(surface, self.color, (x, y+10), (x+5, y+15))
        pygame.draw.line(surface, self.color, (x, y+10), (x-5, y+15))
        pygame.draw.line(surface, self.color, (x, y+5), (x+5, y+5))
        pygame.draw.line(surface, self.color, (x, y+5), (x-5, y+5))


def main():
    pygame.init()
    screen = pygame.display.set_mode((800, 600))
    pygame.key.set_repeat(250, 30)
    game = Game()
    clock = pygame.time.Clock()
    while True:
        game.draw(screen)
        pygame.display.flip()
        clock.tick(20)
        game.update()
        for event in pygame.event.get():
            game.handle_event(event)


if __name__ == '__main__':
    main()
