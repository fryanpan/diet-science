#!/bin/bash

# Run tsc to continue compiling in the background
node_modules/.bin/tsc -w &

# As of v6, this is a workaround to allow hot-reloading (with potential memory leaks)
# https://github.com/dherault/serverless-offline/issues/864
node_modules/.bin/serverless offline --useChildProcesses --config="serverless-offline.yml"
