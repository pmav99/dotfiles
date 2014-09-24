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

import os.path as osp
import logging
import argparse

logger = logging.getLogger(osp.relpath(__file__))

LOGGING_LEVELS = {
    'critical': logging.CRITICAL,
    'error': logging.ERROR,
    'warning': logging.WARNING,
    'info': logging.INFO,
    'debug': logging.DEBUG}


def main():
    import packagename as package

    parser = argparse.ArgumentParser(
        description=package.__doc__,
        prog=package.__package_name__,
        epilog="")

    parser.add_argument('--version',
        action='version',
        version='%(prog)s ' + '%s' % package.__version__)

    parser.add_argument("-l",
        help="Logging level",
        default="error",
        dest="logging_level",
        choices=("debug", "info", "warning", "error", "critical"))

    parser.add_argument("-f",
        help="Logging file name",
        dest="logging_filename")

    options = parser.parse_args()
    logging_level = LOGGING_LEVELS[options.logging_level]
    logging_filename = options.logging_filename

    logging.basicConfig(
        level=logging_level,
        filename=logging_filename,
        datefmt='%Y-%m-%d %H:%M:%S',
        #format='%(asctime)s %(name)s %(levelname)s: %(message)s')
        format='%(name)s %(levelname)s: %(message)s')

    # Logging examples
    #logger.debug("This is a debug message.")
    #logger.info("This is an info message.")
    #logger.warning("This is an warning message.")
    #logger.error("This is an error message.")
    #logger.critical("This is a critical message.")

    # Call your program from here.

if __name__ == "__main__":
    main()
