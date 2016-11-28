#================================
# FILE_DEP_INSTALL
#
# Do nothing, but conform to /_install/ pattern.
#
#================================
FILE_DEP_INSTALL ()
{
    SPACE_CMDDEP="PRINT"
    PRINT "No particular dependencies." "success"
    # TODO: check for grep, sed
}

FILE_RMRF ()
{
    SPACE_SIGNATURE="dir [dir]"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local dir="${*}"
    shift

    PRINT "Recursively force remove directory: ${dir}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} rm -rf ${dir}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not remove directory: ${dir}." "error"
        return 1
    fi
}

FILE_MKDIRP ()
{
    SPACE_SIGNATURE="dir [dir]"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local dir="${*}"
    shift

    local SUDO="${SUDO-}"

    PRINT "Creating directories: ${dir}." "debug"
    ${SUDO} mkdir -p ${dir}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not create directory: ${dir}." "error"
        return 1
    fi
}

FILE_CHMOD ()
{
    SPACE_SIGNATURE="permissions file"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local octets="${1}"
    shift

    local file="${1}"
    shift

    PRINT "chmod ${file} to ${octets}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} chmod "${octets}" "${file}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not chmod ${file} to ${octets}." "error"
        return 1
    fi
}

FILE_CHOWNR ()
{
    SPACE_SIGNATURE="owner dir"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local owner="${1}"
    shift

    local dir="${1}"
    shift

    PRINT "chown ${dir} to ${owner}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} chown -R "${owner}" "${dir}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not chown -R ${dir} to ${owner}." "error"
        return 1
    fi
}

#===========
#
# Exists dir.
#
#===========
FILE_DIREXIST ()
{
    SPACE_SIGNATURE="dir [dir]"
    SPACE_CMDDEP="PRINT"

    local dir="${*}"
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

#===========
#
# Not exist dir.
#
#===========
FILE_DIRNOTEXIST ()
{
    SPACE_SIGNATURE="dir [dir]"
    SPACE_CMDDEP="PRINT"

    local dir="${*}"
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

#===========
#
# Exists file.
#
#===========
FILE_EXIST ()
{
    SPACE_SIGNATURE="file [file]"
    SPACE_CMDDEP="PRINT"

    local file="${*}"
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

#===========
#
# Not exist file.
#
#===========
FILE_NOT_EXIST ()
{
    SPACE_SIGNATURE="file [file]"
    SPACE_CMDDEP="PRINT"

    local file="${*}"
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

#===========
#
# Touch a file.
#
#===========
FILE_TOUCH ()
{
    SPACE_SIGNATURE="file [file]"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local file="${*}"
    shift

    PRINT "Touch file(s): ${file}" "debug"

    local SUDO="${SUDO-}"
    ${SUDO} touch ${file}
    if [ "$?" -gt 0 ]; then
        PRINT "Could not touch file(s): ${file}." "error"
        return 1
    fi
}

#===========
#
# List files.
#
#===========
FILE_LS ()
{
    SPACE_SIGNATURE="[args]"

    ls "${@}"
}

#===========
#
# Copy a file.
#
#===========
FILE_CP ()
{
    SPACE_SIGNATURE="src dest"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local src="${1}"
    shift

    local dest="${1}"
    shift

    PRINT "Copy file: ${src} ${dest}" "debug"

    local SUDO="${SUDO-}"
    ${SUDO} cp "${src}" "${dest}"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not touch file: ${file}." "error"
        return 1
    fi
}

#===========
#
# Check if a specific row exist or not in a text file.
#
#===========
FILE_ROW_EXIST ()
{
    SPACE_SIGNATURE="row file [exist]"
    SPACE_CMDDEP="PRINT FILE_APPEND"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local row="${1}"
    shift

    local file="${1}"
    shift

    local exist="${1:-1}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Check if row exist in ${file}, ${row}, exist: ${exist}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} grep -q "^${row}\$" "${file}" 2>/dev/null
    local status="$?"
    if [ "${status}" = "2" ]; then
        PRINT "File not found: ${file}." "error"
        return 2
    elif [ "${status}" = "1" ]; then
        PRINT "Row does not exist." "debug"
        if [ "${exist}" = "1" ]; then
            return 1
        fi
    else
        PRINT "Row does exist." "debug"
        if [ "${exist}" -eq 0 ]; then
            return 1
        fi
    fi
}

#===========
#
# Make sure a specific row exist in a text file.
#
#===========
FILE_ROW_PERSIST ()
{
    SPACE_SIGNATURE="row file"
    SPACE_CMDDEP="PRINT FILE_APPEND"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local row="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Make sure that row exist in ${file}: ${row}" "debug"

    local SUDO="${SUDO-}"
    ${SUDO} grep -q "^${row}\$" "${file}" 2>/dev/null
    local status="$?"
    if [ "${status}" = "2" ]; then
        PRINT "File not found: ${file}." "error"
        return 2
    elif [ "${status}" = "1" ]; then
        PRINT "Row does not exist." "debug"
        FILE_APPEND "${row}" "${file}"
    fi
}

#======================
# FILE_GREP
#
# Grep on file.
# Possibly require exact count matches.
# Comparison operator could also be given,
# default is "eq".
#
#======================
FILE_GREP ()
{
    SPACE_SIGNATURE="pattern file [count operator]"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local pattern="${1}"
    shift

    local file="${1}"
    shift

    local count="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    local operator="${1:-eq}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Grep on ${file}: ${pattern}" "debug"

    local SUDO="${SUDO-}"
    local tmp=
    tmp="$(${SUDO} grep "${pattern}" "${file}" 2>/dev/null)"
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
        local count2=0 line=
        local IFS="
"
        for line in ${tmp}; do
            count2="$((count2+1))"
        done
        # shell check can't parse this if statement because of the dynamic comparison operator.
        # shellcheck disable=SC1009
        if [ "${count2}" "-${operator}" "${count}" ]; then
            printf "%s\n" "${tmp}"
            return 0
        else
            PRINT "Wrong count: got ${count2}, operator -${operator}, defined ${count}." "debug"
            printf "%s\n" "${tmp}"
            return 1
        fi
    fi
}

FILE_SED ()
{
    SPACE_SIGNATURE="pattern file"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local pattern="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Sed on ${file}: ${pattern}" "debug"

    local SUDO="${SUDO-}"
    local tmp=
    tmp="$(${SUDO} sed "${pattern}" "${file}")"
    if [ "$?" -gt 0 ]; then
        PRINT "Could not sed ${file}." "error"
        return 1
    fi
    printf "%s\n" "${tmp}" | ${SUDO} tee "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

FILE_APPEND ()
{
    SPACE_SIGNATURE="row file"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local data="${1}"
    shift

    local file="${1}"
    shift

    PRINT "Append row to ${file}." "debug"

    local SUDO="${SUDO-}"

    # We want to make sure that the last byte before the append, if any,
    # is a newline character.
    local newline=""
    if [ -f "${file}" ]; then
        local cr="
"
        local char=
        char="$(${SUDO} tail -c -1 ${file})"
        if [ "${char}" != "" ] && [ "${char}" != "${cr}" ]; then
            newline="${cr}"
        fi
    fi

    ${SUDO} printf "%s\n" "${newline}${data}" | ${SUDO} tee -a "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

FILE_PIPE_WRITE ()
{
    SPACE_SIGNATURE="file"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local file="${1}"
    shift

    PRINT "pipe stdin to ${file}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} tee "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not write to ${file}." "error"
        return 1
    fi
}

FILE_PIPE_APPEND ()
{
    SPACE_SIGNATURE="file"
    SPACE_CMDDEP="PRINT"
    SPACE_CMDENV="SUDO=\${SUDO-}"

    local file="${1}"
    shift

    PRINT "pipe stdin to ${file}." "debug"

    local SUDO="${SUDO-}"
    ${SUDO} tee -a "${file}" >/dev/null
    if [ "$?" -gt 0 ]; then
        PRINT "Could not append to ${file}." "error"
        return 1
    fi
}

#=================
# FILE_GET_PERMISSIONS
#
# Get a list of directory and file permissions
# which could be stored and used later for restoring permissions.
#
#=================
FILE_GET_PERMISSIONS ()
{
    SPACE_SIGNATURE="dir [maxdepth]"
    SPACE_CMDENV="SUDO=\${SUDO-}"
    SPACE_CMDDEP="PRINT"

    local dir="${1}"
    shift

    local maxdepth="${1:+-maxdepth ${1}}"
    shift $(( $# > 0 ? 1 : 0 ))

    local SUDO="${SUDO-}"
    PRINT "Get all permissions for ${dir}, SUDO=${SUDO}." "debug"
    # shellcheck disable=2086
    ${SUDO} find "${dir}" ${maxdepth} -exec stat -c"%n %a %U:%G" {} \;
}

#=================
# FILE_SET_PERMISSIONS
#
# Restore permissions.
#
#=================
FILE_RESTORE_PERMISSIONS ()
{
    # shellcheck disable=2034
    SPACE_SIGNATURE="dir permissions"
    # shellcheck disable=2034
    SPACE_CMDENV="SUDO=\${SUDO-}"
    # shellcheck disable=2034
    SPACE_CMDDEP="PRINT"

    local dir="${1}"
    shift

    local permissions="${1}"
    shift

    local SUDO="${SUDO-}"

    PRINT "Restore permissions for ${dir}, SUDO=${SUDO}." "debug"

    local line=
    IFS="
"
    for line in ${permissions}; do
        printf "%s\n" "${line}" | {
            IFS=" " read -r file mod user
            ${SUDO} chown "${user}" "${file}"
            if [ "$?" -gt 0 ]; then
                return 1
            fi
            ${SUDO} chmod "${mod}" "${file}"
            if [ "$?" -gt 0 ]; then
                return 1
            fi
        }
        if [ "$?" -gt 0 ]; then
            return 1
        fi
    done
}
