namespace: bbndemo.admin.subflows
operation:
  name: getTest
  python_action:
    use_jython: false
    script: "# do not remove the execute function \ndef execute():\n    import getpass\n    username = \"mike\"+getpass.getuser()\n    \n    return locals()"
  outputs:
    - username
  results:
    - SUCCESS
