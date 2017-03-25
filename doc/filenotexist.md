---
modulename: File
title: /filenotexist/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Check file

Check if a given file does not exist.  

## Example

```sh
space -m file /filenotexist/ -- "/home/user/temporary_files/some_file.txt"
```

Exit status code is expected to be 0 on success.
