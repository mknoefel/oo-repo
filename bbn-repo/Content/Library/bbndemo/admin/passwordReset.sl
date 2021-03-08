namespace: bbndemo.admin
flow:
  name: passwordReset
  inputs:
    - oldPassword:
        default: admin@123
        sensitive: true
    - newPassword:
        default: admin@124
        sensitive: true
    - repeatPassword:
        default: admin@124
        sensitive: true
    - username: testuser
  workflow:
    - check_new_passwords_are_equal:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${newPassword}'
            - second_string: '${repeatPassword}'
        publish:
          - result: password mismatch
        navigate:
          - SUCCESS:
              next_step: check_oldPassword
              ROI: '1'
          - FAILURE: on_failure
    - check_oldPassword:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: "${'ldapwhoami -vvv -h '+get_sp('ldapHost')+' -p '+get_sp('ldapPort')+' -D uid='+username+',ou=users,o=bbndemo -x -w '+oldPassword}"
        publish:
          - result: could not authenticate
        navigate:
          - SUCCESS:
              next_step: run_command
              ROI: '1'
          - FAILURE: on_failure
    - run_command:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: "${'ldappasswd -h '+get_sp('ldapHost')+' -p '+get_sp('ldapPort')+' -D uid='+username+',ou=users,o=bbndemo -x -w '+oldPassword+' -s '+newPassword}"
        publish:
          - result: '${return_result}'
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '1'
          - FAILURE: on_failure
  outputs:
    - result
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      run_command:
        x: 460
        'y': 93
        navigate:
          07a29203-dba6-629f-b00b-127fb8621cd0:
            targetId: b394e372-9f0d-db14-bee5-3ca3b44d3b89
            port: SUCCESS
      check_new_passwords_are_equal:
        x: 101
        'y': 93
      check_oldPassword:
        x: 281
        'y': 87
    results:
      SUCCESS:
        b394e372-9f0d-db14-bee5-3ca3b44d3b89:
          x: 625
          'y': 86