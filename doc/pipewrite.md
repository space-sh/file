---
modulename: File
title: /pipewrite/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/pipewrite.md
weight: 200
---
# File module: Pipe write

Write to a file from `stdin`.  


## Example

```sh
space -m file /pipewrite/ -- "/home/user/temporary_files/output.txt"
```

Exit status code is expected to be 0 on success.
