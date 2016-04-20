OULibraries.centos7
=========

User management role for OULib.

Requirements
------------

A target system running CentOS7x.

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
