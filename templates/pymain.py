#!/usr/bin/env python
# -*- coding: utf-8 -*-
# module:
# author: Panagiotis Mavrogiorgos <pmav99,gmail>

"""
script description

"""

from __future__ import division
from __future__ import print_function
from __future__ import absolute_import

import logging
import argparse

__version__ = "0.1.0"


def parse_arguments():
    parser = argparse.ArgumentParser(
        description=__doc__,
        prog=__file__,
        epilog="")
    parser.add_argument(
        '--version',
        action='version',
        version=__version__,
    )
    parser.add_argument(
        '-c', '--config-file',
        action='store',
        help='The location of the configuration file.',
    )
    options = parser.parse_args()
    return options


def main():
    pass


if __name__ == "__main__":
    options = parse_arguments()
    logger = logging.getLogger().getChild(__name__)
    main()

