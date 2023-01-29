SHELL := /bin/bash

.PHONY: all download-checksums update-checksums

all: download-checksums update-checksums

download-checksums:
	./gradle-wrapper-download-checksums > gradle-wrapper-checksums

update-checksums:
	sed -n '1,/^sha256sums=/p' < gradle-wrapper-verify \
	  >  gradle-wrapper-verify.updated
	cut -d= -f2 < gradle-wrapper-checksums | sort | uniq | sed 's/^/  /' \
	  >> gradle-wrapper-verify.updated
	sed -n '/^) # sha256sums/,$$p' < gradle-wrapper-verify \
	  >> gradle-wrapper-verify.updated
	mv gradle-wrapper-verify.updated gradle-wrapper-verify
	chmod +x gradle-wrapper-verify
