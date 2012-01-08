# mano labai gudrios funkcijos
# -*- coding: utf-8 -*-
"""
Gudrios matematinės funkcijos

Yra pvz., apytiksle_pi_reiksme.
"""

import operator

apytiksle_pi_reiksme = 3.14

def faktorialas(n):
    """Skaičiuoja 1 * 2 * ... * n"""
    return reduce(operator.mul, range(1, n+1))

if __name__ == '__main__':
    print "labas"
