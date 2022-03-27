#!/bin/bash

CPM_CALL_DIR=`pwd -P`
CPM_CACHE_DIR=$CPM_CALL_DIR/$CPM_CACHE_DIR


baseURL='https://github.com/admiswalker/CPM_libExample_to_IMPORT/raw/main/cpm_import/script/version/0.1.0'
if [ ! -e $CPM_CACHE_DIR/common_fn.sh        ]; then wget -P $CPM_CACHE_DIR $baseURL/common_fn.sh;        fi
if [ ! -e $CPM_CACHE_DIR/download_archive.sh ]; then wget -P $CPM_CACHE_DIR $baseURL/download_archive.sh; fi
if [ ! -e $CPM_CACHE_DIR/download_src.sh     ]; then wget -P $CPM_CACHE_DIR $baseURL/download_src.sh;     fi
if [ ! -e $CPM_CACHE_DIR/install_archive.sh  ]; then wget -P $CPM_CACHE_DIR $baseURL/install_archive.sh;  fi
if [ ! -e $CPM_CACHE_DIR/install_src.sh      ]; then wget -P $CPM_CACHE_DIR $baseURL/install_src.sh;      fi
if [ ! -e $CPM_CACHE_DIR/is_installed.sh     ]; then wget -P $CPM_CACHE_DIR $baseURL/is_installed.sh;     fi
if [ ! -e $CPM_CACHE_DIR/packages_cpm.txt    ]; then wget -P $CPM_CACHE_DIR $baseURL/packages_cpm.txt;    fi
