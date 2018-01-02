#
# Copyright 2016-2017 Blockie AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Module for working with text files.
#

#=============
# FILE_DEP_INSTALL
#
# Check for module dependencies
#
# Returns:
# non-zero on failure
#
#=============
FILE_DEP_INSTALL()
{
    SPACE_DEP="PRINT"

    PRINT "Checking for FILE dependencies." "info"

    # Don't check for programs using OS_IS_INSTALLED here
    # to prevent circular dependency
    if command -v "grep" >/dev/null && command -v "sed" >/dev/null ; then
        PRINT "Dependencies found." "ok"
    else
        PRINT "Failed finding dependencies. Requirements: grep and sed" "error"
        return 1
    fi
}

#=============
# FILE_RMRF
#
# Recursively remove a directory path
#
# Parameters:
#   $1: list of directories
#
# Returns:
#   0: success
#   1: failed removing directory
#
#=============
FILE_RMRF()
{
    SPACE_SIGNATURE="file:1 [file]"
    SPACE_DEP="PRINT"

    local file="$*"

    PRINT "Recursively force remove directory: ${file}." "debug"

    rm -rf ${file}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not remove directory: ${file}." "error"
        return 1
    fi
}

#=============
# FILE_MKDIRP
#
# Creates a directory path
#
# Parameters:
#   $1: list of directories
#
# Returns:
#   0: success
#   1: failure creating directory path
#
#=============
FILE_MKDIRP()
{
    SPACE_SIGNATURE="dir:1 [dir]"
    SPACE_DEP="PRINT"

    local dir="$*"

    PRINT "Creating directories: ${dir}." "debug"
    mkdir -p ${dir}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not create directory: ${dir}." "error"
        return 1
    fi
}

#=============
# FILE_CHMOD
#
# Set file permissions
#
# Parameters:
#   $1: permission (octal)
#   $2: file path
#
# Returns:
#   0: success
#   1: failed to set permissions
#
#=============
FILE_CHMOD()
{
    SPACE_SIGNATURE="permissions:1 file:1"
    SPACE_DEP="PRINT"

    local octets="${1}"
    shift

    local file="${1}"
    shift

    PRINT "chmod ${file} to ${octets}." "debug"

    chmod "${octets}" "${file}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not chmod ${file} to ${octets}." "error"
        return 1
    fi
}

#=============
# FILE_CHOWN
#
# Change file owner
#
# Parameters:
#   $1: owner name
#   $2: file path
#
# Returns:
#   0: success
#   1: failed to change owner
#
#=============
FILE_CHOWN()
{
    SPACE_SIGNATURE="owner:1 file:1"
    SPACE_DEP="PRINT"

    local owner="${1}"
    shift

    local file="${1}"
    shift

    PRINT "chown ${file} to ${owner}." "debug"

    chown "${owner}" "${file}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not chown  ${file} to ${owner}." "error"
        return 1
    fi
}

#=============
# FILE_CHOWNR
#
# Recursively change directory owner
#
# Parameters:
#   $1: owner name
#   $2: directory path
#
# Returns:
#   0: success
#   1: failed to change owner
#
#=============
FILE_CHOWNR()
{
    SPACE_SIGNATURE="owner:1 file:1"
    SPACE_DEP="PRINT"

    local owner="${1}"
    shift

    local file="${1}"
    shift

    PRINT "chown ${file} to ${owner}." "debug"

    chown -R "${owner}" "${file}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not chown -R ${file} to ${owner}." "error"
        return 1
    fi
}

#=============
# FILE_DIREXIST
#
# Check if directory path exists
#
# Parameters:
#   $1: list of directories
#
# Returns:
#   0: successfully found all directories
#   1: failed to find one or more directories
#
#=============
FILE_DIREXIST()
{
    SPACE_SIGNATURE="dir:1 [dir]"
    SPACE_DEP="PRINT"

    local dir="$*"
    shift

    PRINT "Exists dir(s): ${dir}" "debug"

    local f=
    for f in ${dir}; do
        if [ ! -d "${f}" ]; then
            PRINT "Dir does not exist: ${f}" "error"
            return 1
        fi
    done
}

#=============
# FILE_DIRNOTEXIST
#
# Check if directory path does not exist
#
# Parameters:
#   $1: list of directories
#
# Returns:
#   0: no directories found
#   1: found one or more directories
#
#=============
FILE_DIRNOTEXIST()
{
    SPACE_SIGNATURE="dir:1 [dir]"
    SPACE_DEP="PRINT"

    local dir="$*"
    shift

    PRINT "Not exist dir(s): ${dir}" "debug"

    local f=
    for f in ${dir}; do
        if [ -d "${f}" ]; then
            PRINT "Dir does exist: ${f}" "error"
            return 1
        fi
    done
}

#=============
# FILE_EXIST
#
# Check if a given file path exists
#
# Parameters:
#   $1: list of files
#
# Returns:
#   0: successfully found all files
#   1: unable to find one of the files
#
#=============
FILE_EXIST()
{
    SPACE_SIGNATURE="file:1 [file]"
    SPACE_DEP="PRINT"

    local file="$*"
    shift

    PRINT "Exists file(s): ${file}" "debug"

    local f=
    for f in ${file}; do
        if [ ! -f "${f}" ]; then
            PRINT "File does not exist: ${f}" "error"
            return 1
        fi
    done
}

#=============
# FILE_NOT_EXIST
#
# Check if a given file path does not exist
#
# Parameters:
#   $1: list of files
#
# Returns:
#   0: none of the files provided were found
#   1: one of the files exist
#
#=============
FILE_NOT_EXIST()
{
    SPACE_SIGNATURE="file:1 [file]"
    SPACE_DEP="PRINT"

    local file="$*"
    shift

    PRINT "Not exist file(s): ${file}" "debug"

    local f=
    for f in ${file}; do
        if [ -f "${f}" ]; then
            PRINT "File does exist: ${f}" "error"
            return 1
        fi
    done
}

#=============
# FILE_TOUCH
#
# Touch a file
#
# Parameters:
#   $1: list of files
#
# Returns:
#   0: success
#   1: failed
#
#=============
FILE_TOUCH()
{
    SPACE_SIGNATURE="file:1 [file]"
    SPACE_DEP="PRINT"

    local file="$*"
    shift

    PRINT "Touch file(s): ${file}" "debug"

    touch ${file}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not touch file(s): ${file}." "error"
        return 1
    fi
}

#=============
# FILE_CAT
#
# Cat file
#
# Parameters:
#   $1: file
#
# Returns:
#   Non-zero on error.
#
#=============
FILE_CAT()
{
    SPACE_SIGNATURE="file:1 [file]"

    cat "$@"
}

#=============
# FILE_LS
#
# List files
#
# Parameters:
#   $1: list of arguments
#
# Returns:
#   Non-zero on error. POSIX ls return values. See also: `man ls`
#
#=============
FILE_LS()
{
    SPACE_SIGNATURE="[lsargs]"

    ls $*
}

#=============
# FILE_CP
#
# Copy a file within the same OS.
#
# Parameters:
#   $1: source to copy from
#   $2: destination to copy to
#
# Returns:
#   Non-zero on error. POSIX cp return values. See also: `man cp`
#
#=============
FILE_CP()
{
    SPACE_SIGNATURE="src:1 dest:1"
    SPACE_DEP="PRINT"

    local src="${1}"
    shift

    local dest="${1}"
    shift

    PRINT "Copy file: ${src} ${dest}" "debug"

    cp "${src}" "${dest}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not copy from ${src} to ${dest}." "error"
        return 1
    fi
}

#=============
# FILE_ROW_EXIST
#
# Check if a specific row exist or not in a text file.
#
# Parameters:
#   $1: row data to check from
#   $2: file to check
#   $3: exist flag
#
# Returns:
#   0: success
#   1: row does not exist
#   2: file not found
#
#=============
FILE_ROW_EXIST()
{
    SPACE_SIGNATURE="row:1 file:1 [invert]"
    SPACE_DEP="PRINT"

    local row="${1}"
    shift

    local file="${1}"
    shift

    local invert="${1:-0}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Check if row exist in ${file}, ${row}, invert: ${invert}." "debug"

    grep -q "^${row}\$" "${file}" 2>/dev/null
    local status="$?"
    if [ "${status}" = "2" ]; then
        PRINT "File not found: ${file}." "error"
        return 2
    elif [ "${status}" = "1" ]; then
        PRINT "Row does not exist." "debug"
        if [ "${invert}" = "0" ]; then
            return 1
        fi
    else
        PRINT "Row does exist." "debug"
        if [ "${invert}" = "1" ]; then
            return 1
        fi
    fi
}

#=============
# FILE_ROW_PERSIST
#
# Make sure a specific row exist in a text file,
# creates the file if it's missing.
#
# Parameters:
#   $1: row data to persist.
#   $2: file to check
#
# Returns:
#   0: success
#   1: could not write to file
#
#=============
FILE_ROW_PERSIST()
{
    SPACE_SIGNATURE="row:1 file:1"
    SPACE_DEP="PRINT FILE_APPEND_ROW"

    local row="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Make sure that row exist in ${file}: ${row}" "debug"

    grep -q "^${row}\$" "${file}" 2>/dev/null
    local status="$?"
    if [ "${status}" = "2" ]; then
        PRINT "File not found: ${file}, create it and add row." "debug"
        FILE_APPEND_ROW "${row}" "${file}"
    elif [ "${status}" = "1" ]; then
        PRINT "Row does not exist, add row." "debug"
        FILE_APPEND_ROW "${row}" "${file}"
    fi
}

#=============
# FILE_GREP
#
# Grep on file.
# Possibly require exact count matches,
# then also a comparison operator could be provided, default is "eq".
#
# Parameters:
#   $1: pattern
#   $2: file path
#   $3: count to match, if not provided then
#       the matched rows are printed.
#   $4: operator to compare count matches by. Default: "eq"
#
# Returns:
#   0: success
#   1: failed to match pattern or failed to match count
#   2: file not found
#
#=============
FILE_GREP()
{
    SPACE_SIGNATURE="pattern:1 file:1 [count operator]"
    SPACE_DEP="PRINT"

    local pattern="${1}"
    shift

    local file="${1}"
    shift

    local count="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    local operator="${1:-eq}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Grep on ${file}: ${pattern}" "debug"

    local tmp=
    tmp="$(grep "${pattern}" "${file}" 2>/dev/null)"
    local status="$?"
    if [ "${status}" = "2" ]; then
        PRINT "File not found: ${file}." "error"
        return 2
    fi

    if [ -z "${count}" ]; then
        if [ "${status}" = "1" ]; then
            PRINT "Pattern not matched." "debug"
            return 1
        else
            printf "%s\n" "${tmp}"
        fi
    else
        local count2=0
        local line=
        local IFS="
"
        for line in ${tmp}; do
            count2="$((count2+1))"
        done
        # shell check can't parse this if statement because of the dynamic comparison operator.
        # shellcheck disable=SC1009
        if [ "${count2}" "-${operator}" "${count}" ]; then
            return 0
        else
            PRINT "Wrong count: got ${count2}, operator -${operator}, defined ${count}." "debug"
            return 1
        fi
    fi
}

#=============
# FILE_SED
#
# Sed a pattern in place
#
# Parameters:
#   $1: pattern
#   $2: file path
#
# Returns:
#   0: success
#   1: failed access file or failed to write to file
#
#=============
FILE_SED()
{
    SPACE_SIGNATURE="pattern:1 file:1"
    SPACE_DEP="PRINT"

    local pattern="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Sed on ${file}: ${pattern}" "debug"

    local tmp=
    tmp="$(sed "${pattern}" "${file}")"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not sed ${file}." "error"
        return 1
    fi
    printf "%s\n" "${tmp}" | tee "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

#=============
# FILE_APPEND_ROW
#
# Append a row to a text file.
#
# Parameters:
#   $1: row data
#   $2: file path
#
# Returns:
#   0: success
#   1: failed writing to file
#
#=============
FILE_APPEND_ROW()
{
    SPACE_SIGNATURE="row:1 file:1"
    SPACE_DEP="PRINT"

    local data="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Append row to ${file}." "debug"

    # We want to make sure that the last byte before the append, if any,
    # is a newline character.
    local newline=""
    if [ -f "${file}" ]; then
        local cr="
"
        local char=
        char="$(tail -c -1 ${file})"
        if [ "${char}" != "" ] && [ "${char}" != "${cr}" ]; then
            newline="${cr}"
        fi
    fi

    printf "%s\n" "${newline}${data}" | tee -a "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

#=============
# FILE_PIPE_WRITE
#
# Write to a file from stdin
#
# Parameters:
#   $1: file path
#
# Returns:
#   0: success
#   1: failed writing to file
#
#=============
FILE_PIPE_WRITE()
{
    SPACE_SIGNATURE="file:1"
    SPACE_DEP="PRINT"

    local file="${1}"
    shift

    PRINT "pipe stdin to ${file}." "debug"

    tee "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

#=============
# FILE_PIPE_APPEND
#
# Append to a file from stdin
#
# Parameters:
#   $1: file path
#
# Returns:
#   0: success
#   1: failed writing to file
#
#=============
FILE_PIPE_APPEND()
{
    SPACE_SIGNATURE="file:1"
    SPACE_DEP="PRINT"

    local file="${1}"
    shift

    PRINT "pipe stdin to ${file}." "debug"

    tee -a "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not append to ${file}." "error"
        return 1
    fi
}

#=============
# FILE_GET_PERMISSIONS
#
# Get a list of directory and file permissions
# which could be stored and used later for restoring permissions.
#
# Parameters:
#   $1: file or directory path
#
# Returns:
#   Text output on stdout.
#
#=============
FILE_GET_PERMISSIONS()
{
    SPACE_SIGNATURE="file:1 [maxdepth]"
    SPACE_DEP="PRINT FILE_STAT"

    local file="${1}"
    shift

    local maxdepth="${1:+-maxdepth ${1}}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Get all permissions for ${file}." "debug"
    local filename=
    for filename in $(find "${file}" ${maxdepth} -name "*"); do
        FILE_STAT ${filename} "%n %a %u:%g"
    done
}

#=============
# FILE_RESTORE_PERMISSIONS
#
# Restore permissions.
#
# Parameters:
#   $1: base directory path
#   $2: permissions
#
# Returns:
#   0: success
#   1: failed to chown or failed to chmod
#
#=============
FILE_RESTORE_PERMISSIONS()
{
    # shellcheck disable=2034
    SPACE_SIGNATURE="dir:1 permissions:1"
    # shellcheck disable=2034
    SPACE_DEP="PRINT"

    local dir="${1}"
    shift

    local permissions="${1}"
    shift

    PRINT "Restore permissions in ${dir}." "debug"

    cd ${dir:-.}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not change directory into ${dir}." "error"
        return 1
    fi

    local line=
    IFS="
"
    for line in ${permissions}; do
        printf "%s\n" "${line}" | {
            IFS=" " read -r file mod user
            chown "${user}" "${file}"
            if [ "$?" -gt 0 ]; then
                return 1
            fi
            chmod "${mod}" "${file}"
            if [ "$?" -gt 0 ]; then
                return 1
            fi
        }
        if [ "$?" -gt 0 ]; then
            return 1
        fi
    done
}

#=============
# FILE_STAT
#
# Display file status
#
# Parameters:
#   $1: file path
#
# Returns:
#   0: success
#   1: failure
#
#=============
FILE_STAT()
{
    SPACE_SIGNATURE="file:1 format:1"
    SPACE_DEP="PRINT"

    local file="${1}"
    shift

    local format="${1}"
    shift

    #
    # Check for BSD stat
    if command -v "pkg" >/dev/null || command -v "brew" >/dev/null ; then
        # Translate format options
        format=$(printf "%s" "${format}" | sed -e s'/%a/%A/g' -e s'/%n/%N/g' -e s'/%U/%Su/g' -e s'/%G/%Sg/g' -e s'/%Y/%m/g')
        stat -f "${format}" "${file}"
    else
        stat -c "${format}" "${file}"
    fi

    if [ "$?" -gt 0 ]; then
        PRINT "Failed to stat file: ${file}." "error"
        return 1
    fi
}

#=============
# _FILE_AC
#
# Helper function when using auto completion on files.
#
#=============
_FILE_AC()
{
    SPACE_SIGNATURE="burn:1 [file]"

    shift $((${1}+1))

    local file="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    local base=
    if [ -z "${file}" ]; then
        base="."
    else
        case "${file}" in
            */)
                base="${file}"
            ;;
            *)
                base=$(dirname "${file}")
            ;;
        esac
    fi

    local list=
    local item=
    local count=0
    list=$(find "${base}" -maxdepth 1 -wholename "${file}*")
    for item in ${list}; do
        count=$((count + 1))
    done
    if [ "${count}" -eq 1 ]; then
        # Check if it is a directory we matched.
        if [ -d "${list}" ]; then
            printf "%s/\n" "${list}"
            return
        fi
    fi
    printf "%s\n" "${list}"
}
