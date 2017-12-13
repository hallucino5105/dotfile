#!/usr/bin/env python
# coding: utf-8


import sys
import os

from logging import getLogger, StreamHandler, Formatter, DEBUG


logger = None


def main():
    pass


logger = getLogger(sys.argv[0] + __name__)
handler = StreamHandler()
handler.setLevel(DEBUG)
handler.setFormatter(Formatter("[%(asctime)s](%(levelname)s) %(message)s"))
logger.setLevel(DEBUG)
logger.addHandler(handler)

if __name__ == "__main__":
    main()

