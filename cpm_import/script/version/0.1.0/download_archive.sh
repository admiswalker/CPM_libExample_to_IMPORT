#!/bin/bash

CPM_CALL_DIR=`pwd -P`
. $CPM_CALL_DIR/cpm/init_path_and_dir.sh
. $CPM_OWN_DIR/common_fn.sh


URL=https://github.com/admiswalker/CPM_libExample_to_IMPORT/raw/main/cpm_import/archive/amd64/cpmex/0.1.0/amd64-cpmex-0.1.0.tar.xz
fName=${URL##*/}          # <architecture>-<libName>-<version>.tar.xz
fName_base=${fName%.*.*}  # <architecture>-<libName>-<version>
tmp=${fName%-*}           # <architecture>-<libName>
arcName=${tmp%-*}         # <architecture>
libName=${tmp#*-}         # <libName>
ver=${fName_base#*-*-}    # <version>


URL_hash=https://github.com/admiswalker/CPM_libExample_to_IMPORT/raw/main/cpm_import/archive/amd64/cpmex/0.1.0/amd64-cpmex-0.1.0-sha256sum.txt
fName_hash=${URL_hash##*/} # amd64-m4-1.4.15-sha256sum.txt


cfn_echo_download_begin $libName $ver


# downloading source file
if [ ! -e $CPM_CACHE_DIR/$fName ]; then
    wget -P $CPM_CACHE_DIR $URL
fi
if [ ! -e $CPM_CACHE_DIR/$fName_hash ]; then
    wget -P $CPM_CACHE_DIR $URL_hash
fi
cfn_check_hash_value


cfn_echo_download_end $libName $ver
