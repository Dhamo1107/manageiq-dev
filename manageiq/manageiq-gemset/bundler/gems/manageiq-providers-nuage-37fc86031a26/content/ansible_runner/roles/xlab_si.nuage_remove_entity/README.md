Ansible Role: nuage-remove-entity
=========

This role allows you to remove any entity on Nuage server by ID.

Requirements
------------

```
pip install vspk
```

Role Variables
--------------

| Variable         | Default | Description |
|------------------|---------|-------------|
| nuage_auth       | /       | Nuage authentication object, see example below.
| entity_type      | /       | CamelCase name of entity that we're deleting e.g. Enterprise, Domain, Subnet, FloatingIp...
| id               | /       | ID of entity that we're deleting.

Dependencies
------------

This role depends on no other Galaxy role.

Example Playbook
----------------

Example where we remove Subnet with ID `adbfcb81-e0ab-4b7e-9e51-1b6c5e862bb9`:

```yaml
- hosts: localhost
  connection: local
  gather_facts: False
  vars:
    nuage_auth:
      api_username: user
      api_password: pass
      api_enterprise: csp
      api_url: https://my.nuage.net
      api_version: v5_0
    entity_type: Subnet
    id: adbfcb81-e0ab-4b7e-9e51-1b6c5e862bb9
  roles:
    - xlab_si.nuage_remove_entity
```

License
-------

BSD
