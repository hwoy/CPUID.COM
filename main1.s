/*

void cpuid(unsigned int loweax,unsigned int hieax,REG32 *reg);
void getcouname(char str[13]);
void putstr(const char *str);
void parsenum(unisigned int num ,unsigned int base,char * buff,const char *parse);
void putnum(unsigned int num);
void putnumhex(unsigned int num);
void putnumbin(unsigned int num);
void putnl(void);
int testbit(unsigned int low,unsigned int high,int bit);
unsigned int cropbit(unsigned int low,unsigned int hi,int low,int hi);
void showflagdata(unsigned int lowREG32,unsigned int hiREG32,void *data_flag);
int getcpubrandstr(char str[49]);

extern void *edx_flag[];
extern void *ecx_flag[];
extern void *ebx_ext_flag[];
extern void *ecx_ext_flag[];
extern void *edx_hi_flag[];
extern void *ecx_hi_flag[];

*/

.equ EAX,0
.equ EBX,4
.equ ECX,8
.equ EDX,12

.code16
.globl _start

.text



_start:
enter $0,$0


//******************* Show Presentation ****************
pushw $_showpresent
call _putstr
popw %cx


//******************* Show CPU Model (eax=1) ****************


pushw $_REGS32
pushw $0
pushw $1
call _cpuid
addw $6,%sp



pushw $_showmodel
call _putstr
popw %cx


pushw $_cpustr
call _getcpubrandstr
popw %cx
testw %ax,%ax
jz 1f

pushw $_cpubrandname
call _putstr
popw %cx

pushw $_cpustr
call _putstr
popw %cx

call _putnl

1:
pushw $_cpuname
call _putstr
popw %cx

pushw $_cpustr
call _getcpuname
popw %cx

pushw $_cpustr
call _putstr
popw %cx

call _putnl


pushw $_ptype
call _putstr
popw %cx
pushw $13
pushw $12
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx
call _putnl





pushw $_family
call _putstr
popw %cx
pushw $11
pushw $8
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx

pushw $_xfamily
call _putstr
popw %cx
pushw $27
pushw $20
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx

call _putnl





pushw $_model
call _putstr
popw %cx
pushw $7
pushw $4
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx

pushw $_xmodel
call _putstr
popw %cx
pushw $19
pushw $16
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx

call _putnl



pushw $_step
call _putstr
popw %cx
pushw $3
pushw $0
pushw _REGS32+EAX+2
pushw _REGS32+EAX
call _cropbit
addw $8,%sp
pushw %ax
call _putnumhex
popw %cx
call _putnl

//******************* Show EDX FLAGS (eax=1) ****************


pushw $_showedx
call _putstr
popw %cx


pushw $_edx_flag
pushw _REGS32+EDX+2
pushw _REGS32+EDX
call _showflagdata
addw $6,%sp

//******************* Show ECX FLAGS (eax=1) ****************

pushw $_showecx
call _putstr
popw %cx
call _putnl



pushw $_ecx_flag
pushw _REGS32+ECX+2
pushw _REGS32+ECX
call _showflagdata
addw $6,%sp

//******************* Show ex-EBX FLAGS (eax=7) ****************

pushw $_REGS32
pushw $0
pushw $7
call _cpuid
addw $6,%sp



pushw $_showebx_ext
call _putstr
popw %cx
call _putnl



pushw $_ebx_ext_flag
pushw _REGS32+EBX+2
pushw _REGS32+EBX
call _showflagdata
addw $6,%sp


//******************* Show ex-ECX FLAGS (eax=7) ****************

pushw $_showecx_ext
call _putstr
popw %cx
call _putnl



pushw $_ecx_ext_flag
pushw _REGS32+ECX+2
pushw _REGS32+ECX
call _showflagdata
addw $6,%sp


//******************* Hi-flags testing ****************
movl $0x80000000,%eax
cpuid
cmpl $0x80000000,%eax
jna _start_end


//******************* Show hi-EDX FLAGS (eax=0x80000001) ****************

pushw $_REGS32
pushw $0x8000
pushw $0x0001
call _cpuid
addw $6,%sp

pushw $_showedx_hi
call _putstr
popw %cx
call _putnl



pushw $_edx_hi_flag
pushw _REGS32+EDX+2
pushw _REGS32+EDX
call _showflagdata
addw $6,%sp

//******************* Show hi-ECX FLAGS (eax=0x80000001) ****************

pushw $_showecx_hi
call _putstr
popw %cx
call _putnl



pushw $_ecx_hi_flag
pushw _REGS32+ECX+2
pushw _REGS32+ECX
call _showflagdata
addw $6,%sp



_start_end:
leave
movw $0x4c00,%ax
int $0x21



.data


_showpresent: .asciz "\t\t<< **CPUID for DOS 16 bits** >>\r\n\r\n"
_cpubrandname: .asciz "CPU Brand Name:"
_cpuname: .asciz "CPU Name: "
_family: .asciz "CPU Family: "
_xfamily: .asciz "\t\tCPU ex-Family: "
_model: .asciz "CPU Model: "
_xmodel: .asciz "\t\tCPU ex-Model: "
_step: .asciz "CPU Step: "
_ptype: .asciz "CPU Type: "
_showmodel: 
.asciz "\r\n==================== Show CPU Model ===============================\r\n\r\n"
_showedx: 
.asciz "\r\n==================== Show EDX specification =======================\r\n\r\n"
_showecx: 
.asciz "\r\n==================== Show ECX specification =======================\r\n\r\n"
_showebx_ext: 
.asciz "\r\n==================== Show ex-EBX specification ====================\r\n\r\n"
_showecx_ext: 
.asciz "\r\n==================== Show ex-ECX specification ====================\r\n\r\n"
_showedx_hi: 
.asciz "\r\n==================== Show hi-EDX specification ====================\r\n\r\n"
_showecx_hi: 
.asciz "\r\n==================== Show hi-ECX specification ====================\r\n\r\n"


.bss


.lcomm _cpustr,49
.lcomm _REGS32,16

