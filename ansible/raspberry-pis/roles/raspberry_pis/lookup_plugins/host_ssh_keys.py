#!/usr/bin/python
# Copyright 2022 Google LLC.
# SPDX-License-Identifier: Apache-2.0
# -*- coding: utf-8 -*-

from __future__ import (absolute_import, annotations, division, print_function)

__metaclass__ = type

DOCUMENTATION = r"""
  name: host_ssh_keys
  author: Petr (@ppetr)
  short_description: Looks up gathered public SSH keys of given hosts
  description: For each given hostname scans its gathered facts
    'ansible_ssh_host_key_...' and produces a dictionary of these keys as well
    as a full 'known_hosts' snippet.
  seealso:
  - name: Use ansible_facts in module code
    link: https://stackoverflow.com/q/45074728/1333025
  notes:
  - Handling of custom SSH ports hasn't been tested at all.
"""
RETURN = r"""
  _list:
    description:
      List composed of dictonaries containing the available public SSH keys and
      the corresponding known_hosts snippet.
    type: list
    elements: complex
    contains:
      host:
        description: The original input host name.
        type: str
      keys:
        description: Available public SSH keys for the host indexed by the key
          type.
        type: dict
      known_hosts:
        description: A string with all the keys suitable for appending to
          .ssh/known_hosts.
        type: str
"""
EXAMPLES = r"""
- name: Add public keys of all inventory hosts to known_hosts
  ansible.builtin.known_hosts:
    path: /etc/ssh/ssh_known_hosts
    name: "{{ item.host }}"
    key: "{{ item.known_hosts }}"
  with_host_ssh_keys: "{{ ansible_play_hosts }}"
"""

import collections
from typing import (Dict, Generator, Tuple)
import re

from ansible.errors import AnsibleError
from ansible.module_utils.six import string_types
from ansible.plugins.lookup import LookupBase
from ansible.utils.display import Display

_display = Display()


class LookupModule(LookupBase):

    _PUBLIC_KEY_RE = re.compile(r"""ansible_ssh_host_key_(.*)_public""")

    @staticmethod
    def _extract_public_keys(
            host: str,
            hostvars: dict) -> Generator[Tuple[str, str], None, None]:
        for var, value in hostvars.items():
            _display.vvvvv("Examining variable '%s' for host '%s'" %
                           (var, host))
            match = LookupModule._PUBLIC_KEY_RE.fullmatch(var)
            if match:
                key_type = hostvars[var + "_keytype"]
                _display.vvvv(
                    "Found ssh public key for host '%s' of type '%s': %s" %
                    (host, key_type, value))
                yield (key_type, value)

    def run(self, terms, variables=frozenset(), **kwargs):
        ret = []
        for host in terms:
            if not isinstance(host, string_types):
                raise AnsibleError(
                    'Invalid setting identifier, "%s" is not a string, its a %s'
                    % (host, type(host)))
            _display.debug("Looking up ssh public keys of host '%s'" % host)
            keys: Dict[str, str] = collections.OrderedDict(
                LookupModule._extract_public_keys(host,
                                                  variables['hostvars'][host]))
            known_hosts: str = ''
            for key_type, key in keys.items():
                known_hosts += '%s %s %s\n' % (host, key_type, key)
            ret.append(dict(host=host, keys=keys, known_hosts=known_hosts))

        return ret
