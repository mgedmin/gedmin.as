#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sqlite
import pygtk
pygtk.require('2.0')
import gtk
import gtk.glade


class MainWindow(object):

    def __init__(self):
        xml = gtk.glade.XML("addressbook.glade")
        xml.signal_autoconnect(self)
        main_window = xml.get_widget("main_window")
        main_window.connect("destroy", gtk.main_quit)
        self.statusbar = xml.get_widget("statusbar")
        treeview = xml.get_widget("treeview")
        self.tree_model = gtk.TreeStore(str, str, str)
        treeview.set_model(self.tree_model)
        treeview.append_column(gtk.TreeViewColumn("Vardas",
                                                  gtk.CellRendererText(),
                                                  text=0))
        treeview.append_column(gtk.TreeViewColumn("Pavardė",
                                                  gtk.CellRendererText(),
                                                  text=1))
        treeview.append_column(gtk.TreeViewColumn("Telefonas",
                                                  gtk.CellRendererText(),
                                                  text=2))
        main_window.show()
        self.connect()
        self.load_data()

    def connect(self):
        self.db = sqlite.connect("addressbook.sqlite")

    def load_data(self):
        self.statusbar.pop(1)
        self.statusbar.push(1, "Loading...")
        cursor = self.db.cursor()
        cursor.execute("SELECT first_name, last_name, phone FROM Addressbook")
        self.tree_model.clear()
        for row in cursor.fetchall():
            self.tree_model.append(None, row)
        cursor.close()
        self.statusbar.pop(1)
        self.statusbar.push(1, "Loaded %d rows" % len(self.tree_model))

    def on_exit_activate(self, *args):
        gtk.main_quit()

    def on_about_activate(self, *args):
        print "Apie mane"
        # TODO: parodyk dialogą


def main():
    win = MainWindow()
    gtk.main()

if __name__ == '__main__':
    main()
