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


//******************* Show EDX FLAGS (eax=1) ****************


pushw $_showedx
call _putstr
popw %cx


pushw $_edx_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp

//******************* Show ECX FLAGS (eax=1) ****************

pushw $_showecx
call _putstr
popw %cx
call _putnl



pushw $_ecx_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp

//******************* Show ex-EBX FLAGS (eax=7) ****************




pushw $_showebx_ext
call _putstr
popw %cx
call _putnl



pushw $_ebx_ext_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp


//******************* Show ex-ECX FLAGS (eax=7) ****************

pushw $_showecx_ext
call _putstr
popw %cx
call _putnl



pushw $_ecx_ext_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp



//******************* Show hi-EDX FLAGS (eax=0x80000001) ****************


pushw $_showedx_hi
call _putstr
popw %cx
call _putnl



pushw $_edx_hi_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp

//******************* Show hi-ECX FLAGS (eax=0x80000001) ****************

pushw $_showecx_hi
call _putstr
popw %cx
call _putnl



pushw $_ecx_hi_flag
pushw $-1
pushw $-1
call _showflagdata
addw $6,%sp



leave
movw $0x4c00,%ax
int $0x21



.data


_showpresent: .asciz "\t\t<< **Show all flags(saf) for DOS 16 bits** >>\r\n\r\n"
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




