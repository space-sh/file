---
modulename: File
title: /realpath/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/realpath.md
weight: 200
---
# File module: Absolute file or directory path (real path)

Retrieves the file or directory absolute path.  


## Example

Figures out the absolute path of a given input file:
```sh
space -m file /realpath/ -e path="../Spacefile.yaml"
```

Exit status code is expected to be 0 on success.
