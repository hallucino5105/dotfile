#!/usr/bin/env python
# coding: utf-8


import sys
import os

sys.path.extend([
    "./my_lib/myutil_py",
    "/home/hoshino/my_lib/myutil_py",
    "/Users/hoshino/my_lib/myutil_py",
])
from myutil_py.myutil import myutil, mout, merr


def main():
    pass


if __name__ == "__main__":
    main()
