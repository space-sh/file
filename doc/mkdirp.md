---
modulename: File
title: /mkdirp/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/mkdirp.md
weight: 200
---
# File module: Make directory path

Create a given directory path, including all its subdirectories.

## Example

```sh
space -m file /mkdirp/ -- "/home/user/temporary_files/docs"
```

Exit status code is expected to be 0 on success.
