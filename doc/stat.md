---
modulename: File
title: /stat/
giturl: gitlab.com/space-sh/File
editurl: /edit/master/doc/stat.md
weight: 200
---
# File module: File stat

Retrieve details about the file based on customized formatting options.  


## Example

Return the file owner:
```sh
space -m file /stat/ -- "Spacefile.yaml" "%U"
```

Exit status code is expected to be 0 on success.
