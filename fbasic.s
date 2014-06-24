.code16

.text


//*******************************************************   void cpuid(unsigned int loweax,unsigned int hieax,REG32 *reg)
.globl _cpuid
_cpuid:
enter $8,$0

movl %ebx,-4(%bp)
movl %edi,-8(%bp)

movl 4(%bp),%eax

cpuid

movw 8(%bp),%di
movl %eax,(%di)
movl %ebx,4(%di)
movl %ecx,8(%di)
movl %edx,12(%di)

movl -4(%bp),%ebx
movl -8(%bp),%edi

leave
ret

//*******************************************************   void getcouname(char str[13])
.globl _getcpuname
_getcpuname:
enter $18,$0
pushw %di
pushw %si

movw 4(%bp),%ax
movw %ax,-2(%bp)

leaw -18(%bp),%ax
pushw %ax
pushw $0
pushw $0
call _cpuid
addw $6,%sp

movw -2(%bp),%di
leaw -18(%bp),%si

movl %ss:4(%si),%eax
movl %eax,(%di)

movl %ss:12(%si),%eax
movl %eax,4(%di)

movl %ss:8(%si),%eax
movl %eax,8(%di)

movb $0,12(%di)

popw %si
popw %di
leave
ret


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

//*******************************************************    int testbit(unsigned int low,unsigned int high,int bit)
.globl _testbit
_testbit:
enter $0,$0

movl 4(%bp),%eax
xorl %ecx,%ecx
movw 8(%bp),%cx
movl $1,%edx
shll %cl,%edx

testl %edx,%eax
jz _testbit_0
movw $1,%ax
jmp _testbit_end

_testbit_0:
xorw %ax,%ax

_testbit_end:
leave
ret


//*******************************************************    unsigned int cropbit(unsigned int low,unsigned int hi,int low,int hi)
.globl _cropbit
_cropbit:
enter $0,$0
movl 4(%bp),%eax

movw $31,%cx
subw 10(%bp),%cx

shll %cl,%eax

movw 10(%bp),%dx
subw 8(%bp),%dx


movw $31,%cx
subw %dx,%cx

shrl %cl,%eax


leave
ret


//*******************************************************    void showflagdata(unsigned int lowREG32,unsigned int hiREG32,void *data_flag)
.globl _showflagdata
_showflagdata:
enter $0,$0
pushw %bx
pushw %si


cld
movw 8(%bp),%si
_showflagdata_loop:
lodsw
testw %ax,%ax
jz _showflagdata_end

xorw %dx,%dx
movw %ax,%bx
movb (%bx),%dl
pushw %dx

movw 6(%bp),%ax
pushw %ax
movw 4(%bp),%ax
pushw %ax

call _testbit
addw $6,%sp

testw %ax,%ax
jz _showflagdata_loop

incw %bx
pushw %bx
call _putstr
popw %cx
call _putnl

jmp _showflagdata_loop


_showflagdata_end:
popw %si
popw %bx
leave
ret


//*******************************************************    int getcpubrandstr(char str[49])

.globl _getcpubrandstr
_getcpubrandstr:
enter $4,$0
pushw %di
movl %esi,-4(%bp)

movl $0x80000000,%eax
cpuid
cmpl $0x80000004,%eax
jb _getcpubrandstr_0

movw 4(%bp),%di
movl $0x80000002,%esi

_getcpubrandstr_loop:
movl %esi,%eax

cpuid

movl %eax,(%di)
movl %ebx,4(%di)
movl %ecx,8(%di)
movl %edx,12(%di)

addw $16,%di
incl %esi
cmpl $0x80000004,%esi
jbe _getcpubrandstr_loop

movw $1,%ax
movb %ah,(%di)
jmp _getcpubrandstr_end

_getcpubrandstr_0:
xorw %ax,%ax

_getcpubrandstr_end:
movl -4(%bp),%esi
popw %di
leave
ret




