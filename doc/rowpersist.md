---
modulename: File
title: /rowpersist/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/rowpersist.md
weight: 200
---
# File module: Row exists

Check if a given row exists in a file   


## Example

```sh
space -m file /rowpersist/ -- "Text data" "/home/user/temporary_files/some_file.txt"
```

Exit status code is expected to be 0 on success.
