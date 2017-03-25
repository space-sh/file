---
modulename: File
title: /chownr/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Change ownership

Change owner for an entire directory structure.  


## Example

```sh
space -m file /chownr/ -- "user" "/home/user/temporary_files/"
```

Exit status code is expected to be 0 on success.
