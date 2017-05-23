---
modulename: File
title: /fileexist/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/fileexist.md
weight: 200
---
# File module: Check file

Check if a given file exists.  

## Example

Check if a single file exists:
```sh
space -m file /fileexist/ -- "/home/user/temporary_files/some_file.txt"
```

Check if a list of files exist:
```sh
space -m file /fileexist/ -- "/home/user/temporary_files/some_file.txt" "/tmp/output.txt"
```

Exit status code is expected to be 0 when successfully found all files.
