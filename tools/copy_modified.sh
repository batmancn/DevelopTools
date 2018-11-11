#!/bin/bash
# 拷贝当前git目录下modified的文件到对应仓库的位置
# must run by bash

VAR_MODIFIED_FILES=""
VAR_PATH_TYPE="rel" # rel=relative,abs=abs,web=web
VAR_MODIFY_FILE_TYPE="git" # git=git,his=history
VAR_PWD=`pwd`
VAR_HIS_FILE_MODIFY_TIME=0

usage()
{
    echo "This tool is to copy git modified files from ./ to DEST_PATH"
    echo "Usage: bash $0 DEST_PATH"
    echo
    echo "DEST_PATH could be one of:"
    echo "  relative path, like ../abs_path"
    echo "  abs path, like /var/usr/local"
    echo "  web path, like gyw@1722.18.9.8:/var/local/bin"
}

get_modified_files()
{
    if [[ $1 = "git" ]]; then
        VAR_MODIFIED_FILES=$(git status | grep "modified:" | awk '{print $2}')
    elif [[ $1 = "his" ]]; then
        his_file="$VAR_PWD/.history"
        if [[ -f "$his_file" ]]; then
            get_file_modifiy_time "$his_file"
        else
            echo "This is copy_modified.sh history file" > "$his_file"
        fi
    fi
}

copy_all_file()
{
    dest="$1"
    mod_type="$2"

    get_modified_files "$mod_type"

    echo "${VAR_MODIFIED_FILES}" | while read line
    do
        echo "cp $line to ${dest}/${line}"
        cp "$line" "${dest}/${line}"
    done
}

if [[ $1 ]]; then
    copy_all_file "$1"
else
    usage
fi