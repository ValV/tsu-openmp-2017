# Place this file in the folder with main.cpp

CC=g++
CPPFLAGS=-g3
LDFLAGS=-fopenmp
BINDIR=Debug
PROG=main

SRC=$(shell find -maxdepth 1 -name '*.cpp')
OBJ=$(addprefix $(BINDIR)/, $(notdir $(SRC:%.cpp=%.o)))
BIN=$(addprefix $(BINDIR)/, $(PROG))

all: $(BIN)

$(BINDIR)/%.o: %.cpp | $(BINDIR)
	$(CC) $(CPPFLAGS) -c -o $@ $<

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

$(BINDIR):
	mkdir -p $@

.ONESHELL: convert

convert: ; @
	for sfile in *.cpp *.h; do
		cp -up $$sfile{,.bak}
		iconv -f cp1251 -t utf-8 -o $$sfile $$sfile.bak
	done

run: all
	$(BIN)

.PHONY: clean

clean:
	rm -f $(BIN) $(OBJ)
