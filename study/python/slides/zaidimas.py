class Zaidimas:
   def komanda_eiti(self):
       """eiti namo"""
       print "Einu"
   def komanda_miegoti(self):
       """miegoti, kol gyvybių padaugės"""
       print "Miegu..."
   def komanda_valgyti(self):
       print "Neturiu ką :("
   def komanda_issidirbineti(self):
       print "pats toks"
   def komanda_pagalba(self):
       for name in dir(self):
           obj = getattr(self, name)
           if callable(obj) and name.startswith('komanda_'):
               print name[len('komanda_'):], ' - ', obj.__doc__

z = Zaidimas()
def ciklas():
    while True:
        komanda = raw_input("> ")
        if komanda == 'baigti': break
        ka_daryti = getattr(z, 'komanda_' + komanda, None)
        if ka_daryti:
            ka_daryti()
        else:
            print "ka?"

