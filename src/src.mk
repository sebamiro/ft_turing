#
# 	ft_turing _src.mk
# 	smiro
#	2024-02
#

SRC_DIR = src
SOURCE_FILE =  action.mli \
			   state.ml \
			   main.ml

SOURCE = $(addprefix $(SRC_DIR)/, $(SOURCE_FILE))
