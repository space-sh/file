---
modulename: File
title: /grepcount/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/grepcount.md
weight: 200
---
# File module: Grep and count

_Grep_ a file against a matching pattern and try to match a given count parameter.

## Example

```sh
space -m file /grepcount/ -- "Pattern" "/home/user/temporary_files/some_file.txt" "2"
```

Exit status code is expected to be 0 on success.
