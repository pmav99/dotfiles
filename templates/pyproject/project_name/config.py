#!/usr/bin/env python
# -*- coding: utf-8 -*-
# module: project_name/config.py
# author: Panagiotis Mavrogiorgos <pmav99,gmail>

""" Configuration (files, CLI etc) """

from __future__ import division
from __future__ import print_function
from __future__ import absolute_import

import os
import abc
import json
import codecs
import logging
import collections

from pprint import pformat


class MutableMapping(collections.MutableMapping):
    """
    A dictionary subclass that for all apparent uses behaves like a dictionary!

    http://stackoverflow.com/a/3387975/592289

    """

    def __init__(self, *args, **kwargs):
        self.update(dict(*args, **kwargs))

    def __getitem__(self, key):
        return self.__dict__[key]

    def __setitem__(self, key, value):
        self.__dict__[key] = value

    def __delitem__(self, key):
        del self.__dict__[key]

    def __iter__(self):
        return iter(self.__dict__)

    def __len__(self):
        return len(self.__dict__)

    def __repr__(self):
        """ Pretty printing is nice! """
        return pformat({k: v for k, v in self.__dict__.items() if not k.startswith("_")})


class ImmutableMapping(collections.Mapping):
    """
    A read-only dictionary.

    http://stackoverflow.com/a/3387975/592289

    """
    def __getitem__(self, key):
        return self.__dict__[key]

    def __iter__(self):
        return iter(self.__dict__)

    def __len__(self):
        return len(self.__dict__)

    def __repr__(self):
        """ Pretty printing is nice! """
        return pformat({k: v for k, v in self.__dict__.items() if not k.startswith("_")})


class Borg(object):
    """
    Borg instances share the same state among all their instances.

    If we need to subclass a Borg, and we want the subclasses' instances to have
    a different state then the subclass must redefine `_shared_state`!

    """
    _shared_state = {}

    def __new__(cls, *args, **kwargs):
        instance = super(Borg, cls).__new__(cls, *args, **kwargs)
        instance.__dict__ = cls._shared_state
        return instance


class ImmutableBorg(Borg, ImmutableMapping):
    """
    Things that should be noted about this class::

        * it implements the interface of a read-only (i.e. immutable)
          dictionary

        * it is a `Borg()`.  This means that you may instantiate as many
          instances as you want but they are all going to share the
          same state (i.e. they will share the same `__dict__`).

    """
    _shared_state = {}


class Config(ImmutableBorg):
    """
    A class whose purpose is to hold the application's configuration.

    When you first instantiate this class (or each subclasses) the
    `_shared_state` dictionary is going to initially be empty. In order
    to populate it you must call the `initialize()` method.

    """

    _shared_state = {}

    def initialize(self, json_file, debug=True):
        """"
        Parse the given JSON file and populate this class' `_shared_state`.

        The reason we separate instance creation from data population
        is that we want to make instance creation as light-weight
        as possible.

        When we have a lot of possible configurations, it is often useful
        to know the exact location of the configuration file. There are
        applications though where we may not want to "pollute" stdout.
        If that is the case, we should set `debug` to `False`.

        """
        if debug:
            # The loggers configured here will be disabled later on when
            # we properly configure logging.
            logging.basicConfig(level="INFO")
            logging.info("configuration file: %s", os.path.abspath(json_file))

        # parse the json file and populate the instance dictionary.
        with codecs.open(json_file, "r", "utf-8") as fd:
            self._shared_state.update(json.load(fd))

        # Allows to write this:
        #     config = Config().initialize(json_file)
        return self


class OptionsBase(ImmutableBorg):
    """

    Subclasses must implement the `parse_arguments()` method.

    The `parse_arguments()` method must return either a dictionary or
    a class instance (e.g. returned by `argparse.ArgumentParser.parse_args()`)

    """
    _shared_state = {}

    def initialize(self):
        """"
        Parse the CLI arguments and populate this class' `_shared_state`.

        The reason we separate instance creation from data population
        is that we want to make instance creation as light-weight
        as possible.

        """
        d = self.__dict__
        cli_args = self.parse_arguments()
        d.update({key: value for key, value in cli_args.__dict__.items()})
        #if isinstance(cli_args, dict):
            #d.update(cli_args)
        #else:
        return self

    @abc.abstractmethod
    def parse_arguments(self, *args, **kwargs):
        raise NotImplementedError("Subclasses must implement `.parse_arguments()` themselves.")
