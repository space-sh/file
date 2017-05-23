---
modulename: File
title: /cat/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/cat.md
weight: 200
---
# File module: Cat

Concatenate and print files.  


## Example

Cat a single file:
```sh
space -m file /cat/ -- "/home/user/temporary_files/some_file.txt"
```

Cat multiple files:
```sh
space -m file /cat/ -- "/home/user/temporary_files/some_file.txt" "/home/user/temporary_files/other_file.txt"
```

Exit status code is expected to be 0 on success.
