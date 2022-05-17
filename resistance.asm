;Author Information:
;Author: Brian Escobar
;Email: brianescobar523@csu.fullerton.edu
;Section: CPSC 240-09
;Program Information:
;Program Name: Final
;
;==============================================================================
extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern atof

global resistance

segment .data

time db "The start time on the clock is now %lu tics.", 10,0

text db "We will manage all your circuits.", 10, 0

entr db "Please enter the resistance pf the first subcircuit: ",0

first_resistance_input db "%lf",0

resistance_text db "Please enter the resistance pf the secpmd subcircuit: ",0

second_resistance_input db "%lf",0

computed db "The computed total resistance is %.4lf ohms.",10,0

total_resistance db "The Electric Resistance will send the Total Resistanceto the caller.",10,0

end_time db "The end time on the clock is now %lu tics.", 10,0

total_time db "The total time for this computation was %lu tics", 10,0

one dq 1.0

segment .bss


segment .text
resistance:

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





;================================print out starting tics========================================
push qword 0
cpuid
rdtsc

shl rdx, 32
add rax, rdx
mov r15, rax

mov rax, 0
mov rdi, time
mov rsi, r15
call printf
pop rax



;================================time ========================================
;push qword 0
;mov rax, 0
;mov rdi, time
;call printf
;pop rax




;================================text ========================================

push qword 0
mov rax, 0
mov rdi, text
call printf
pop rax

;================================entr =========================================

push qword 0
mov rax, 0
mov rdi, entr
call printf
pop rax

;=================================first_resistance_input====================================
push qword 0
push qword 0
mov rax, 0
mov rdi, first_resistance_input
mov rsi, rsp
call scanf
movsd xmm15, [rsp]
pop rax
pop rax
;=================================resistance_text====================================

push qword 0
mov rax, 0
mov rdi, resistance_text
call printf
pop rax

;================================second_resistance_input==============================
push qword 0
push qword 0
mov rax, 0
mov rdi, second_resistance_input
mov rsi, rsp
call scanf
movsd xmm14, [rsp]
pop rax
pop rax

;================================ calculations===========================================
;place 1.0 into xmm registers
movsd xmm12, [one]
movsd xmm11, [one]

;divide both resistances by 1
divsd xmm12, xmm15
divsd xmm11, xmm14

; add the two values
addsd xmm12, xmm11
movsd xmm13, xmm12

;===============================computed========================================
push qword 0
push qword 0
mov rax, 1
mov rdi, computed
movsd xmm0, xmm13
call printf
pop rax
pop rax



;===============================displaying end_time ========================================
push qword 0
cpuid
rdtsc

shl rdx, 32
add rax, rdx
mov r14, rax
pop rax


push qword 0
mov rax, 0
mov rdi, end_time
mov rsi, r14
call printf
pop rax

;===============================displaying total_time ========================================
push qword 0
mov rax, 0
mov rdi, total_time
sub r14, r15
mov rsi, r14
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
