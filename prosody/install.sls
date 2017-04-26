# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "prosody/map.jinja" import prosody with context %}

prosody-server:
  pkg.installed:
    - name: {{prosody.package}}
