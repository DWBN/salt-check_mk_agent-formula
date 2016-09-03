# vim: sts=2 ts=2 sw=2 et ai ft=sls
{% from "check_mk_agent/map.jinja" import check_mk_agent with context %}


{% if salt['pillar.get']('check_mk_agent:plugins:nginx') %}

/etc/check_mk/nginx_status.cfg:
  file.managed:
    - source: salt://check_mk_agent/files/cfg/nginx_status.cfg
    - mode: 644

/usr/lib/check_mk_agent/plugins/nginx_status:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/nginx_status
    - mode: 755

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:mysql') %}

/etc/check_mk/mysql.cfg:
  file.managed:
    - source: salt://check_mk_agent/files/cfg/mysql.jinja
    - mode: 644
    - template: jinja

/usr/lib/check_mk_agent/plugins/mk_mysql:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/mk_mysql
    - mode: 755

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:apache') %}

/etc/check_mk/apache_status.cfg:
  file.managed:
    - source: salt://check_mk_agent/files/cfg/apache_status.cfg
    - mode: 644

/usr/lib/check_mk_agent/plugins/apache_status:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/apache_status
    - mode: 755

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:fileinfo') %}

/etc/check_mk/fileinfo.cfg:
  file.managed:
    - source: salt://check_mk_agent/files/cfg/fileinfo.jinja
    - mode: 644
    - template: jinja

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:haproxy') %}

/usr/lib/check_mk_agent/local/haproxy.py:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/haproxy.py
    - mode: 755

/usr/lib/check_mk_agent/local/haproxychecks.py:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/haproxychecks.py
    - mode: 755

{% endif %}
 
{% if salt['pillar.get']('check_mk_agent:plugins:postgres') %}

/usr/lib/check_mk_agent/plugins/mk_postgres:
  file.managed:
    - source: salt://check_mk_agent/files/plugins/mk_postgres
    - mode: 755

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:supervisor') %}

install-sensu-supervisor-gem:
  gem.installed:
    - names:
      - sensu-plugins-supervisor
      
{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:rabbitmq') %}

install-sensu-rabbitmq-gem:
  gem.installed:
    - names:
      - sensu-plugins-rabbitmq

{% endif %}

{% if salt['pillar.get']('check_mk_agent:plugins:check-http-ping') %}

install-sensu-http-gem:
  gem.installed:
    - names:
      - sensu-plugins-http

{% endif %}
