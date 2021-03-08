namespace: bbndemo.admin
flow:
  name: passwordReset
  inputs:
    - oldPassword:
        sensitive: true
    - newPassword:
        sensitive: true
    - repeatPassword:
        sensitive: true
    - username
  workflow:
    - check_new_passwords_are_equal:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${newPassword}'
            - second_string: '${repeatPassword}'
        publish: []
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
          - error_message
        navigate:
          - SUCCESS: change_password
          - FAILURE: on_failure
    - change_password:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: "${'ldappasswd -h '+get_sp('ldapHost')+' -p '+get_sp('ldapPort')+' -D uid='+username+',ou=users,o=bbndemo -x -w '+oldPassword+' -s '+newPassword}"
        publish:
          - result: '${return_result}'
          - error_message
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
      check_new_passwords_are_equal:
        x: 101
        'y': 93
      check_oldPassword:
        x: 281
        'y': 87
      change_password:
        x: 460
        'y': 93
        navigate:
          07a29203-dba6-629f-b00b-127fb8621cd0:
            targetId: b394e372-9f0d-db14-bee5-3ca3b44d3b89
            port: SUCCESS
    results:
      SUCCESS:
        b394e372-9f0d-db14-bee5-3ca3b44d3b89:
          x: 625
          'y': 86
