#!/bin/bash
# Output a launch.json file to debug Rails applications with VS Code.

set -e

for GEM in ruby-debug-ide debase
do
    if [[ -z $(grep $GEM Gemfile) && -z $(grep $GEM *.gemspec 2>/dev/null) ]]; then
	    echo "The required gem '$GEM' is not installed. Add it to your Gemfile and run the script again."
	    echo "Check out this link for detailed installation instructions:"
        echo "https://github.com/microsoft/vscode-recipes/tree/master/debugging-Ruby-on-Rails"
        exit 1
    fi
done

BUNDLE_PATH=`rbenv which bundle`
RSPEC_PATH=`rbenv which rspec`
RBDEBUG_IDE_PATH=`bundle info ruby-debug-ide --path`

cat << EOF
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Start Rails server",
            "type": "Ruby",
            "request": "launch",
            "cwd": "\${workspaceRoot}",
            "program": "\${workspaceRoot}/bin/rails",
            "args": [
                "server",
                "-p",
                "3000"
            ]
        },
        {
            "name": "Debug Rails server",
            "type": "Ruby",
            "request": "launch",
            "cwd": "\${workspaceRoot}",
            "useBundler": true,
            "pathToBundler": "$BUNDLE_PATH",
            "pathToRDebugIDE": "$RBDEBUG_IDE_PATH",
            "program": "\${workspaceRoot}/bin/rails",
            "args": [
                "server",
                "-p",
                "3000"
            ]
        },
        {
            "name": "Run RSpec - all",
            "type": "Ruby",
            "request": "launch",
            "cwd": "\${workspaceRoot}",
            "program": "$RSPEC_PATH",
            "args": [
                "--pattern",
                "\${workspaceRoot}/spec/**/*_rspec.rb"
            ]
        },
        {
            "name": "Debug RSpec - open spec file",
            "type": "Ruby",
            "request": "launch",
            "cwd": "\${workspaceRoot}",
            "useBundler": true,
            "pathToBundler": "$BUNDLE_PATH",
            "pathToRDebugIDE": "$RBDEBUG_IDE_PATH",
            "debuggerPort": "1235",
            "program": "$RSPEC_PATH",
            "args": [
                "\${file}"
            ]
        },
        {
          "name": "Debug RSpec - open spec file on a certain line",
          "type": "Ruby",
          "request": "launch",
          "cwd": "\${workspaceRoot}",
          "useBundler": true,
          "pathToBundler": "$BUNDLE_PATH",
          "pathToRDebugIDE": "$RBDEBUG_IDE_PATH",
          "debuggerPort": "1235",
          "program": "$RSPEC_PATH",
          "args": ["\${file}:\${lineNumber}"]
        }
    ]
}
EOF
