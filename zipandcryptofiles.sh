#!/bin/bash

zip_crypto_folder()
{
    zip -re "$1" "$2"
}

unzip_crypto_folder()
{
    unzip "$1"
}

usage()
{
    echo "Usage: $0 COMMAND zipfilename.zip [zipfilefolder]"
    echo "  COMMAND: zip|unzip"
}

if [[ $1 ]]; then
    if [[ $1 = "zip" ]]; then
        if [[ $2 && $3 ]]; then
            zip_crypto_folder "$2" "$3"
        else
            usage
        fi
    elif [[ $1 = "unzip" ]]; then
        if [[ $2 ]]; then
            unzip_crypto_folder "$2"
        else
            usage
        fi
    else
        usage
    fi
else
    usage
fi