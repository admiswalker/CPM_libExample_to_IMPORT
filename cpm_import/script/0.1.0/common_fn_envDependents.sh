#!/bin/bash


cfn_set_archive_URL(){
    URL=https://github.com/admiswalker/CPM_libExample_to_IMPORT/raw/main/cpm_import/archive/amd64/cpmex/0.1.0/amd64-cpmex-0.1.0.tar.xz

    URL_hash=https://github.com/admiswalker/CPM_libExample_to_IMPORT/raw/main/cpm_import/archive/amd64/cpmex/0.1.0/amd64-cpmex-0.1.0-sha256sum.txt
}
cfn_set_archive_fName(){
    fName=amd64-cpmex-0.1.0.tar.xz
}
cfn_isInstalled(){
    if [ -e $CPM_INST_PATH/lib/libcpmex.a ]; then
        echo 'true'
    else
        echo 'false'
    fi
}
