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

import logging
import logging.config
import argparse


from project_name import Config, OptionsBase


class Options(OptionsBase):
    def parse_arguments(self):
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
            dest="config_file",
            action='store',
            default="config.json",
            help='The location of the configuration file.',
        )

        options = parser.parse_args()
        return options


def main():
    logger = logging.getLogger()
    logger.info("Logging works OK")


if __name__ == "__main__":
    options = Options()
    config = Config()
    # parse CLI options and the configuration file
    options.initialize()
    config.initialize(options.config_file)
    # initialize logging
    logging.config.dictConfig(config["logging"])

    main()
