---
modulename: File
title: /direxist/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/direxist.md
weight: 200
---
# File module: Check directory

Check if a given directory path exists.  

## Example

Check if a single directory exists:
```sh
space -m file /direxist/ -- "/home/user/temporary_files/"
```

Check if a list of directories exist:
```sh
space -m file /direxist/ -- "/home/user/temporary_files/" "/home/user/another_directory" "/home/user/"
```

Exit status code is expected to be 0 when successfully found all directories.
