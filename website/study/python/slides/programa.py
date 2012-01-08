#!/usr/bin/env python
# -*- coding: utf-8 -*-
# iso-8859-13 aka "latin-7"
import sys

def main():
    # sys.argv[0] == 'programa.py'
    if len(sys.argv) < 3:
        sys.exit("nurodyk du failų vardus")
    input_file_name = sys.argv[1]
    output_file_name = sys.argv[2]
    if output_file_name == '-':
        output = sys.stdout
    else:
        output = file(output_file_name, 'w')
    for line in file(input_file_name):
        print >> output, line.rstrip('\n')[::-1]

if __name__ == '__main__':
    main()
