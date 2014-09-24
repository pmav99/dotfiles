#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""

author: Panagiotis Mavrogiorgos
email : gmail, pmav99
"""

from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import

import sys

if sys.version_info.major < 3:
    from future_builtins import map, zip, hex, oct, filter, ascii

import argparse


def main():
    import packagename as package

    parser = argparse.ArgumentParser(
        description=package.__doc__,
        prog=package.__package_name__,
        epilog="")

    parser.add_argument('--version',
        action='version',
        version='%(prog)s ' + '%s' % package.__version__)

    options = parser.parse_args()

    # Call your program from here.

if __name__ == "__main__":
    main()
