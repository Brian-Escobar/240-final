;Author Information:
;Author: Luis Alvarado
;Email: luisalvarado@csu.fullerton.edu
;Section: CPSC 240-07
;Program Name: Final
;
;==============================================================================
extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern atof

global electric

segment .data

time db "The time on the clock is now 384819342 tics.", 10,0

turn db "We turn your night into day.", 10, 0

emf db "Please enter the emf value (volts): ",0

emf_input db "%lf",0

resistance db "Please enter the resistance (ohms): ",0

resistance_input db "%lf",0

computed db "The computed current is %.4lf amps.",10,0

electric_power db "The Electric power will send the current to the caller.",10,0

endtime db "The end time on the clock is now 384819342 tics.", 10,0

segment .bss


segment .text
electric:

push    rbp

mov     rbp,rsp
push    rbx
push    rcx
push    rdx
push    rsi
push    rdi
push    r8
push    r9
push    r10
push    r11
push    r12
push    r13
push    r14
push    r15
pushf

;================================Time db========================================
push qword 0
mov rax, 0
mov rdi, time
call printf
pop rax

;================================Turn db========================================

push qword 0
mov rax, 0
mov rdi, turn
call printf
pop rax

;================================Emf db=========================================

push qword 0
mov rax, 0
mov rdi, emf
call printf
pop rax

;=================================emf_input====================================
push qword 0
push qword 0
mov rax, 0
mov rdi, emf_input
mov rsi, rsp
call scanf
movsd xmm15, [rsp]
pop rax
pop rax
;=================================resistance====================================

push qword 0
mov rax, 0
mov rdi, resistance
call printf
pop rax

;================================resistance_input==============================
push qword 0
push qword 0
mov rax, 0
mov rdi, resistance_input
mov rsi, rsp
call scanf
movsd xmm14, [rsp]
pop rax
pop rax

;================================MATH===========================================
divsd xmm15,xmm14         ; EMF / resistance
movsd xmm13, xmm15        ; store value from xmm15 into xmm13

;===============================computed========================================
push qword 0
push qword 0
mov rax, 1
mov rdi, computed
movsd xmm0, xmm13
call printf
pop rax
pop rax

;==============================electric power db================================
push qword 0
mov rax, 0
mov rdi, electric_power
call printf
pop rax

;==============================endtime=========================================
push qword 0
mov rax, 0
mov rdi, endtime
call printf
pop rax

movsd xmm0, xmm13
;===================Restore the original values to the GPRs=====================
popf                                                        ;Restore rflags
pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                                               ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
pop        rbp                                              ;Restore rbp
ret
