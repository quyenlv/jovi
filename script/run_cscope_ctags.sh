#!/bin/bash

function make_ctags()
{
    if [ $1 == "update" ]; then
        ctags -L cscope.files --append=yes
    elif [ $1 == "create" ]; then
        ctags -L cscope.files --tag-relative=yes
    else
        echo Error: wrong ctags option, check the code
        exit 1
    fi
}

function make_cscope()
{
    if [ ! -z "$base_dir" ]; then
        find $base_dir \( $(printf -- "-path %s -o " $tagignore) -false \) -prune  \
         -o -name "*.asm"    -type f -exec echo {} \;\
         -o -name "*.s"      -type f -exec echo {} \;\
         -o -name "*.S"      -type f -exec echo {} \;\
         -o -name "*.h"      -type f -exec echo {} \;\
         -o -name "*.c"      -type f -exec echo {} \;\
         -o -name "*.py"     -type f -exec echo {} \;\
         -o -name "*.cpp"    -type f -exec echo {} \;\
         -o -name "*.sh"     -type f -exec echo {} \;\
         -o -name "*.spec"   -type f -exec echo {} \;\
         >> cscope.files
    fi

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
        tags_create="y"
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
        cscope_create="y"
    fi
}

#
# Create ctags and cscope
#
function create_ctags_cscope()
{
    if [ $cscope_create = "y" ] || [ $cscope_create = "Y" ]; then
        echo "creating cscope.out"
        make_cscope "create";
        echo "cscope.out created"
    fi

    if [ $tags_create = "y" ] || [ $tags_create = "Y" ]; then
        echo "creating tags file"
        make_ctags "create";
        echo "tags created"
    fi
}

#
# Update ctags and cscope
#
function update_ctags_cscope()
{
    if [ $cscope_update = "y" ] || [ $cscope_update = "Y" ]; then
        echo "updating cscope files"
        make_cscope "update";
        echo "cscope.out updated"
    fi

    if [ $tags_update = "y" ] || [ $tags_update = "Y" ]; then
        echo "updating tags file"
        make_ctags "update";
        echo "tags updated"
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
# Rebuild database from the current cscope.files
#
function rebuild_ctags_cscope()
{
    rm -f cscope.out* ncscope.* tags

    make_cscope "create";
    make_ctags "create";
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

    base_dir=""
    tagignore=""
    > cscope.files

    for dir in "$@"
    do
        if [[ -d $dir ]]; then
            base_dir+="`readlink -f $dir` "
        else
            echo "`readlink -f $dir`" >> cscope.files
        fi
    done

    if [ -f ".tagignore" ]; then
        while read p; do
            tagignore+="`readlink -f $p` "
        done < .tagignore
    fi

    tags_update="n"
    tags_create="n"
    cscope_update="n"
    cscope_create="n"

    check_cscope
    check_ctags

    create_ctags_cscope;
    update_ctags_cscope;
}
