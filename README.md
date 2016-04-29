OULibraries.centos7
=========

User management role for OULib. This role makes changes to ssh config and sudoers config.

Requirements
------------

A target system running CentOS/RHEL or Ubuntu 

Role Variables
--------------

You'll need to define one or more users in the 'users' var. eg.

```
users:
  - name: 'centos'
    groups: 'wheel'
    pubkey: 'ssh-rsa somepubkey centos@example.org'
  - name: 'centos1'
    groups: 'wheel'
    pubkey: 'ssh-rsa anotherpubkey centos@example.org'
```

You'll also need to define one or more ssh brokers in the 'ssh_brokers' var, eg.
Note that dn suffix is the domain name space for the servers you will reach through the broker.

```
ssh_brokers:
  - alias: 'mybroker'
    ip: '192.168.1.2'
    dn_suffix: 'example.org'
```

Dependencies
------------

Example Playbook
----------------

License
-------

To be determined

Author Information
------------------

Jason Sherman
