---
modulename: File
title: /restorepermissions/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Restore permissions

Restores a list of directory permissions recursively.  


## Example

```sh
space -m file /restorepermissions/ -- "/home/user/temporary_files/" "755"
```

Exit status code is expected to be 0 on success.
