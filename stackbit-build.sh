#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db6f977f686cd0012b4bff8/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db6f977f686cd0012b4bff8
curl -s -X POST https://api.stackbit.com/project/5db6f977f686cd0012b4bff8/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5db6f977f686cd0012b4bff8/webhook/build/publish > /dev/null
