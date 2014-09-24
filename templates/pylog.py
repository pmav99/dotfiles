#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""

author: Panagiotis Mavrogiorgos
email : gmail, pmav99
"""

from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import

if sys.version_info.major < 3:
    from future_builtins import map, zip, hex, oct, filter, ascii

import os.path as osp
import logging

logger = logging.getLogger(osp.relpath(__file__))
