.code16

.data

//****************************************************************** EAX=1, EDX ********************************************
 _edx_fpu: .byte 0 
.asciz "fpu:			Onboard x87 FPU"
 _edx_vme: .byte 1 
.asciz "vme:			Virtual 8086 mode extensions (VIF)"
 _edx_de:  .byte 2 
.asciz "de:			Debugging extensions (CR4 bit 3)"
 _edx_pse: .byte 3 
.asciz "pse:			Page Size Extension"
 _edx_tsc: .byte 4 
.asciz "tsc:			Time Stamp Counter"
 _edx_msr: .byte 5 
.asciz "msr: 			Model-specific registers"
 _edx_pae: .byte 6 
.asciz "pae: 			Physical Address Extension"
 _edx_mce: .byte 7 
.asciz "mce: 			Machine Check Exception"
 _edx_cx8: .byte 8 
.asciz "cx8: 			CMPXCHG8 (compare-and-swap)"
 _edx_apic: .byte 9 
.asciz "apic:			Onboard Advanced Programmable Interrupt Controller"

 _edx_sep: .byte 11 
.asciz "sep: 			SYSENTER and SYSEXIT instructions"
 _edx_mtrr: .byte 12 
.asciz "mtrr: 			Memory Type Range Registers"
 _edx_pge:  .byte 13 
.asciz "pge: 			Page Global Enable bit in CR4 "
 _edx_mca: .byte 14 
.asciz "mca: 			Machine check architecture"
 _edx_cmov: .byte 15 
.asciz "cmov: 			Conditional move and FCMOV instructions"
 _edx_pat: .byte 16 
.asciz "pat: 			Page Attribute"
 _edx_pse_36: .byte 17 
.asciz "pse_36: 		36-bit page size extension"
 _edx_psn: .byte 18 
.asciz "psn: 			Processor Serial Number"
 _edx_clfsh: .byte 19 
.asciz "clfsh: 			CLFLUSH instruction (SSE2)"

 _edx_ds: .byte 21 
.asciz "ds: 			Debug store save: trace of executed jumps"
 _edx_acpi: .byte 22 
.asciz "acpi: 			Onboard thermal control MSRs for ACPI"
 _edx_mmx: .byte 23 
.asciz "mmx: 			MMX instructions"
 _edx_fxsr: .byte 24 
.asciz "fxsr: 			FXSAVE, FXRESTOR instructions, CR4 bit 9"
 _edx_sse: .byte 25 
.asciz "sse: 			SSE instructions (a.k.a. Katmai NewInstructions)"
 _edx_sse2: .byte 26 
.asciz "sse2: 			SSE2 instructions"
 _edx_ss: .byte 27 
.asciz "ss: 			CPU cache supports self-snoop"
 _edx_htt: .byte 28 
.asciz "htt: 			Hyper-threading"
 _edx_tm: .byte 29 
.asciz "tm: 			Thermal monitor automatically limits temperature"
 _edx_ia64: .byte 30 
.asciz "ia64: 			IA64 processor emulating x86"
 _edx_pbe :.byte 31 
.asciz "pbe: 			Pending Break Enable (PBE# pin) wakeup support"


.globl _edx_flag
_edx_flag:	
			.word _edx_fpu
			.word _edx_vme 
			.word _edx_de
			.word _edx_pse
			.word _edx_tsc
			.word _edx_msr
			.word _edx_pae
			.word _edx_mce
			.word _edx_cx8
			.word _edx_apic 

			.word _edx_sep 
			.word _edx_mtrr 
			.word _edx_pge
			.word _edx_mca
			.word _edx_cmov
			.word _edx_pat
			.word _edx_pse_36
			.word _edx_psn
			.word _edx_clfsh 

			.word _edx_ds
			.word _edx_acpi
			.word _edx_mmx
			.word _edx_fxsr
			.word _edx_sse
			.word _edx_sse2
			.word _edx_ss
			.word _edx_htt
			.word _edx_tm
			.word _edx_ia64
			.word _edx_pbe
			.word 0


//****************************************************************** EAX=1, ECX ********************************************
_ecx_sse3: .byte 0 
.asciz "sse3: 			Prescott New Instructions-SSE3 (PNI)"
_ecx_pclmulqdq: .byte 1 
.asciz "pclmulqdq: 		PCLMULQDQ support"
_ecx_dtes64: .byte 2 
.asciz "dtes64: 		64-bit debug store (edx bit 21)"
_ecx_monitor: .byte 3 
.asciz "monitor: 		MONITOR and MWAIT instructions (SSE3)"
_ecx_ds_cpl: .byte 4 
.asciz "ds_cpl: 		CPL qualified debug store"
_ecx_vmx: .byte 5 
.asciz "vmx: 			Virtual Machine eXtensions"
_ecx_smx: .byte 6 
.asciz "smx: 			Safer Mode Extensions (LaGrande)"
_ecx_est: .byte 7 
.asciz "est: 			Enhanced SpeedStep"
_ecx_tm2: .byte 8 
.asciz "tm2: 			Thermal Monitor 2"
_ecx_ssse3: .byte 9 
.asciz "ssse3: 			Supplemental SSE3 instructions"
_ecx_cnxt_id: .byte 10 
.asciz "cnxt_id: 		L1 Context ID"

_ecx_fma: .byte 12 
.asciz "fma: 			Fused multiply-add (FMA3)"
_ecx_cx16: .byte 13 
.asciz "cx16: 			CMPXCHG16B instruction"
_ecx_xtpr: .byte 14 
.asciz "xtpr: 			Can disable sending task priority messages"
_ecx_pdcm: .byte 15 
.asciz "pdcm: 			Perfmon & debug capability"

_ecx_pcid: .byte 17 
.asciz "pcid: 			Process context identifiers (CR4 bit 17)"
_ecx_dca: .byte 18 
.asciz "dca: 			Direct cache access for DMA writes"
_ecx_sse4_1: .byte 19 
.asciz "sse4_1: 		SSE4.1 instructions"
_ecx_sse4_2: .byte 20 
.asciz "sse4_2: 		SSE4.2 instructions"
_ecx_x2apic: .byte 21 
.asciz "x2apic: 		x2APIC support"
_ecx_movbe: .byte 22 
.asciz "movbe: 			MOVBE instruction (big-endian)"
_ecx_popcnt: .byte 23 
.asciz "popcnt: 		POPCNT instruction"
_ecx_tsc_deadline: .byte 24 
.asciz "tsc_deadline: 		APIC supports one-shot operation using a TSC deadline value"
_ecx_aes: .byte 25 
.asciz "aes: 			AES instruction set"
_ecx_xsave: .byte 26 
.asciz "xsave: 			XSAVE, XRESTOR, XSETBV, XGETBV"
_ecx_osxsave: .byte 27 
.asciz "osxsave: 		XSAVE enabled by OS"
_ecx_avx: .byte 28 
.asciz "avx: 			Advanced Vector Extensions"
_ecx_f16c: .byte 29 
.asciz "f16c: 			F16C (half-precision) FP support"
_ecx_rdrnd: .byte 30 
.asciz "rdrnd: 			RDRAND (on-chip random number generator) support"
_ecx_hypervisor: .byte 31 
.asciz "hypervisor: 		Running on a hypervisor (always 0 on a real CPU, but also with some hypervisors)"


.globl _ecx_flag
_ecx_flag: 	
			.word  _ecx_sse3
			.word  _ecx_pclmulqdq
			.word  _ecx_dtes64
			.word  _ecx_monitor
			.word  _ecx_ds_cpl
			.word  _ecx_vmx
			.word  _ecx_smx
			.word  _ecx_est
			.word  _ecx_tm2
			.word  _ecx_ssse3
			.word  _ecx_cnxt_id

			.word  _ecx_fma
			.word  _ecx_cx16
			.word  _ecx_xtpr
			.word  _ecx_pdcm

			.word  _ecx_pcid
			.word  _ecx_dca
			.word  _ecx_sse4_1
			.word  _ecx_sse4_2
			.word  _ecx_x2apic
			.word  _ecx_movbe
			.word  _ecx_popcnt
			.word  _ecx_tsc_deadline
			.word  _ecx_aes
			.word  _ecx_xsave
			.word  _ecx_osxsave
			.word  _ecx_avx
			.word  _ecx_f16c
			.word  _ecx_rdrnd
			.word  _ecx_hypervisor
			.word 0
			
			
//****************************************************************** EAX=7, EBX extend********************************************

_ebx_ext_fsgbase: .byte 0 
.asciz "fsgbase: 		Access to base of %fs and %gs"

_ebx_ext_bmi1: .byte 3 
.asciz "bmi1: 			Bit Manipulation Instruction Sets"
_ebx_ext_hle: .byte 4 
.asciz "hle: 			Transactional Synchronization Extensions"
_ebx_ext_avx2: .byte 5 
.asciz "avx2: 			Advanced Vector Extensions 2"

_ebx_ext_smep: .byte 7 
.asciz "smep: 			Supervisor-Mode Execution Prevention"
_ebx_ext_bmi2: .byte 8 
.asciz "bmi2: 			Bit Manipulation Instruction Sets"
_ebx_ext_erms: .byte 9 
.asciz "erms: 			Enhanced REP MOVSB/STOSB"
_ebx_ext_invpcid: .byte 10 
.asciz "invpcid: 		INVPCID instruction"
_ebx_ext_rtm: .byte 11 
.asciz "rtm: 			Transactional Synchronization Extensions"

_ebx_ext_mpx: .byte 14 
.asciz "mpx: 			Intel MPX (Memory Protection Extensions)"
_ebx_ext_avx512f: .byte 16 
.asciz "avx512f: 		AVX-512 Foundation"
_ebx_ext_rdseed: .byte 18 
.asciz "rdseed: 		RDSEED instruction"
_ebx_ext_adx: .byte 19 
.asciz "adx: 			Intel ADX (Multi-Precision Add-Carry Instruction Extensions)"
_ebx_ext_smap: .byte 20 
.asciz "smap: 			Supervisor Mode Access Prevention"

_ebx_ext_ipt: .byte 25 
.asciz "ipt: 			Intel Processor Trace"
_ebx_ext_avx512pf: .byte 26 
.asciz "avx512pf: 		AVX-512 PFI (Prefetch Instructions)"
_ebx_ext_avx512er: .byte 27 
.asciz "avx512er: 		AVX-512 ERI (Exponential and Reciprocal Instructions)"
_ebx_ext_avx512cd: .byte 28 
.asciz "avx512cd: 		AVX-512 CDI (Conflict Detection Instructions)"
_ebx_ext_sha: .byte 29 
.asciz "sha: 			Intel SHA extensions"

.globl _ebx_ext_flag
_ebx_ext_flag: 	
				.word _ebx_ext_fsgbase

				.word _ebx_ext_bmi1
				.word _ebx_ext_hle
				.word _ebx_ext_avx2

				.word _ebx_ext_smep
				.word _ebx_ext_bmi2
				.word _ebx_ext_erms
				.word _ebx_ext_invpcid
				.word _ebx_ext_rtm

				.word _ebx_ext_mpx
				.word _ebx_ext_avx512f
				.word _ebx_ext_rdseed
				.word _ebx_ext_adx
				.word _ebx_ext_smap

				.word _ebx_ext_ipt
				.word _ebx_ext_avx512pf
				.word _ebx_ext_avx512er
				.word _ebx_ext_avx512cd
				.word _ebx_ext_sha
				.word  0




//****************************************************************** EAX=7, ECX extend********************************************

_ecx_ext_prefetchwt1: .byte 0 
.asciz "prefetchwt1: 		PREFETCHWT1"


.globl _ecx_ext_flag
_ecx_ext_flag: 
				.word _ecx_ext_prefetchwt1
				.word 0
				
				
				

//****************************************************************** EAX=0x80000001, EDX hi********************************************
				
_edx_hi_fpu: .byte 0 
.asciz "fpu: 			Onboard x87 FPU"
_edx_hi_vme: .byte 1 
.asciz "vme: 			Virtual mode extensions (VIF)"
_edx_hi_de:  .byte 2 
.asciz "de: 			Debugging extensions (CR4 bit 3)"
_edx_hi_pse: .byte 3 
.asciz "pse: 			Page Size Extension"
_edx_hi_tsc: .byte 4 
.asciz "tsc: 			Time Stamp Counter"
_edx_hi_msr: .byte 5 
.asciz "msr: 			Model-specific registers"
_edx_hi_pae: .byte 6 
.asciz "pae: 			Physical Address Extension"
_edx_hi_mce: .byte 7 
.asciz "mce: 			Machine Check Exception"
_edx_hi_cx8: .byte 8 
.asciz "cx8: 			CMPXCHG8 (compare-and-swap) instruction"
_edx_hi_apic: .byte 9 
.asciz "apic: 			Onboard Advanced Programmable Interrupt Controller"
_edx_hi_syscall: .byte 11 
.asciz "syscall: 		SYSCALL and SYSRET instructions"
_edx_hi_mtrr: .byte 12 
.asciz "mtrr: 			Memory Type Range Registers"
_edx_hi_pge: .byte 13 
.asciz "pge: 			Page Global Enable bit in CR4"
_edx_hi_mca: .byte 14 
.asciz "mca: 			Machine check architecture"
_edx_hi_cmov: .byte 15 
.asciz "cmov: 			Conditional move and FCMOV instructions"
_edx_hi_pat: .byte 16 
.asciz "pat: 			Page Attribute Table"
_edx_hi_pse36: .byte 17 
.asciz "pse36: 			36-bit page size extension"

_edx_hi_mp: .byte 19 
.asciz "mp: 			Multiprocessor Capable"
_edx_hi_nx: .byte 20 
.asciz "nx: 			NX bit"

_edx_hi_mmxext: .byte 22 
.asciz "mmxext: 		Extended MMX"
_edx_hi_mmx: .byte 23 
.asciz "mmx: 			MMX instructions"
_edx_hi_fxsr: .byte 24 
.asciz "fxsr: 			FXSAVE, FXRSTOR instructions, CR4 bit 9"
_edx_hi_fxsr_opt: .byte 25 
.asciz "fxsr_opt: 		FXSAVE/FXRSTOR optimizations"
_edx_hi_pdpe1gb: .byte 26 
.asciz "pdpe1gb: 		Gibibyte pages"
_edx_hi_rdtscp: .byte 27 
.asciz "rdtscp: 		RDTSCP instruction"

_edx_hi_lm: .byte 29 
.asciz "lm: 			Long mode"
_edx_hi_3dnowext: .byte 30 
.asciz "3dnowext: 		Extended 3DNow!"
_edx_hi_3dnow: .byte 31 
.asciz "3dnow: 			3DNow!"

.globl _edx_hi_flag
_edx_hi_flag: 
			.word _edx_hi_fpu
			.word _edx_hi_vme
			.word _edx_hi_de
			.word _edx_hi_pse
			.word _edx_hi_tsc
			.word _edx_hi_msr
			.word _edx_hi_pae
			.word _edx_hi_mce
			.word _edx_hi_cx8
			.word _edx_hi_apic
			.word _edx_hi_syscall
			.word _edx_hi_mtrr
			.word _edx_hi_pge
			.word _edx_hi_mca
			.word _edx_hi_cmov
			.word _edx_hi_pat
			.word _edx_hi_pse36

			.word _edx_hi_mp
			.word _edx_hi_nx

			.word _edx_hi_mmxext
			.word _edx_hi_mmx
			.word _edx_hi_fxsr
			.word _edx_hi_fxsr_opt
			.word _edx_hi_pdpe1gb
			.word _edx_hi_rdtscp

			.word _edx_hi_lm
			.word _edx_hi_3dnowext
			.word _edx_hi_3dnow
			.word 0
			
//****************************************************************** EAX=0x80000001, ECX hi********************************************			
			
_ecx_hi_lahf_lm: .byte 0 
.asciz "lahf_lm: 		LAHF/SAHF in long mode"
_ecx_hi_cmp_legacy: .byte 1 
.asciz "cmp_legacy: 		Hyperthreading not valid"
_ecx_hi_svm: .byte 2 
.asciz "svm: 			Secure Virtual Machine"
_ecx_hi_extapic: .byte 3 
.asciz "extapic: 		Extended APIC space"
_ecx_hi_cr8_legacy: .byte 4 
.asciz "cr8_legacy: 		CR8 in 32-bit mode"
_ecx_hi_abm: .byte 5 
.asciz "abm: 			Advanced bit manipulation (lzcnt and popcnt)"
_ecx_hi_sse4a: .byte 6 
.asciz "sse4a: 			SSE4a"
_ecx_hi_misalignsse: .byte 7 
.asciz "misalignsse: 		Misaligned SSE mode"
_ecx_hi_3dnowprefetch: .byte 8 
.asciz "3dnowprefetch: 		PREFETCH and PREFETCHW instructions"
_ecx_hi_osvw: .byte 9 
.asciz "osvw: 			OS Visible Workaround"
_ecx_hi_ibs: .byte 10 
.asciz "ibs: 			Instruction Based Sampling"
_ecx_hi_xop: .byte 11 
.asciz "xop: 			XOP instruction set"
_ecx_hi_skinit: .byte 12 
.asciz "skinit: 		SKINIT/STGI instructions"
_ecx_hi_wdt: .byte 13 
.asciz "wdt: 			Watchdog timer"

_ecx_hi_lwp: .byte 15 
.asciz "lwp: 			Light Weight Profiling"
_ecx_hi_fma4: .byte 16 
.asciz "fma4: 			4 operands fused multiply-add"
_ecx_hi_tce: .byte 17 
.asciz "tce: 			Translation Cache Extension"

_ecx_hi_nodeid_msr: .byte 19 
.asciz "nodeid_msr: 		NodeID MSR"

_ecx_hi_tbm: .byte 21 
.asciz "tbm: 			Trailing Bit Manipulation"
_ecx_hi_topoext: .byte 22 
.asciz "topoext: 		Topology Extensions"
_ecx_hi_perfctr_core: .byte 23 
.asciz "perfctr_core: 		Core performance counter extensions"
_ecx_hi_perfctr_nb: .byte 24 
.asciz "perfctr_nb: 		NB performance counter extensions"

_ecx_hi_dbx: .byte 26 
.asciz "dbx: 			Data breakpoint extensions"
_ecx_hi_perftsc: .byte 27 
.asciz "perftsc: 		Performance TSC"
_ecx_hi_pcx_l2i: .byte 28 
.asciz "pcx_l2i: 		L2I perf counter extensions"


.globl _ecx_hi_flag
_ecx_hi_flag: 
			.word _ecx_hi_lahf_lm
			.word _ecx_hi_cmp_legacy
			.word _ecx_hi_svm
			.word _ecx_hi_extapic
			.word _ecx_hi_cr8_legacy
			.word _ecx_hi_abm
			.word _ecx_hi_sse4a
			.word _ecx_hi_misalignsse
			.word _ecx_hi_3dnowprefetch
			.word _ecx_hi_osvw
			.word _ecx_hi_ibs
			.word _ecx_hi_xop
			.word _ecx_hi_skinit
			.word _ecx_hi_wdt

			.word _ecx_hi_lwp
			.word _ecx_hi_fma4
			.word _ecx_hi_tce

			.word _ecx_hi_nodeid_msr

			.word _ecx_hi_tbm
			.word _ecx_hi_topoext
			.word _ecx_hi_perfctr_core
			.word _ecx_hi_perfctr_nb

			.word _ecx_hi_dbx
			.word _ecx_hi_perftsc
			.word _ecx_hi_pcx_l2i
			.word 0


