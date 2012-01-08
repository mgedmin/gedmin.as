#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Paišome Mandelbrotą.

Konvertuota iš Pythoną iš šios C programos:

    main(k){float i,j,r,x,y=-16;while(puts(""),y++<15)for(x
    =0;x++<84;putchar(" .:-;!/>)|&IH%*#"[k&15]))for(i=k=r=0;
    j=r*r-i*i-2+x/25,i=2*r*i+y/10,j*j+i*i<11&&k++<111;r=j);}

ir truputuką pakeista.
"""
import sys
##import psyco
##psyco.full()


def main():
    colors = " .:-;!/>)|&IH%*#"
    for y in range(-15, 16):
        for x in range(0, 80):
            rx = x / 25.0 - 2.2
            ry = y / 10.0
            k = 0
            r = i = 0.0
            while True:
                nr = r * r - i * i + rx
                ni = 2 * r * i + ry
                r, i = nr, ni
                if r * r + i * i >= 11:
                    break
                k += 1
                if k >= 111:
                    break
            sys.stdout.write(colors[k & 15])
        print


if __name__ == '__main__':
    main()
