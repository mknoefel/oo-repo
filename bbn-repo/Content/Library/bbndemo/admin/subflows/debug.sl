namespace: bbndemo.admin.subflows
flow:
  name: debug
  workflow:
    - getTest:
        do:
          bbndemo.admin.subflows.getTest: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      getTest:
        x: 91.60000610351562
        'y': 129.60000610351562
        navigate:
          d3ff5fee-284a-e5d3-102f-519a5d0e049d:
            targetId: de24fc6e-98f5-743d-cc79-c1724889d8a2
            port: SUCCESS
    results:
      SUCCESS:
        de24fc6e-98f5-743d-cc79-c1724889d8a2:
          x: 306
          'y': 124
