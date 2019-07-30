#!/usr/bin/env python3
"""
Increment the current git repository version (major, minor or patch)
and push a tag to the repository.
"""

import os
import sys

from git import Repo

try:
    repo = Repo(os.getcwd())
    assert not repo.bare
except:
    print("Not a valid git repository.")
    sys.exit(1)