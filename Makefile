ifeq ($(shell uname -s),Darwin)
	SKK_JISYO_DIR ?= $(HOME)/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries
else
	SKK_JISYO_DIR ?= $(XDG_DATA_HOME)/skk
endif
SKK_USER_JISYO ?= $(SKK_JISYO_DIR)/skk-jisyo.utf8

.DEFAULT_GOAL := all

.PHONY: help
help: ## Show targets in this Makefile
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | sort \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[m %s\n", $$1, $$2}'

.PHONY: diff
diff: ## Show manually registered entries in user jisyo
	@bash -c 'skkdic-expr2 $(SKK_USER_JISYO) - <(nkf $(SKK_JISYO_DIR)/SKK-JISYO.*)'

.PHONY: all
all: $(foreach jisyo,$(wildcard SKK-JISYO.*),$(SKK_JISYO_DIR)/$(jisyo)) ## Install all jisyo files (default)

$(SKK_JISYO_DIR)/SKK-JISYO.%: SKK-JISYO.%
# NOTE: Use cp because macSKK forbids symbolic link for security reason
ifeq ($(shell uname -s),Darwin)
	cp -f $< $(SKK_JISYO_DIR)
else
	ln -snf $< $(SKK_JISYO_DIR)
endif

.PHONY: fcitx5-skk
fcitx5-skk: ## Generate fcitx5-skk dictionary_list file
	@{ \
	  echo type=file,file=$(abspath $(SKK_USER_JISYO)),mode=readwrite,encoding=UTF-8; \
	  $(foreach jisyo,$(wildcard SKK-JISYO.*), \
	    echo type=file,file=$(abspath $(SKK_JISYO_DIR)/$(jisyo)),mode=readonly,encoding=UTF-8; \
	  ) \
	  echo type=file,file=/usr/share/skk/SKK-JISYO.L,mode=readonly; \
	} > $(XDG_DATA_HOME)/fcitx5/skk/dictionary_list
