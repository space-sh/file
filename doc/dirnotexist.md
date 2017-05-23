---
modulename: File
title: /dirnotexist/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/dirnotexist.md
weight: 200
---
# File module: Check directory

Check if a given directory path does not exist.  

## Example

Check if a single directory does not exist:
```sh
space -m file /dirnotexist/ -- "/home/user/temporary_files/"
```

Check if a list of directories do not exist:
```sh
space -m file /dirnotexist/ -- "/home/user/temporary_files/" "/tmp" "/opt/my_documents"
```

Exit status code is 0 when none of the directories are found.
