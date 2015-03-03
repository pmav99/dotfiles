#!/usr/bin/env python
# -*- coding: utf-8 -*-
# author: Panagiotis Mavrogiorgos
# email: gmail, pmav99

"""
script description

"""

from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import

import os.path as osp
import logging
import argparse


def parse_arguments():
    parser = argparse.ArgumentParser(
        description=__doc__,
        prog=__file__,
        epilog="")

    parser.add_argument(
        '--version',
        action='version',
        version='%(prog)s',
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
    main()

