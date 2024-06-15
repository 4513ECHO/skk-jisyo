ifeq ($(shell uname -s),Darwin)
	SKK_JISYO_DIR ?= ~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries
else
	SKK_JISYO_DIR ?= $(XDG_DATA_HOME)/skk
endif
SKK_USER_JISYO ?= $(SKK_JISYO_DIR)/skk-jisyo.utf8

.DEFAULT_GOAL := all

.PHONY: diff
diff:
	@bash -c 'skkdic-expr2 $(SKK_USER_JISYO) - <(nkf $(SKK_JISYO_DIR)/SKK-JISYO.*)'

.PHONY: help
help:
	@echo 'Targets:'
	@echo '  all: Install all JISYO files (default)'
	@echo '  diff: Show manually registered entries in user JISYO'
	@echo '  help: Show this help message'

.PHONY: all
all: $(foreach jisyo,$(wildcard SKK-JISYO.*),$(SKK_JISYO_DIR)/$(jisyo))

$(SKK_JISYO_DIR)/SKK-JISYO.%: SKK-JISYO.%
# NOTE: Use cp because macSKK forbids symbolic link for security reason
ifeq ($(shell uname -s),Darwin)
	cp -f $< $(SKK_JISYO_DIR)
else
	ln -snf $(abspath $<) $(SKK_JISYO_DIR)
endif
