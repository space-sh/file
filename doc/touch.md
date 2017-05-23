---
modulename: File
title: /touch/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/touch.md
weight: 200
---
# File module: Touch

Touch one or more files.  


## Example

Touch a single file:
```sh
space -m file /touch/ -- "/home/user/temporary_files/some_file.txt"
```

Touch a list of file:
```sh
space -m file /touch/ -- "/home/user/temporary_files/some_file.txt" "/home/user/temporary_files/another_file.txt"
```

Exit status code is expected to be 0 on success.
