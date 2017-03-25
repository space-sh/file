---
modulename: File
title: /appendrow/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Append row

Append a text row to a file.  

## Example

```sh
space -m file /appendrow/ -- "Text data" "/home/user/temporary_files/some_file.txt"
```

Exit status code is expected to be 0 on success.
