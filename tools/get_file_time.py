#!/bin/env python
#
# get file create/modify/access time
# Usage: python get_file_time.py -c/-m/-a file

import os
import sys

def get_file_time(opt, file):
    s = os.stat(file)
    if opt == "create":
        return s.st_ctime
    elif opt == "modify":
        return s.st_mtime
    elif opt == "access":
        return s.st_atime
    else:
        exit(-1)

def main():
    if len(sys.argv) < 3:
        exit(-1)
    elif sys.argv[1] == "-c":
        print(get_file_time("create", sys.argv[2]))
    elif sys.argv[1] == "-m":
        print(get_file_time("modify", sys.argv[2]))
    elif sys.argv[1] == "-a":
        print(get_file_time("access", sys.argv[2]))
    else:
        exit(-1)

if __name__ == '__main__':
    main()