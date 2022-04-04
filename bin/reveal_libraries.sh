#!/bin/bash

bin_path=$1

if [ -z "$bin_path" ]; then
    exit 0
fi
if [ "$bin_path" = "a.out" ]; then
    exit 0
fi

libs_list=`objdump -p $bin_path | grep NEEDED | awk '{ print $2 }'`
for e in $libs_list; do
    echo $bin_path "->" $e
done

for e in $libs_list; do
    next_lib=`ldd $bin_path | grep $e | awk '{ print $3 }'`
    $0 $next_lib
done
