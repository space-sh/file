---
modulename: File
title: /chmod/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Change modes

Set file permissions.

## Example

Change mode using octal notation:
```sh
space -m file /chmod/ -- "555" "/home/user/temporary_files/some_file.txt"
```

Change mode using symbolic notation:
```sh
space -m file /chmod/ -- "+x" "/home/user/temporary_files/script.sh"
```

Exit status code is expected to be 0 on success.
