##
# MyCV
#
# @file
# @version 0.1

ROOT_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

.PHONY: clean

all: dist

dist: cv.tex
	mkdir -p $@
	docker run \
		--rm -t -i \
		-v $(ROOT_DIR):/src \
		-w /src \
		-e http_proxy \
		-e HTTP_PROXY \
		-e https_proxy \
		-e HTTPS_PROXY \
		ghcr.io/xu-cheng/texlive-full:latest \
		bash -c "apk add ttf-font-awesome;fc-cache -fv;latexmk \
		-lualatex \
		--file-line-error \
		--halt-on-error \
		--interaction=nonstopmode \
		--output-directory=$@ \
		$<"
clean: 
	rm -r ./dist
# end
