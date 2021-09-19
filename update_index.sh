#!/bin/bash

ls -t note/*.md | xargs grep -m 1 -E "^# " | xargs -L 1 sh -c 'x="$0 $@" && echo "" && echo [${x#*.md:# }]\(${x%%.md*}\)' > index.md
