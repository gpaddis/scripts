#!/usr/bin/env python3
"""
Increment the current git repository version (major, minor or patch)
and push a tag to the repository.
See:
* https://gitpython.readthedocs.io/en/stable/tutorial.html
"""

import os
import sys
from datetime import datetime

from git import Repo


def get_latest_commit(repo, branch="master"):
    """Get the latest commit for the branch specified."""
    commit = repo.commit(branch)
    return {
        "id": commit,
        "author": commit.author,
        "date": datetime.fromtimestamp(commit.committed_date).strftime("%d/%m/%Y, %H:%M:%S"),
        "message": commit.message
    }


if __name__ == "__main__":
    try:
        repo = Repo(os.getcwd())
        assert not repo.bare
    except:
        print("Not a valid git repository.")
        sys.exit(1)

    last_master_commit = get_latest_commit(repo, "master")
    print(last_master_commit)
