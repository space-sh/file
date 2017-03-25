---
modulename: File
title: /sed/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Sed

_Sed_ a given pattern in place.  


## Example

```sh
space -m file /sed/ -- "Pattern" "/home/user/temporary_files/some_file.txt"
```

Exit status code is expected to be 0 on success.
