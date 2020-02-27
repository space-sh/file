---
modulename: File
title: /dirchecksumcontent/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/dirchecksumcontent.md
weight: 200
---
# File module: Directory contents checksum

Retrieve the checksum based on all the contents in a given directory (recursively).  


## Example

Calculate the checksum of all the contents in the current directory:
```sh
space -m file /dirchecksumcontent/ -e dir=$PWD
```

Exit status code is expected to be 0 on success.
