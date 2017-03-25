---
modulename: File
title: /getpermissions/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Get permissions

Read a directory recursively and list all permission modes.  


## Example

List all directory permissions with subdirectory depth of 1:
```sh
space -m file /getpermissions/ -- "/home/user/temporary_files/" "1"
```

Exit status code is expected to be 0 on success.
