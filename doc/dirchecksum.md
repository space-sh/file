---
modulename: File
title: /dirchecksum/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/dirchecksum.md
weight: 200
---
# File module: Directory checksum

Retrieve the checksum for a given directory and its content (recursively).  


## Example

Calculate the checksum for the current directory:
```sh
space -m file /dirchecksum/ -e dir=$PWD
```

Exit status code is expected to be 0 on success.
