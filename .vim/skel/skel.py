#!/usr/bin/env python
# coding: utf-8


import sys
import os

from logging import getLogger, StreamHandler, DEBUG


def main():
    pass


if __name__ == "__main__":
    logger = getLogger(__name__)
    handler = StreamHandler()
    handler.setLevel(DEBUG)
    logger.setLevel(DEBUG)
    logger.addHandler(handler)

    main()

