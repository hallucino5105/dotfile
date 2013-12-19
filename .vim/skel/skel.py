#!/usr/bin/env python
# coding: utf-8


import sys
import os

sys.path.insert(0, os.path.expanduser("~/my_lib/myutil_py"))
from myutil import MyUtil


def main():
    pass


<<<<<<< HEAD
def merr(message, newline=True, flush=False):
    sys.stderr.write(message)
    if newline: sys.stderr.write("\n")
    if flush: sys.stderr.flush()


def mout(message, newline=True, flush=False):
    sys.stdout.write(message)
    if newline: sys.stdout.write("\n")
    if flush: sys.stdout.flush()


=======
>>>>>>> a8b97bcc253b98378b8f1905ca03da6b9f821c85
if __name__ == "__main__":
    main()

