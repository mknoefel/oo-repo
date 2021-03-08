namespace: bbndemo.admin.subflows
operation:
  name: viewInstalledPythonPackages
  python_action:
    use_jython: false
    script: |-
      def execute():
          import subprocess
          import sys
          out =  subprocess.run([sys.executable, "-m", "pip", "freeze"], capture_output=True)
          return {"installed_modules": out.stdout.decode()}
  results:
    - SUCCESS
