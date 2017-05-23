---
modulename: File
title: /filenotexist/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/filenotexist.md
weight: 200
---
# File module: Check file

Check if a given file does not exist.  

## Example

Check if a single file does not exist:
```sh
space -m file /filenotexist/ -- "/home/user/temporary_files/some_file.txt"
```

Check if a list of files do not exist:
```sh
space -m file /filenotexist/ -- "/home/user/temporary_files/some_file.txt" "/tmp/output.txt"
```

Exit status code is expected to be 0 when none of the listed files were found.
