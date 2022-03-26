# Example directory structure: ディレクトリ構成例
#
# root/
#   |
#   + main.cpp (your code)
#   |
#   + Makefile (your makefile): This file
#   |
#   + cpmex/
#       |
#       + cpmex.hpp (head file that you need to include)
#       |
#       + Makefile (Makefile that you need to '$ make')
#       |
#       + make_temp/
#       |   |
#       |   + src/
#       |      |
#       |      + *.d
#       |      |
#       |      + *.o (object files that you need to link "./cpmex/make_temp/*.o")
#       |
#       + src/
#           |
#           + *.cpp
#           |
#           + *.hpp
#           |
#           + *.h

# .o: Objects file
# .d: Depends file

#============================================================
# Please set each item: 各項目を設定してください

# Source files
SRCS = ./main.cpp

# Name of generate file: 生成ファイル名
TARGET = exe

# remove files
RMs  = *.stackdump tmpDir
RMs += ./test_files_to_remove

# Options: コンパイルオプション
CFLAGS  = -L./cpmex/lib -I./cpmex/include -lcpmex # cpmex
CFLAGS += -L./googletest-master/build/lib -I./googletest-master/googletest/include -lgtest -pthread # google test
CFLAGS += -std=c++11 # CFLAGS += -std=gnu++0x
CFLAGS += -Wall
CFLAGS += -O3

#============================================================

BACKUP_DIR   = ./backup
ALL_FILES    = $(wildcard ./*)
TMP_DIRS     = $(wildcard ./tmp_*)
LIBS_DIRS    = ./googletest-master
BACKUP_FILES = $(filter-out ./$(TARGET) $(TMP_DIRS) $(BACKUP_DIR) $(LIBS_DIRS), $(ALL_FILES))
TIME_STAMP   = `date +%Y_%m%d_%H%M`

# test files
HEADS_t      = $(wildcard ./*.py      )
HEADS_t     += $(wildcard ./test/*.py )
HEADS_t     += $(wildcard ./test/*.h  )
HEADS_t     += $(wildcard ./test/*.hpp)

# when you need to check the change of files in lib, you need to change file name to a not-existing name like "FORCE_XXX".
LIB_CPMEX       = FORCE_CPMEX
#LIB_GOOGLETEST = FORCE_GOOGLETEST
#LIB_CPMEX       = ./cpmex/lib/libcpmex.a
LIB_GOOGLETEST = ./googletest-master/build/lib/libgtest.a


$(TARGET): $(LIB_CPMEX) $(LIB_GOOGLETEST) $(SRCS)
	@echo "\n============================================================\n"
	@echo "SRCS: \n$(SRCS)\n"
	@echo "CFLAGS: \n$(CFLAGS)"
	@echo "\n============================================================\n"
	$(CXX) -o $(TARGET) $(SRCS) $(CFLAGS)
	@echo ""


$(LIB_CPMEX):
	@(cd ./cpmex; make -j)


$(LIB_GOOGLETEST):
	@echo ""
	@unzip -n googletest-master.zip
	@(cd ./googletest-master; mkdir -p build; cd build; cmake ..; make)


.PHONY: all
all:
	@(make clean)
	@(make -j)


patch            := *.stackdump
patch_txt_exists := $(shell find -name $(patch))
.PHONY: clean
clean:
	-rm -rf $(TARGET)
	@(cd ./cpmex; make clean)
	-rm -rf googletest-master
	@(find . -name "__pycache__" -type d | xargs rm -rf)
	$(if $(patch_txt_exists) ,$(rm *.stackdump))
	-rm -rf $(RMs)
	-rm -rf test__write_bin_char.png
	-rm -rf test__write_bin_str.png


.PHONY: steps
steps: $(SRCS) $(HEADS_t)
	@(cd ./cpmex; make steps)
	@echo ""
	@echo "$^" | xargs wc -l
