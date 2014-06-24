.code16

.text




//*******************************************************    void putstr(const char *str)
.globl _putstr
_putstr:
enter $0,$0
pushw %si

movw 4(%bp),%si

_putstr_loop:

cld
lodsb

testb %al,%al
jz _putstr_end


movb $2,%ah
movb %al,%dl
int $0x21


jmp _putstr_loop

_putstr_end:

popw %si
leave
ret



//*******************************************************    void putnl(void)
.globl _putnl
_putnl:
enter $0,$0
movb $2,%ah
movb $13,%dl
int $0x21

movb $2,%ah
movb $10,%dl
int $0x21

leave
ret

