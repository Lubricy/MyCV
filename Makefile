##
# MyCV
#
# @file
# @version 0.1

.PHONY: clean

all: dist

dist: cv.tex
	mkdir -p $@
	lualatex $< -o $@

clean: 
	rm -r ./dist
# end
