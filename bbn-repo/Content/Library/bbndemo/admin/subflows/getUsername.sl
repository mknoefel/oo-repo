namespace: bbndemo.admin.subflows
operation:
  name: getUsername
  inputs:
    - testme: eins
  python_action:
    use_jython: false
    script: |-
      def execute():
          username = "Markus"
  outputs:
    - username
  results:
    - SUCCESS