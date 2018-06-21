#!/usr/bin/env python
# coding: utf-8

from __future__ import (
  print_function, unicode_literals, absolute_import, generators, division)

from logging import (
  StreamHandler, getLogger, Formatter, DEBUG, INFO, WARNING, ERROR, CRITICAL)

import sys
import os


def main():
  pass


logger = getLogger(sys.argv[0] + __name__)
handler = StreamHandler()
#from rainbow_logging_handler import RainbowLoggingHandler
#handler = RainbowLoggingHandler(sys.stdout, color_asctime=("yellow", None, False))
handler.setFormatter(Formatter("[%(asctime)s](%(levelname)s) %(message)s"))
logger.setLevel(DEBUG)
logger.addHandler(handler)
logger.propagate = True

if __name__ == "__main__":
  main()
