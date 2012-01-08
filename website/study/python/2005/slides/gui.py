#!/usr/bin/python
import time
import pygame
import random
from pygame.locals import *

class Game:

    def __init__(self):
        self.objects = []
        self.font = pygame.font.Font(None, 60)
        self.counter = 0

    def add(self, obj):
        self.objects.append(obj)

    def draw(self, surface):
        self.counter += 1

        color = (0x44, 0xaa, 0x14)
        surface.fill(color)

        color = (0, 0, 0)
        img = self.font.render('The Great Game: time = %d'
                               % self.counter, True, color)
        y = 10
        x = (surface.get_width() - img.get_width()) / 2
        surface.blit(img, (x, y))

        for obj in self.objects:
            obj.draw(surface)


class Tree:

    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.img = pygame.image.load('tree.png')

    def draw(self, surface):
        color = (0, 0xff, 0)
        surface.blit(self.img, (self.x, self.y))

class Player:

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self, dx, dy):
        self.x += dx
        self.y += dy

    def draw(self, surface):
        color = (0xff, 0, 0)
        pygame.draw.circle(surface, color, (self.x, self.y),
                           5, 4)


class Dog(Player):

    def update(self):
        self.move(random.randrange(-10, 10),
                  random.randrange(-10, 10))

    def draw(self, surface):
        color = (0, 0, 0xcc)
        pygame.draw.circle(surface, color, (self.x, self.y),
                           4, 3)


def new_game():
    g = Game()
    g.add(Tree(100, 200))
    g.add(Tree(600, 500))
    g.add(Tree(300, 400))
    return g


def main():
    pygame.init()
    screen = pygame.display.set_mode((800, 600))
    pygame.key.set_repeat(250, 1000/30)
    g = new_game()
    player = Player(700, 100)
    dog = Dog(200, 400)
    g.add(player)
    g.add(dog)
    while True:
        dog.update()
        g.draw(screen)
        pygame.display.flip()
        time.sleep(0.1)
        while True:
            event = pygame.event.poll()
            if event.type == NOEVENT:
                break
            if event.type == KEYDOWN:
                if event.unicode.lower() == 'q':
                    return
                elif event.key == K_ESCAPE:
                    return
                elif event.key == K_LEFT:
                    player.move(-10, 0)
                elif event.key == K_RIGHT:
                    player.move(10, 0)
                elif event.key == K_UP:
                    player.move(0, -10)
                elif event.key == K_DOWN:
                    player.move(0, 10)
            if event.type == QUIT:
                return

if __name__ == '__main__':
    main()
