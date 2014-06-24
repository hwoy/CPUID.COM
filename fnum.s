.code16

.text








//*******************************************************    void parsenum(unisigned int num ,unsigned int base,char * buff,const char *parse)
.globl _parsenum
_parsenum:
enter $0,$0
pushw %si
pushw %di

xorw %cx,%cx
movw 4(%bp),%ax

_parsenum_loop:
xorw %dx,%dx

divw 6(%bp)

pushw %dx
incw %cx
testw %ax,%ax
jz _parsenum_addbuff
jmp _parsenum_loop

_parsenum_addbuff:
movw 8(%bp),%di

_parsenum_loop2:
movw 10(%bp),%si
testw %cx,%cx
jz _parsenum_end
popw %ax
addw %ax,%si
movb (%si),%al
movb %al,(%di)
incw %di
decw %cx
jmp _parsenum_loop2

_parsenum_end:
movb $0,(%di)
popw %di
popw %si
leave
ret
//*******************************************************    void putnum(unsigned int num)
.globl _putnum
_putnum:
enter $17,$0
leaw -17(%bp),%ax

pushw $_parsestr
pushw %ax
pushw $10
pushw 4(%bp)
call _parsenum
addw $8,%sp

leaw -17(%bp),%ax
pushw %ax
call _putstr
popw %cx

leave
ret

//*******************************************************    void putnumhex(unsigned int num)
.globl _putnumhex
_putnumhex:
enter $17,$0
leaw -17(%bp),%ax

pushw $_parsestr
pushw %ax
pushw $16
pushw 4(%bp)
call _parsenum
addw $8,%sp

leaw -17(%bp),%ax
pushw %ax
call _putstr
popw %cx

leave
ret

//*******************************************************    void putnumbin(unsigned int num)
.globl _putnumbin
_putnumbin:
enter $17,$0
leaw -17(%bp),%ax

pushw $_parsestr
pushw %ax
pushw $2
pushw 4(%bp)
call _parsenum
addw $8,%sp

leaw -17(%bp),%ax
pushw %ax
call _putstr
popw %cx

leave
ret





.data
_parsestr: .asciz "0123456789ABCDEF"


