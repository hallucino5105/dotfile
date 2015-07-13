#!/usr/bin/env python
# coding: utf-8


import sys
import os


try:
    sys.path.extend([
        "./my_lib/python",
        "/home/hoshino/my_lib/python",
        "/Users/hoshino/my_lib/python",
    ])
    from myutil.myutil import myutil, mout, merr
except ImportError:
    pass


def main():
    pass


if __name__ == "__main__":
    main()
