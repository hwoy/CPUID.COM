as = as
ld = ld
ASFLAGS = --32 -march=i586
LDFLAGS = -m elf_i386
libname = libcpuid.a
bin1 = cpuid.com
bin2 = saf.com

.PHONY: all clean
all: $(bin1) $(bin2)

$(bin1): main1.o $(libname)
	$(ld) $(LDFLAGS) -N -e _start -Ttext 0x100 --oformat binary -o $(bin1) -M=m1.map main1.o $(libname)
$(bin2): main2.o $(libname)
	$(ld) $(LDFLAGS) -N -e _start -Ttext 0x100 --oformat binary -o $(bin2) -M=m2.map main2.o $(libname)
main1.o: main1.s
	$(as) $(ASFLAGS) -o main1.o main1.s
main2.o: main2.s
	$(as) $(ASFLAGS) -o main2.o main2.s
$(libname): fcpuid.o fnum.o fstr.o data.o
	ar -rc $(libname) fcpuid.o fnum.o fstr.o data.o
fcpuid.o: fcpuid.s
	$(as) $(ASFLAGS) -o fcpuid.o fcpuid.s
fnum.o: fnum.s
	$(as) $(ASFLAGS) -o fnum.o fnum.s
fstr.o: fstr.s
	$(as) $(ASFLAGS) -o fstr.o fstr.s
data.o: data.s
	$(as) $(ASFLAGS) -o data.o data.s

clean:
	rm -f $(bin1) $(bin2) *.o *~ *.map *.a


