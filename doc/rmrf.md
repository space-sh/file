---
modulename: File
title: /rmrf/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Remove recursively

Removes a given directory path recursively.


## Example

Removes `temporary_files` directory:
```sh
space -m file /rmrf/ -- "/home/user/temporary_files"
```

Exit status code is expected to be 0 on success.
