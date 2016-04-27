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
import logging.config
import argparse


from project_name import Config, OptionsBase

__version__ = "0.1.0"


class Options(OptionsBase):
    def parse_arguments(self):
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
            dest="config_file",
            action='store',
            default="config.json",
            help='The location of the configuration file.',
        )
        options = parser.parse_args()
        return options


def main():
    pass


if __name__ == "__main__":
    # parse CLI options and the configuration file
    options = Options().initialize()
    config = Config().initialize(options.config_file)
    # initialize logging
    logging.config.dictConfig(config["logging"])
    logger = logging.getLogger().getChild(__name__)
    logger.info("Logging works OK")

    main()
