import random
from twisted.protocols import basic
from twisted.internet import reactor, protocol


class Game(object):

    def __init__(self):
        self.players = []
        self.dog = Dog(400, 300)
        self.trees = []
        for n in range(5):
            self.trees.append(Tree(random.randrange(800),
                                   random.randrange(600)))

    def update(self):
        self.dog.move()

    def __str__(self):
        objs = ['T(%d,%d)' % (tree.x, tree.y) for tree in self.trees]
        objs += ['D(%d,%d)' % (self.dog.x, self.dog.y)]
        objs += ['P(%d,%d)' % (player.x, player.y)
                 for player in self.players]
        return ' '.join(objs)


class Dog(object):

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self):
        self.x += random.randint(-5, 5)
        self.y += random.randint(-5, 5)


class Tree(object):

    def __init__(self, x, y):
        self.x = x
        self.y = y


class Player(object):

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self, dx, dy):
        self.x += dx
        self.y += dy


class GameProtocol(basic.LineReceiver):

    def connectionMade(self):
        self.player = Player(random.randrange(800), random.randrange(600))
        self.factory.game.players.append(self.player)
        self.factory.clients.append(self)
        self.factory.notify_all()

    def connectionLost(self, reason):
        self.factory.game.players.remove(self.player)
        self.factory.clients.remove(self)
        self.factory.notify_all()

    def lineReceived(self, line):
        if line == 'LEFT':
            self.player.move(-5, 0)
        if line == 'RIGHT':
            self.player.move(+5, 0)
        if line == 'UP':
            self.player.move(0, -5)
        if line == 'DOWN':
            self.player.move(0, +5)


class GameFactory(protocol.ServerFactory):
    protocol = GameProtocol

    def __init__(self, game):
        self.game = game
        self.clients = []
        reactor.callLater(1/20., self.update)

    def notify_all(self):
        for client in self.clients:
            client.sendLine(str(self.game))

    def update(self):
        self.game.update()
        self.notify_all()
        reactor.callLater(1/20., self.update)


def main():
    game = Game()
    reactor.listenTCP(9898, GameFactory(game))
    reactor.run()


if __name__ == '__main__':
    main()
