---
modulename: File
title: /cp/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Copy

Copies a local file from one place to another.  


## Example

```sh
space -m file /cp/ -- "/home/user/temporary_files/some_file.txt" "/home/user/temporary_files/copy.txt"
```

Exit status code is expected to be 0 on success.
