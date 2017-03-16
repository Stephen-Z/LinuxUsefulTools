#!/usr/bin/python
# -*- coding:utf-8 -*-
import os
from subprocess import Popen,PIPE

def main():
    list = os.listdir('./')
    #print list
    for l in list:
        p = Popen(['du', '-sh',l], stdin=PIPE, stdout=PIPE, stderr=PIPE)
        output, err = p.communicate()
        rc = p.returncode
        print output


if __name__ == '__main__':
    main()
