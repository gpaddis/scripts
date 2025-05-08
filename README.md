# Scripts

A collection of useful bash and python scripts. This README provides an overview of each script's purpose and usage.

## Overview

### apachelog-digest.sh

Parses Apache access.log files and outputs the number of requests per minute or hour.

**Usage:**

```bash
apachelog-digest.sh access.log       # Count by minute
apachelog-digest.sh access.log hour  # Count by hour
```

### benchmark-url.sh

Measures response times for a URL with and without cache (using Magento's no_cache parameter).

**Usage:**

```bash
benchmark-url.sh "https://www.example.com/"
```

### bundle-exec.sh

Runs bundle exec commands with a different database for each git branch, using the branch name as the database name (if Rails' `database.yml` is configured accordingly).

**Usage:**

```bash
bundle-exec.sh rails c
```

### excerpt.sh

Extracts lines between two search terms in a file and outputs them to STDOUT.

**Usage:**

```bash
excerpt.sh access.log "26/Jun/2019:17" "26/Jun/2019:21" > excerpt.log
```

### fixup

Creates a fixup commit for a selected commit and automatically squashes it using interactive rebase.

**Usage:**

```bash
fixup  # Interactive selection of commit to fixup
```

### missing-constants

Rails runner script that scans all Ruby files in a Rails repository, collects referenced constants, and checks if they are defined according to Rails autoloading and Ruby constant resolution rules.

**Usage:**

```bash
./missing-constants  # Run in a Rails project directory
```

### open-in-gitlab.sh

Opens the current git repository in GitLab with the selected branch. Optionally opens a specific file.

**Usage:**

```bash
open-in-gitlab.sh           # Open current directory in GitLab
open-in-gitlab.sh file.rb   # Open specific file in GitLab
```

### pwnedpass.py

Checks if a password has been compromised by querying the Have I Been Pwned API.

**Usage:**

```bash
python3 pwnedpass.py  # Will prompt for password input
```

### rebase-interactive

Interactively rebases on the parent commit of the one selected using fzf for selection.

**Usage:**

```bash
rebase-interactive  # Interactive selection of commit
```

### rebase-onto

Rebases the current branch onto a selected branch, starting from the parent of a selected commit.

**Usage:**

```bash
rebase-onto  # Interactive selection of branch and commit
```

### worktree-add

Creates a git worktree in a directory above the current repository, named after the repository and branch.

**Usage:**

```bash
worktree-add feature-branch  # Creates ../repo-name-feature-branch
```

## Dependencies

The file `requirements.txt` contains the libraries required by the Python scripts.
