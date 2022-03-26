# Example directory structure: ディレクトリ構成例
#
# root/
#   |
#   + main.cpp (your code)
#   |
#   + Makefile (your makefile)
#   |
#   + cpmex/
#       |
#       + cpmex.hpp (head file that you need to include)
#       |
#       + Makefile (Makefile that you need to '$ make'): This file
#       |
#       + tmpMake/
#       |   |
#       |   + *.d
#       |   |
#       |   + *.o (object files that you need to link "./cpmex/make_temp/*.o")
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

# Set files to do "$ make". If you cont line num of header files, you also need to add header files.
# ソースファイルの場所 ($make steps コマンドで，ヘッダファイルの行数もカウントする場合は，
# ヘッダファイルのディレクトリも追加する必要があります．また，拡張子を記述してはいけません)
DIR  = ./*.
DIR += ./src/*.
DIR += ./src/math/*.

# Name of generate file: 生成ファイル名
TARGET = libcpmex.a

# Options: コンパイルオプション
CFLAGS  = -std=gnu++0x
CFLAGS += -Wall
CFLAGS += -O3

#============================================================

SRCDIR   = $(patsubst %., %.cpp, $(DIR))
SRCS     = $(wildcard $(SRCDIR))

HDIR     = $(patsubst %., %.h, $(DIR))
HEADS    = $(wildcard $(HDIR))

HPPDIR   = $(patsubst %., %.hpp, $(DIR))
HEADppS  = $(wildcard $(HPPDIR))

TEMP_DIR = tmpMake
OBJS     = $(addprefix $(TEMP_DIR)/, $(patsubst %.cpp, %.o, $(SRCS)))
#OBJS     = $(addprefix $(TEMP_DIR)/, $(SRCS:%.cpp=%.o))#別表記

DEPS  = $(addprefix $(TEMP_DIR)/, $(patsubst %.cpp, %.d, $(SRCS)))
#DEPS  = $(addprefix $(TEMP_DIR)/, $(SRCS:%.cpp=%.d))#別表記


# $(TARGET) を生成する
# .a ファイルとしてオブジェクトファイルを梱包する
$(TARGET): $(OBJS)
	@echo -e "\n============================================================\n"
	@echo -e "SRCS: \n$(SRCS)\n"
	@echo -e "OBJS: \n$(OBJS)\n"
	@echo -e "CFLAGS: \n$(CFLAGS)"
	@echo -e "\n============================================================\n"
	@mkdir -p ./lib
	ar rc ./lib/$(TARGET) $(OBJS)
	@(make COPY_heads)
	@echo ""


.PHONY: COPY_heads
COPY_heads: $(HEADppS) $(HEADS) $(PYS)
	@echo "COPY_heads"
	@mkdir -p ./include/cpmex
	@cp LICENSE ./include/cpmex/
	@echo $^ | xargs -n 1 | xargs -I {} cp {} ./include/cpmex --parents -P


# 各ファイルの分割コンパイル
$(TEMP_DIR)/%.o: %.cpp
	@echo ""
	mkdir -p $(dir $@);\
	$(CXX) $< -c -o $@ $(CFLAGS)


# 「-include $(DEPS)」により，必要な部分のみ分割で再コンパイルを行うため，依存関係を記した *.d ファイルに生成する
$(TEMP_DIR)/%.d: %.cpp
	@echo ""
	mkdir -p $(dir $@);\
	$(CXX) $< -MM $(CFLAGS)\
	| sed 's/$(notdir $*)\.o/$(subst /,\/,$(patsubst %.d,%.o,$@) $@)/' > $@;\
	[ -s $@ ] || rm -f $@
#	@echo $*	# for debug
#	@echo $@	# for debug


.PHONY: all
all:
	@(make clean)
	@(make -j)
#	make clean ; \	#別表記
#	make			#別表記


.PHONY: steps
steps: $(SRCS) $(HEADppS) $(HEADS)
	@echo "$^" | xargs wc -l


.PHONY: clean
clean:
	-rm -rf $(TEMP_DIR) $(TARGET)
	-rm -rf include
	-rm -rf lib
#	-rm -f $(OBJS) $(DEPS) $(TARGET)


-include $(DEPS)


# $@ : ターゲット名
# $^ : 依存ファイルのリスト
# $< : 最初の依存ファイル

# $@ : ターゲットファイル名
# $% : ターゲットがアーカイブメンバだったときのターゲットメンバ名
# $< : 最初の依存するファイルの名前
# $? : ターゲットより新しいすべての依存するファイル名
# $^ : すべての依存するファイルの名前
# $+ : Makefileと同じ順番の依存するファイルの名前
# $* : サフィックスを除いたターゲットの名前
