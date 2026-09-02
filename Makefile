.PHONY: all
all: \
	hello.bin \
	insertion-sort.bin

.PHONY: clean
clean:
	find . -type f -name '*.bin' -delete

hello.bin: hello/main.asm
	fasm $< $@

insertion-sort.bin: insertion-sort/main.asm $(wildcard insertion-sort/data*.txt)
	fasm $< $@
