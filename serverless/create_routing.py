#!/usr/bin/env python

from itertools import takewhile, dropwhile, islice, imap, ifilter
import re
import yaml
import json
import sys

print "Creating routing table"

def slurp(name):
    """
    Read the file
    :param name: read the named file
    :return: the content
    """
    with open(name, "r") as f:
        return f.read()

def spit(name, content):
    if name == '-':
        print content
    else:
        with open(name, "w") as f:
            f.write(content)

s = slurp(sys.argv[1]).split()

s = dropwhile(lambda x: not x.startswith("endpoints:"), s)

s = islice(s, 1, None)

s = takewhile(lambda x: not x.startswith("functions:"), s)

def get_root_url(the_line):
    """
    Get the root URL from the line
    :param the_line: the line
    :return: either the root URL or None
    """
    ret = re.search('https://[^/]*/[^/]*/', the_line)
    if ret:
        return ret.group(0)

    return None

s = imap(get_root_url, s)

s = ifilter(lambda s: s, s)

the_roots = set(s)

if len(the_roots) == 0:
    print "No HTTP roots found"
    exit(1)
elif len(the_roots) > 1:
    print "Too many roots found ", the_roots
    exit(1)

root = the_roots.pop()

print "Root: ", root

the_yaml = slurp(sys.argv[2])

the_yaml = yaml.load(the_yaml)

ret = []

top_level = the_yaml.get("x-telegram-proxy-all")

if top_level:
    ret.append({"from": top_level,
                "to": root,
                "test_as_prefix": True,
                "append_uri": True,
                "trim_on_append": True
                })

the_functions = the_yaml.get("functions")

if the_functions:
    for k in the_functions:
        v = the_functions[k]
        events = v.get("events")
        if events:
            for ev in events:
                http = ev.get("http")
                if http:
                    e_path = http.get("path")
                    e_proxy = http.get("x-telegram-proxy")
                    if e_path and e_proxy:
                        ret.append({"from": e_proxy,
                                    "to": root + e_path,
                                    "test_as_prefix": False,
                                    "append_uri": False
                                    })

new_routing = {"proxy_pass": ret}

spit(sys.argv[3], json.dumps(new_routing, sort_keys=True, indent=2))

print "Saved routing table at ", sys.argv[3]