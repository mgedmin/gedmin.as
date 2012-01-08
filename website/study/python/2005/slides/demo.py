#!/usr/bin/python
import pygtk
pygtk.require('2.0')
import gtk
import gtk.glade

import psycopg


def load_data():
    db = psycopg.connect("dbname=sampledb")
    cur = db.cursor()
    try:
        cur.execute("SELECT id, name, comment"
                    " FROM people ORDER BY name")
        return cur.fetchall()
    finally:
        db.close()


class MainWindow:

    def __init__(self):
        xml = gtk.glade.XML('gtk-sql-demo.glade')
        xml.signal_autoconnect(self)
        main_window = xml.get_widget('main_window')
        main_window.show()
        main_window.connect("destroy", self.on_destroy)

        self.name_entry = xml.get_widget("name_entry")
        self.comment_entry = xml.get_widget("comment_entry")

        self.data_tree = xml.get_widget("data_tree")
        self.load_data()

    def load_data(self):
        model = gtk.ListStore(int, str, str)
        for id, name, comment in load_data():
            model.append([id, name, comment])
        self.data_model = model
        self.data_tree.set_model(model)
        column = gtk.TreeViewColumn('Name',
                                    gtk.CellRendererText(),
                                    text=1)
        self.data_tree.append_column(column)

    def on_destroy(self, widget):
        gtk.main_quit()

    def on_file_exit(self, event):
        gtk.main_quit()

    def on_data_tree_row_activated(self, widget):
        pos, col = widget.get_cursor()
        row = self.data_model[pos]
        self.name_entry.set_text(row[1])
        self.comment_entry.set_text(row[2])


if __name__ == '__main__':
    main_window = MainWindow()
    gtk.main()
