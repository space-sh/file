# File module | [![build status](https://gitlab.com/space-sh/file/badges/master/build.svg)](https://gitlab.com/space-sh/file/commits/master)

Handles file operations, including creating, searching, setting permissions and removing files.



## /appendrow/
	Append row to file


## /cat/
	Cat a file

	Cat file
	


## /chmod/
	Set file permissions

	chmod file or directory.
	


## /chownr/
	Change owner recursively

	chown -r directory.
	


## /cp/
	Copy a file

	Copies a file within same system.
	This does not copy file from or to a
	remote system, use /cat/ and /pipewrite/
	for that.
	


## /direxist/
	Check so a directory path does exist

	If the directory does not exist, exit with error.
	


## /dirnotexist/
	Check so that a directory path does not exist

	If the directory does exist, exit with error.
	


## /fileexist/
	Check so a file path does exist

	If the file does not exist, exit with error.
	


## /filenotexist/
	Check so a file path does not exist

	If the file does exist, exit with error.
	


## /getpermissions/
	Get recursive list of permissions


## /grep/
	Grep file for pattern


## /grepcount/
	Grep and match count

	Grep a file against pattern and expect the given count
	to match by an operator or else exit with error, as:
	    matched -operator count
	


## /ls/
	List a file

	List one or more files.
	


## /mkdirp/
	Create a directory path

	mkdir -p.
	


## /pipeappend/
	Append to a file from stdin


## /pipewrite/
	Write data to file read from stdin


## /restorepermissions/
	Restore list of permissions

	Take a string of permission retrieved from
	/getpermissions/ and restore them from within
	the base directory.
	


## /rmrf/
	Forcefully remove a file or directory recursively

	rm -rf a directory.
	


## /rowexist/
	Check if a row exists in a file

	Look in the file and see if the row exists there,
	if not exit with error.
	Set exist to 0 to invert the exit status.
	


## /rowpersist/
	Make sure that a specific row exists in a file

	Look in the file if the row does already exist,
	if not append it to the file.
	


## /sed/
	Sed a pattern in place


## /stat/
	Display file status

	stat -c.
	


## /touch/
	Touch a file


# Functions 

## FILE\_DEP\_INSTALL()  
  
  
  
Check for module dependencies  
  
### Returns:  
- non-zero on failure  
  
  
  
## FILE\_RMRF()  
  
  
  
Recursively remove a directory path  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: success  
- 1: failed removing directory  
  
  
  
## FILE\_MKDIRP()  
  
  
  
Creates a directory path  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: success  
- 1: failure creating directory path  
  
  
  
## FILE\_CHMOD()  
  
  
  
Set file permissions  
  
### Parameters:  
- $1: permission (octal)  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed to set permissions  
  
  
  
## FILE\_CHOWN()  
  
  
  
Change file owner  
  
### Parameters:  
- $1: owner name  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed to change owner  
  
  
  
## FILE\_CHOWNR()  
  
  
  
Recursively change directory owner  
  
### Parameters:  
- $1: owner name  
- $2: directory path  
  
### Returns:  
- 0: success  
- 1: failed to change owner  
  
  
  
## FILE\_DIREXIST()  
  
  
  
Check if directory path exists  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: successfully found all directories  
- 1: failed to find one or more directories  
  
  
  
## FILE\_DIRNOTEXIST()  
  
  
  
Check if directory path does not exist  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: no directories found  
- 1: found one or more directories  
  
  
  
## FILE\_EXIST()  
  
  
  
Check if a given file path exists  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: successfully found all files  
- 1: unable to find one of the files  
  
  
  
## FILE\_NOT\_EXIST()  
  
  
  
Check if a given file path does not exist  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: none of the files provided were found  
- 1: one of the files exist  
  
  
  
## FILE\_TOUCH()  
  
  
  
Touch a file  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: success  
- 1: failed  
  
  
  
## FILE\_CAT()  
  
  
  
Cat file  
  
### Parameters:  
- $1: file  
  
### Returns:  
- Non-zero on error.  
  
  
  
## FILE\_LS()  
  
  
  
List files  
  
### Parameters:  
- $1: list of arguments  
  
### Returns:  
- Non-zero on error. POSIX ls return values. See also: `man ls`  
  
  
  
## FILE\_CP()  
  
  
  
Copy a file within the same OS.  
  
### Parameters:  
- $1: source to copy from  
- $2: destination to copy to  
  
### Returns:  
- Non-zero on error. POSIX cp return values. See also: `man cp`  
  
  
  
## FILE\_ROW\_EXIST()  
  
  
  
Check if a specific row exist or not in a text file.  
  
### Parameters:  
- $1: row data to check from  
- $2: file to check  
- $3: exist flag  
  
### Returns:  
- 0: success  
- 1: row does not exist  
- 2: file not found  
  
  
  
## FILE\_ROW\_PERSIST()  
  
  
  
Make sure a specific row exist in a text file,  
creates the file if it's missing.  
  
### Parameters:  
- $1: row data to persist.  
- $2: file to check  
  
### Returns:  
- 0: success  
- 1: could not write to file  
  
  
  
## FILE\_GREP()  
  
  
  
Grep on file.  
Possibly require exact count matches,  
then also a comparison operator could be provided, default is "eq".  
  
### Parameters:  
- $1: pattern  
- $2: file path  
- $3: count to match, if not provided then  
- the matched rows are printed.  
- $4: operator to compare count matches by. Default: "eq"  
  
### Returns:  
- 0: success  
- 1: failed to match pattern or failed to match count  
- 2: file not found  
  
  
  
## FILE\_SED()  
  
  
  
Sed a pattern in place  
  
### Parameters:  
- $1: pattern  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed access file or failed to write to file  
  
  
  
## FILE\_APPEND\_ROW()  
  
  
  
Append a row to a text file.  
  
### Parameters:  
- $1: row data  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_PIPE\_WRITE()  
  
  
  
Write to a file from stdin  
  
### Parameters:  
- $1: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_PIPE\_APPEND()  
  
  
  
Append to a file from stdin  
  
### Parameters:  
- $1: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_GET\_PERMISSIONS()  
  
  
  
Get a list of directory and file permissions  
which could be stored and used later for restoring permissions.  
  
### Parameters:  
- $1: file or directory path  
  
### Returns:  
- Text output on stdout.  
  
  
  
## FILE\_RESTORE\_PERMISSIONS()  
  
  
  
Restore permissions.  
  
### Parameters:  
- $1: base directory path  
- $2: permissions  
  
### Returns:  
- 0: success  
- 1: failed to chown or failed to chmod  
  
  
  
## FILE\_STAT()  
  
  
  
Display file status  
  
### Parameters:  
- $1: file path  
  
### Returns:  
- 0: success  
- 1: failure  
  
  
  
## \_FILE\_AC()  
  
  
  
Helper function when using auto completion on files.  
  
  
  
