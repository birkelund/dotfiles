# general
set disassembly-flavor intel
set disable-randomization off
set pagination off
set follow-fork-mode child

# history
set history filename ~/.gdbhistory
set history save
set history expansion

# output format
set output-radix 0x10

# defines
define qemu-debug
	handle SIGUSR1 pass noprint
end
