---
modulename: File
title: /dirnotexist/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Check directory

Check if a given directory path does not exist.  

## Example

```sh
space -m file /dirnotexist/ -- "/home/user/temporary_files/"
```

Exit status code is expected to be 0 on success.
