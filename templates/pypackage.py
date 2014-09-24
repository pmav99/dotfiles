#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Package description

author: Panagiotis Mavrogiorgos
email : gmail, pmav99
"""

from __future__ import division
from __future__ import print_function
from __future__ import absolute_import
from __future__ import unicode_literals

import sys

if sys.version_info.major < 3:
    from future_builtins import map, zip, hex, oct, filter, ascii

# Version
__major__ = 0  # for major interface/format changes
__minor__ = 1  # for minor interface/format changes
__release__ = 0  # for tweaks, bug-fixes, or development

# package information
__package_name__ = "foobar"
__package_description__ = __doc__
__version__ = "%d.%d.%d" % (__major__, __minor__, __release__)
__license__ = "BSD"
__url__ = "http://bitbucket.org/pmav99/%s" % __package_name__
__download_url__ = "http://bitbucket.org/pmav99/%s/downloads" % __package_name__
__author__ = "Panagiotis Mavrogiorgos"
__author_email__ = "gmail pmav99"
