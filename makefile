#gcc -c -g -Os -march=i686 -ffreestanding -Wall -Werror -I. -o vbr.o vbr.c
#ld -static -Tlinker.ld -nostdlib --nmagic -o vbr.elf vbr.o
#objcopy -O binary vbr.elf vbr.bin

vbr.bin: vbr.elf
	objcopy -O binary $< $@

vbr.elf: vbr.o
	ld -static -Tlinker.ld -nostdlib --nmagic -o $@ $<

vbr.o: vbr.c code16gcc.h
	#gcc -g -Os -march=i686 -ffreestanding -Wall -Werror -I. -c $<
	gcc -Os -march=i686 -ffreestanding -Wall -Werror -I. -c $<
clean:
	rm -rf *.o
