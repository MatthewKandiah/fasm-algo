# fasm-algo

## Debugger use
Turns out fasm will only output symbol files in a non-standard format. Options are to either output an object file and use a linker like `ld` to build the executable file, or convert the non-standard format to a standard ELF object. 

I've done the latter, it keeps the build a little simpler. Script to do this has been vendored in from https://github.com/hidnplayr/fas_to_elf/tree/main. Make commands need to include the script call if we want the symbol file for debugging, the script outputs gdb commands for how to load and use it. e.g.
> GDB usage:
>  (gdb) add-symbol-file bin/hello.dbg.elf 0
>  (gdb) info functions
>  (gdb) b _start
