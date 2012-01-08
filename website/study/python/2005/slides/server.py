#!/usr/bin/python

import random
from twisted.protocols import basic
from twisted.internet import protocol
from twisted.internet import reactor

class Game:

    def __init__(self):
        self.objects = []

    def add(self, obj):
        self.objects.append(obj)

    def remove(self, obj):
        self.objects.remove(obj)

    def __str__(self):
        return "; ".join(map(str, self.objects))


class Tree:

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "Tree(%d,%d)" % (self.x, self.y)


class Player:

    def __init__(self, name, x, y):
        self.name = name
        self.x = x
        self.y = y

    def move(self, dx, dy):
        self.x += dx
        self.y += dy

    def __str__(self):
        return "Player(%s,%d,%d)" % (self.name, self.x, self.y)


class Dog(Player):

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "Dog(%d,%d)" % (self.x, self.y)

    def update(self):
        self.move(random.randrange(-10, 10),
                  random.randrange(-10, 10))


def new_game():
    g = Game()
    g.add(Tree(100, 200))
    g.add(Tree(600, 500))
    g.add(Tree(300, 400))
    return g


class GameServerProtocol(basic.LineReceiver):

    nr = 0
    player = None

    def connectionMade(self):
        GameServerProtocol.nr += 1
        self.nr = GameServerProtocol.nr
        print "Client %d connected." % self.nr
        self.factory.clients.append(self)

    def connectionLost(self, reason):
        print "Client %d disconnected." % self.nr
        self.factory.clients.remove(self)
        if self.player is not None:
            self.factory.game.remove(self.player)
            self.factory.notify_all()

    def lineReceived(self, line):
        print "Client %d says %s" % (self.nr, line)
        if line.lower() == 'quit':
            self.transport.loseConnection()
            return
        if line.lower().startswith('hello'):
            name, x, y = line.split()[1:]
            x = int(x)
            y = int(y)
            self.player = Player(name, x, y)
            self.factory.game.add(self.player)
            self.factory.notify_all()
        if line.lower().startswith('move'):
            dx, dy = line.split()[1:]
            dx = int(dx)
            dy = int(dy)
            self.player.move(dx, dy)
            self.factory.notify_all()


class GameServerFactory(protocol.ServerFactory):
    protocol = GameServerProtocol
    clients = []

    def notify_all(self):
        for client in self.clients:
            client.sendLine(str(self.game))

    def update(self):
        self.dog.update()
        self.notify_all()
        reactor.callLater(0.1, self.update)


def main():
    port = 1234
    factory = GameServerFactory()
    factory.game = new_game()
    factory.dog = Dog(400, 300)
    factory.game.add(factory.dog)
    reactor.listenTCP(port, factory)
    print "Listening on port %d" % port
    reactor.callLater(0, factory.update)
    reactor.run()

if __name__ == '__main__':
    main()
