---
modulename: File
title: /rowexist/
giturl: gitlab.com/space-sh/File
weight: 200
---
# File module: Row exists

Check if a given row exists or not in a file   


## Example

Check a given text input exists inside a file:
```sh
space -m file /rowexist/ -- "Text data" "/home/user/temporary_files/some_file.txt"
```

Conversely, it is possible to check the same text is not present in the same file with:
```sh
space -m file /rowexist/ -- "Text data" "/home/user/temporary_files/some_file.txt" "0"
```

Exit status code is expected to be 0 on success.
