;Ayodele Hamilton
;CMPSC 280
;Final Project
;Purpose:
;       result = _____n!_______
;                 (n-k)! * k!
global factorial
global binom
extern printf

    section .data
fmt: db "Factorial of k: %d",10,0
fmt2:db "Factorial of n: %d",10,0
fmt3:db "Factorial of (n-k): %d",10,0
    section .text
binom:
            push ebp
            mov  ebp,esp

;get input1, call factorial, save into edi (k)
            push dword [ebp+8]
            call factorial      ;call the loop for the factorial
            add  esp,4          ;pop 4 bytes from the stack
            mov  edi,eax        ;edi = factorial of input1
;get input2, call factorial, save into esi (n)
            push dword [ebp+12]
            call factorial      ;call the loop for factorial
            add  esp,4          ;pop 4 bytes from the stack
            mov  esi,eax        ;esi = factorial of input2
;Subtract input2 from input1
            mov  ebx,[ebp+12]   ;ebx = edi
            mov  ecx,[ebp+8]    ;ecx = esi
            sub  ebx,ecx        ;ebx = ebx - ecx
            push  ebx
            call factorial      ;factorial for (n-k)!
            add  esp,4          ;pop 4 bytes from the stack 
            mov  ebx,eax        ;ebx = eax
;For testing purposes:
            push edi
            push dword fmt
            call printf
            add esp,4
            push esi
            push dword fmt2
            call printf
            add  esp,4
            push ebx
            push dword fmt3
            call printf
            add esp,4
;Multiply (n-k)! * k!
            mov  edx,0
            mov  eax,edi        ;eax = esi(input2)
            mul  ebx            ;eax * ebx
            mov  edi,eax        ;result = eax

;           mov  edx,esi        ;edx = esi(input2)

;Divide the results
            mov  eax,esi        ;eax = esi(input1)
            div  edi            ;eax = eax / edi
;            mov  edi,edx

;Return value
            mov  esp,ebp
            pop  ebp
            ret

;;;;;;;;;;;;;;;;;;
;Functions:
;;;;;;;;;;;;;;;;;;
factorial:  push ebp
            mov  ebp,esp

;Preserving space on stack
            push edi
            push esi
            push ebx
            push edx
            push ecx
;            push eax

            mov  eax,1          ;eax = product
            mov  ecx,1          ;ecx = loop counter

;Getting Factorial
loop:       cmp ecx,[ebp+8]     ;argument for generalized formula
            jg  done            ;if counter > a, loop terminates
            mul ecx             ;multiply for the factorial
            add ecx,1           ;subtract 1 from input
            jmp loop            ;loop

done:
            pop ecx
            pop edx
            pop ebx
            pop esi
            pop edi

            mov esp,ebp         ;reversing the commands at the top
            pop ebp
            ret                 ;returning an integer



