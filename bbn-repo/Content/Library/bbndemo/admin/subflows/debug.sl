namespace: bbndemo.admin.subflows
flow:
  name: debug
  workflow:
    - getUsername:
        do:
          bbndemo.admin.subflows.getUsername: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      getUsername:
        x: 78.60000610351562
        'y': 123.60000610351562
        navigate:
          8f09fbe9-3bf4-0193-0f18-0f37e2d7005b:
            targetId: de24fc6e-98f5-743d-cc79-c1724889d8a2
            port: SUCCESS
    results:
      SUCCESS:
        de24fc6e-98f5-743d-cc79-c1724889d8a2:
          x: 272
          'y': 120
