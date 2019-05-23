#
# == Paths ==
#
BIN_DIR   := bin
LIB_DIR   := lib
BUILD_DIR := build

#
# == Files ==
#
LIBS := $(wildcard $(LIB_DIR)/*.cpp)
OBJS = $(LIBS:.cpp=.o)
#TODO: Do this more intelligently
BUILD_OBJS = $(foreach obj,$(OBJS),$(BUILD_DIR)/$(notdir $(obj)))

#
# == CC Flags ==
#
CC      := c++
CFLAGS = -fpermissive

#
# == Targets ==
#

default: parse
objs: $(OBJS)


clean:
	$(RM) $(BUILD_DIR)/*.o $(BIN_DIR)/*

%.o: %.cpp
	$(CC) -o $(BUILD_DIR)/$(notdir $@) $(CFLAGS) -c $<

parse: $(OBJS) 
	$(CC) -o $(BIN_DIR)/parse $(BUILD_OBJS)
