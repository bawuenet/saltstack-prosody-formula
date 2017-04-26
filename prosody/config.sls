# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "prosody/map.jinja" import prosody with context %}

prosody-config-augeas:
  augeas.change:
    - context: /files/etc/prosody/prosody.cfg.lua
    - changes:
      - set c2s_require_encryption {{prosody.c2s_encryption}}
      - set s2s_secure_auth {{prosody.s2s_sec_auth}}
#    - watch_in:
#      - service: prosody

/etc/prosody/prosody.cfg.lua:
  file.uncomment:
    - char: --
    - regex: s2s_insecure_domains
#    - watch_in:
#      - service: prosody

/etc/prosody/conf.avail/xmpp.{{prosody.vhost}}.cfg.lua:
  file.managed:
    - template: jinja
    - source: salt://prosody/files/vhost.cfg.lua.jinja
    - mode: 755
    - require:
      - pkg: prosody
#    - watch_in:
#      - service: prosody
