Jenkins
========

A simple base installation of Jenkins

Requirements
------------

This role installs the `python-httplib2` package for the use of the `uri` module.

Role Variables
--------------

### Default Variables

* `jenkins_web_port1` -- The port Jenkins listens on. (Default `8080`)

* `jenkins_uri` -- URI *WITHOUT* the trailing slash. (Default `http://localhost`)

* `disable_plugins` -- An array of plugin names to disable. Should be the same as the filename in `/var/lib/jenkins/plugins` *WITHOUT* the extension. (Default ( `translation` )

Dependencies
------------

### `goozbach.EPEL`
This role requires `goozbach.EPEL` and due to that role not currently having EL5 support this role doesn't either.
This will be fixed when `goozbach.EPEL` is updated.

License
-------
GPLv2

Other Information
-----------------

### Reload Handler
It may seem silly to use the `url` module in the reload handler, but this is the safe restart option for Jenkins and will wait until all current tasks are finished before restarting the service.
This will also make the reload more cross-platform friendly.

Author Information
------------------

Derek Carter <derek@goozbach.com>
Goozbach Infrastructure Solutions LLC http://goozbach.com
