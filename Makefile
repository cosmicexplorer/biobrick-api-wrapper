.PHONY: all clean distclean

NODE_DIR := node_modules
NPM_BIN := $(NODE_DIR)/.bin
COFFEE_CC := $(NPM_BIN)/coffee
DEPS := $(COFFEE_CC)

coffee_in := $(wildcard *.coffee)
js_out := $(patsubst %.coffee,%.js,$(coffee_in))

all: $(js_out)

%.js: %.coffee $(COFFEE_CC)
	$(COFFEE_CC) -bc --no-header $<

clean:
	rm -f $(js_out)

distclean: clean
	rm -rf $(NODE_DIR)

$(DEPS):
	npm install
