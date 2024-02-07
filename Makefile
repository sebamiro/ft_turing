#
# 	ft_turing _Makefile
# 	smiro
#	2024-02
#

NAME = ft_turing
BIN_DIR = bin
BIN = $(BIN_DIR)/$(NAME)

-include src/src.mk

all: $(BIN)

run: $(BIN)
	$<
PHONY: run

$(BIN): $(SOURCE) $(BIN_DIR)
	ocamlopt -o $@ $(SOURCE) -I $(SRC_DIR)

$(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf $(addsuffix .cmi, $(basename $(SOURCE)))
	rm -rf $(addsuffix .cmo, $(basename $(SOURCE)))
	rm -rf $(addsuffix .cmx, $(basename $(SOURCE)))
	rm -rf $(addsuffix .o, $(basename $(SOURCE)))

fclean: clean
	rm -rf $(BIN)
PHONY: fclean

