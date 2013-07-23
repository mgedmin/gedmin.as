#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Sukuria ir užpildo duomenų bazę atsitiktiniais kontaktais.
"""

import random
import sqlite


class Kontaktas(object):

    def __init__(self, vardas, pavarde, telefono_nr):
        self.vardas = vardas
        self.pavarde = pavarde
        self.telefono_nr = telefono_nr

    def __repr__(self):
        return 'Kontaktas(%r, %r, %r)' % (self.vardas, self.pavarde,
                                          self.telefono_nr)

    @classmethod
    def atsitiktinis(cls):
        vardas = random.choice(["Jonas", "Petras", "Marius", "Kastytis",
                                "Algimantas", "Vytautas"])
        pavarde = random.choice(["Jonaitis", "Petravičius", "Obuolys",
                                 "Befantazijos", "Irtaiptoliau"])
        telefono_nr = str(random.randrange(10**7, 10**8))
        return cls(vardas, pavarde, telefono_nr)


class Duombaze(object):

    def __init__(self, filename):
        self._open(filename)
        try:
            self._create_tables()
        except sqlite.DatabaseError:
            pass # perhaps table already exists?

    def _open(self, filename):
        self.connection = sqlite.connect(filename)

    def _create_tables(self):
        cursor = self.connection.cursor()
        cursor.execute("""CREATE TABLE Addressbook (
                            id INTEGER PRIMARY KEY,
                            first_name VARCHAR(100),
                            last_name VARCHAR(100),
                            phone VARCHAR(100)
                            )""")
        cursor.close()
        self.connection.commit()

    def insert(self, contact):
        cursor = self.connection.cursor()
        cursor.execute("""INSERT INTO Addressbook
                                 (first_name, last_name, phone)
                          VALUES (%(first_name)s, %(last_name)s, 
                                  %(phone)s)""",
                       {'first_name': contact.vardas,
                        'last_name': contact.pavarde,
                        'phone': contact.telefono_nr})
        cursor.close()
        self.connection.commit()


def main():
    db = Duombaze("addressbook.sqlite")
    for i in range(10):
        db.insert(Kontaktas.atsitiktinis())


if __name__ == '__main__':
    main()

