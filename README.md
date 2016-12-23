# File module | [![build status](https://gitlab.com/space-sh/file/badges/master/build.svg)](https://gitlab.com/space-sh/file/commits/master)

Handles all file operations, including creating, searching, setting permissions and removing files.


## /append/
	Append row to file


## /chmod/
	Set file permissions

	chmod file.


## /chownr/
	Change owner

	chown -r directory.


## /cp/
	Copy a file

	Copies a file within same system.


## /direxist/
	Check if directory path exists


## /dirnotexist/
	Check if directory path does not exist


## /fileexist/
	Check if a file path exists


## /filenotexist/
	Check if a file path does not exist


## /getpermissions/
	Get recursive list of permissions


## /grep/
	Grep pattern


## /grepcount/
	Grep and match count

	Grep a file against pattern and expect the given count to match.


## /mkdirp/
	Create a directory path

	mkdir -p.


## /pipeappend/
	Append to a file from stdin


## /pipewrite/
	Write to a file from stdin


## /restorepermissions/
	Restore list of permissions


## /rmrf/
	Recursively remove a directory path

	rm -rf a directory.


## /rowexist/
	Check if a row exists or not in file


## /rowpersist/
	Check if row exists in file

	Make sure row exists.


## /sed/
	Sed a pattern in place


## /touch/
	Touch a file


# Functions 

## FILE\_DEP\_INSTALL ()  
  
  
  
Check for module dependencies  
  
### Returns:  
- non-zero on failure  
  
  
  
## FILE\_RMRF ()  
  
  
  
Recursively remove a directory path  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: success  
- 1: failed removing directory  
  
  
  
## FILE\_MKDIRP ()  
  
  
  
Creates a directory path  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: success  
- 1: failure creating directory path  
  
  
  
## FILE\_CHMOD ()  
  
  
  
Set file permissions  
  
### Parameters:  
- $1: permission (octal)  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed to set permissions  
  
  
  
## FILE\_CHOWNR ()  
  
  
  
Recursively change directory owner  
  
### Parameters:  
- $1: owner name  
- $2: directory path  
  
### Returns:  
- 0: success  
- 1: failed to change owner  
  
  
  
## FILE\_DIREXIST ()  
  
  
  
Check if directory path exists  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: successfully found all directories  
- 1: failed to find one or more directories  
  
  
  
## FILE\_DIRNOTEXIST ()  
  
  
  
Check if directory path does not exist  
  
### Parameters:  
- $1: list of directories  
  
### Returns:  
- 0: no directories found  
- 1: found one or more directories  
  
  
  
## FILE\_EXIST ()  
  
  
  
Check if a given file path exists  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: successfully found all files  
- 1: unable to find one of the files  
  
  
  
## FILE\_NOT\_EXIST ()  
  
  
  
Check if a given file path does not exist  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: none of the files provided were found  
- 1: one of the files exist  
  
  
  
## FILE\_TOUCH ()  
  
  
  
Touch a file  
  
### Parameters:  
- $1: list of files  
  
### Returns:  
- 0: success  
- 1: failed  
  
  
  
## FILE\_LS ()  
  
  
  
List files  
  
### Parameters:  
- $1: list of files and arguments  
  
### Returns:  
- Non-zero on error. POSIX ls return values. See also: `man ls`  
  
  
  
## FILE\_CP ()  
  
  
  
Copy a file  
  
### Parameters:  
- $1: source to copy from  
- $2: destination to copy to  
  
### Returns:  
- Non-zero on error. POSIX cp return values. See also: `man cp`  
  
  
  
## FILE\_ROW\_EXIST ()  
  
  
  
Check if a specific row exist or not in a text file.  
  
### Parameters:  
- $1: row data to check from  
- $2: file to check  
- $3: exist flag  
  
### Returns:  
- 0: success  
- 1: row does not exist  
- 2: file not found  
  
  
  
## FILE\_ROW\_PERSIST ()  
  
  
  
Make sure a specific row exist in a text file.  
  
### Parameters:  
- $1: row data to check from  
- $2: file to check  
  
### Returns:  
- 0: success  
- 1: row does not exist  
- 2: file not found  
  
  
  
## FILE\_GREP ()  
  
  
  
Grep on file.  
Possibly require exact count matches.  
Comparison operator could also be given,  
default is "eq".  
  
### Parameters:  
- $1: pattern  
- $2: file path  
- $3: count to match. Default: ""  
- $4: operator. Default: "eq"  
  
### Returns:  
- 0: success  
- 1: failed to match pattern or failed to match count  
- 2: file not found  
  
  
  
## FILE\_SED ()  
  
  
  
Sed a pattern in place  
  
### Parameters:  
- $1: pattern  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed access file or failed to write to file  
  
  
  
## FILE\_APPEND ()  
  
  
  
Append row to file  
  
### Parameters:  
- $1: row data  
- $2: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_PIPE\_WRITE ()  
  
  
  
Write to a file from stdin  
  
### Parameters:  
- $1: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_PIPE\_APPEND ()  
  
  
  
Append to a file from stdin  
  
### Parameters:  
- $1: file path  
  
### Returns:  
- 0: success  
- 1: failed writing to file  
  
  
  
## FILE\_GET\_PERMISSIONS ()  
  
  
  
Get a list of directory and file permissions  
which could be stored and used later for restoring permissions.  
  
### Parameters:  
- $1: directory path  
  
### Returns:  
- Text output on stdout.  
  
  
  
## FILE\_RESTORE\_PERMISSIONS ()  
  
  
  
Restore permissions.  
  
### Parameters:  
- $1: directory path  
- $2: permissions  
  
### Returns:  
- 0: success  
- 1: failed to chown or failed to chmod  
  
  
  
