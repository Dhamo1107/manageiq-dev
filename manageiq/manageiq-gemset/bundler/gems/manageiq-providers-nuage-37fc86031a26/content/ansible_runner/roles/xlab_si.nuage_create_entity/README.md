Ansible Role: nuage_create_entity
=========

This role allows you to create any entity on Nuage server and optionally assign it
to parent entity.

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
| entity_type      | /       | CamelCase name of entity that we're creating e.g. Enterprise, Domain, Subnet, FloatingIp...
| attributes       | /       | Desired attributes of the new entity.
| parent_type      | null    | CamelCase type of parent (optional)
| parent_id        | null    | ID of parent (optional)

Outputs
-------
This role sets following custom stats when run:

| Stats name       | Description |
|------------------|-------------|
| created_entity   | Created entity hash
 

Dependencies
------------

This role depends on no other Galaxy role.

Example Playbook
----------------

Example where we create Enterprise with name `DEMO`:

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
    entity_type: Enterprise
    attributes:
      name: DEMO
  roles:
    - xlab_si.nuage_create_entity
```

Example where we create Subnet with name `DEMO` and connect it to parent Domain
with ID `ebd14a5e-a2cd-4302-bb04-89e2f4a827fe`:

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
    attributes:
      name: DEMO
    parent_type: Domain
    parent_id: ebd14a5e-a2cd-4302-bb04-89e2f4a827fe
  roles:
    - xlab_si.nuage_create_entity
```

License
-------

BSD
