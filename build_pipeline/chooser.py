#!/usr/bin/env python

import os
import json

pipeline = []

ret = {'version': 1.0, 'pipeline': pipeline}

renderer = {}

pipeline.append(renderer)

# is it a Hugo repo
if os.path.isfile("/input/main/config.toml"):
    renderer['docker'] = 'opentelegram/hugo:latest'

# How about Jekyll
elif os.path.isfile("/input/main/_config.yml") or \
        os.path.isfile("/input/main/Gemfile"):
    renderer['docker'] = 'opentelegram/jekyll:latest'

# How about Gatsby
elif os.path.isfile("/input/main/gatsby-config.js"):
    renderer['docker'] = 'opentelegram/gatsby:latest'

# How about Hoisted
elif os.path.isfile("/input/main/_extra_info.md") or \
        os.path.isdir("/input/main/templates-hidden") or \
        os.path.isfile("/input/main/index.md"):
    renderer['docker'] = 'opentelegram/hoisted:latest'

else:
    renderer['docker'] = 'opentelegram/passthru:latest'

# Let's see if there's a serverless component?
if os.path.isdir("/input/main/_serverless"):
    # yes... append the serverless renderer
    pipeline.append({'docker': 'opentelegram/serverless:latest',
                     'secrets': ["serverless_conf"]})
    # And tell the coordinator to move the _serverless directory to the
    # /input directory. This way, it won't be considered during rendering
    ret['move_to_input_root'] = [{'from': "main/_serverless", 'to': 'serverless'}]

with open('/output/pipeline.json', 'w') as f:
    json.dump(ret, f,
              sort_keys=True,
              indent=2,
              separators=(',', ': '))
