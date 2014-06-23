as = as
ld = ld
ASFLAGS = --32 -march=i486
LDFLAGS = -m elf_i386
bin1 = cpuid.com
bin2 = saf.com

.PHONY: all clean
all: $(bin1) $(bin2)

$(bin1): main1.o fbasic.o data.o
	$(ld) $(LDFLAGS) -N -e _start -Ttext 0x100 --oformat binary -o $(bin1) -M=m1.map main1.o fbasic.o data.o
$(bin2): main2.o fbasic.o data.o
	$(ld) $(LDFLAGS) -N -e _start -Ttext 0x100 --oformat binary -o $(bin2) -M=m2.map main2.o fbasic.o data.o
main1.o: main1.s
	$(as) $(ASFLAGS) -o main1.o main1.s
main2.o: main2.s
	$(as) $(ASFLAGS) -o main2.o main2.s
fbasic.o: fbasic.s
	$(as) $(ASFLAGS) -o fbasic.o fbasic.s
data.o: data.s
	$(as) $(ASFLAGS) -o data.o data.s

clean:
	rm -f $(bin1) $(bin2) *.o *~ *.map


