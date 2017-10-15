#!/bin/bash

tags_update="n"
tags_create="n"
cscope_update="n"
cscope_create="n"
base_dir=

function make_ctags()
{
    ctags_option="-R        \
     --exclude=.git         \
     --exclude=out          \
     --exclude=*.so         \
     --exclude=*.o          \
     --exclude=*.a          \
     --exclude=*.ko         \
     --exclude=.svn         \
     --exclude=\*.swp       \
     --exclude=\*.bak       \
     --exclude=tags         \
     --exclude=cscope.\*    \
     --exclude=\*.tar.\*    \
     --extra=+q $base_dir"

    if [ $1 == "update" ]; then
        ctags -o newtags $ctags_option
        rm -f tags
        mv newtags tags
    elif [ $1 == "create" ]; then
        ctags $ctags_option
    else
        echo Error: wrong ctags option, check the code
        exit 1
    fi
}

function make_cscope()
{
    find $base_dir -path ./out -prune        \
     -o -name "*.asm"    -exec echo \"{}\" \;\
     -o -name "*.s"      -exec echo \"{}\" \;\
     -o -name "*.S"      -exec echo \"{}\" \;\
     -o -name "*.h"      -exec echo \"{}\" \;\
     -o -name "*.c"      -exec echo \"{}\" \;\
     -o -name "*.cpp"    -exec echo \"{}\" \;\
     -o -name "*.xml"    -exec echo \"{}\" \;\
     -o -name "*.sh"     -exec echo \"{}\" \;\
     > cscope.files

    if [ $1 == "update" ]; then
        cscope -bkq -i cscope.files -f newcscope.out
        rm -f cscope.out cscope.out.in cscope.out.po
        mv newcscope.out cscope.out
        mv newcscope.out.in cscope.out.in
        mv newcscope.out.po cscope.out.po
    elif [ $1 == "create" ]; then
        cscope -bkq -i cscope.files -f cscope.out
    else
        echo Error: wrong cscope option, check the code
        exit 1
    fi

    return 0
}

#
# Check ctags
#
function check_ctags()
{
    if [ -f "tags" ]; then
        read -p "tags file exists, update it? (y/n) " tags_update

        if [ $tags_update = "y" ] || [ $tags_update = "Y" ]; then
            echo "tags is to update"
        elif [ $tags_update = 'n' ] || [ $tags_update = 'N' ]; then
            echo "tags not updated"
        else
            echo "wrong option, quit"
            exit 1
        fi
    else
        read -p "tags does not exist, create new tags? (y/n) " tags_create
    fi
}

#
# Check cscope
#
function check_cscope()
{
    if [ -f "cscope.out" ]; then
        read -p "cscope.out exists, update it? (y/n) " cscope_update

        if [ $cscope_update = "y" ] || [ $cscope_update = "Y" ]; then
            echo "cscope files is to update"
        elif [ $cscope_update = 'n' ] || [ $cscope_update = 'N' ]; then
            echo "cscope files not updated"
        else
            echo "wrong option, quit"
            exit 1
        fi
    else
        read -p "cscope.out does not exist, create new cscope.out? (y/n) " cscope_create
    fi
}

#
# Create ctags and cscope
#
function create_ctags_cscope()
{
    if [ $tags_create = "y" ] || [ $tags_create = "Y" ]; then
        echo "creating tags file"
        make_ctags "create";
        echo "tags created"
    fi

    if [ $cscope_create = "y" ] || [ $cscope_create = "Y" ]; then
        echo "creating cscope.out"
        make_cscope "create";
        echo "cscope.out created"
    fi
}

#
# Update ctags and cscope
#
function update_ctags_cscope()
{
    if [ $tags_update = "y" ] || [ $tags_update = "Y" ]; then
        echo "updating tags file"
        make_ctags "update";
        echo "tags updated"
    fi

    if [ $cscope_update = "y" ] || [ $cscope_update = "Y" ]; then
        echo "updating cscope files"
        make_cscope "update";
        echo "cscope.out updated"
    fi
}

#
# Clean current database
#
function clean_ctags_cscope()
{
    rm -f cscope.* ncscope.* tags
}

#
# Main function
#
function run_cscope_ctags()
{
    if [ -z $1 ]; then
        echo "Please specify the directories to scan."
        return
    fi

    for dir in "$@"
    do
        base_dir+="`readlink -f $dir` "
    done

    check_ctags;
    check_cscope;
    create_ctags_cscope;
    update_ctags_cscope;
}
