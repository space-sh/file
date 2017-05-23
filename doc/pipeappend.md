---
modulename: File
title: /pipeappend/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/pipeappend.md
weight: 200
---
# File module: Pipe append

Append to a file from `stdin`.  


## Example

```sh
space -m file /pipeappend/ -- "/home/user/temporary_files/output.txt"
```

Exit status code is expected to be 0 on success.
