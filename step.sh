#!/bin/bash
set -ex

npm install -g appium@${appium_version} --unsafe-perm=true --allow-root

if [ ${appium_version} = "next" ]
then
   appium driver install xcuitest
   appium driver install espresso
   appium driver install flutter
fi

appium --log appium.log &>/dev/null &

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
