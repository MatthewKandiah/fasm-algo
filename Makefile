.PHONY: all
all: \
	bin/hello.bin \
	bin/insertion-sort.bin

.PHONY: clean
clean:
	find . -type f -name '*.bin' -delete
	find . -type f -name '*.o' -delete
	find . -type f -name '*.fas' -delete
	find . -type f -name '*.elf' -delete

bin/hello.bin: hello/main.asm $(wildcard shared/*)
	fasm -s bin/hello.fas $< $@
	python3 fas_to_elf_dbg.py bin/hello.fas -o bin/hello.dbg.elf

bin/insertion-sort.bin: insertion-sort/main.asm $(wildcard insertion-sort/data*.txt) $(wildcard shared/*)
	fasm -s bin/insertion-sort.fas $< $@
	python3 fas_to_elf_dbg.py bin/insertion-sort.fas -o bin/insertion-sort.dbg.elf
