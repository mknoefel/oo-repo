namespace: bbndemo.admin.subflows
operation:
  name: getUsername
  inputs:
    - myName: eins
  python_action:
    use_jython: true
    script: |-
      username = getuid()
      error_message = "nok"
  outputs:
    - error_message
    - username
  results:
    - SUCCESS: '${error_message == ""}'
    - FAILURE
