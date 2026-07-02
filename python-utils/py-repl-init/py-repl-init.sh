#!/usr/bin/env bash
# py-repl-init — REPL with common imports
set -euo pipefail
python3 -i -c "
import os, sys, json, re, math, time, datetime as dt, collections as c, itertools as it, functools as ft, pathlib as p
print('preloaded: os sys json re math time datetime collections itertools functools pathlib')
"
