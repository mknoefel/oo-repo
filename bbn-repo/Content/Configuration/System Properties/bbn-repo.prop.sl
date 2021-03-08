namespace: ''
properties:
  - ldapHost: swvm088.hpeswlab.net
  - ldapPort: '30389'
  - ldapAdmin: 'uid=admin,ou=system'
  - ldapPass:
      value: secret
      sensitive: true
  - swvm088Root:
      value: 'HPS0ftware!'
      sensitive: true
