;1.Write a program to input a marks and find out the corresponding grade, according to the rules 

.model small
.stack 100h

.data
msg db 'Enter your marks: $'
grade db 'Your grade is: $'
A_plus db 'A+'
A db 'A'
A_minus db 'A-'
B_plus db 'B+'
B db 'B'
B_minus db 'B-'
C_plus db 'C+'
C db 'C'
D db 'D'
F db 'F'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; display message to enter marks
    mov ah, 09h
    lea dx, msg
    int 21h
    
    ; read input from user
    mov ah, 01h
    int 21h
    
    ; convert ASCII input to decimal value
    sub al, 30h
    
    ; determine grade based on marks
    cmp al, 80
    jge A_plus_grade
    
    cmp al, 75
    jge A_grade
    
    cmp al, 70
    jge A_minus_grade
    
    cmp al, 65
    jge B_plus_grade
    
    cmp al, 60
    jge B_grade
    
    cmp al, 55
    jge B_minus_grade
    
    cmp al, 50
    jge C_plus_grade
    
    cmp al, 45
    jge C_grade
    
    cmp al, 40
    jge D_grade
    
    ; if marks are less than 40, grade is F
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, F
    int 21h
    
    jmp end_prog
    
A_plus_grade:
    ; display grade A+
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, A_plus
    int 21h
    
    jmp end_prog
    
A_grade:
    ; display grade A
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, A
    int 21h
    
    jmp end_prog
    
A_minus_grade:
    ; display grade A-
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, A_minus
    int 21h
    
    jmp end_prog
    
B_plus_grade:
    ; display grade B+
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, B_plus
    int 21h
    
    jmp end_prog
    
B_grade:
    ; display grade B
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, B
    int 21h
    
    jmp end_prog
    
B_minus_grade:
    ; display grade B-
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, B_minus
    int 21h
    
    jmp end_prog
    
C_plus_grade:
    ; display grade C+
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, C_plus
    int 21h
    
    jmp end_prog
    
C_grade:
    ; display grade C
    mov ah, 09h
    lea dx, grade
    int 21h
    lea dx, C
    int 21h
    
    jmp end_prog
    
D_grade: ; display grade D 
mov ah, 09h
lea dx, grade 
int 21h lea dx, D 
int 21h
jmp end_prog 
end_prog: 
; terminate program 
mov ah, 4ch 
int 21h
main endp 
end main







2.Problem (Maximum or minimum value)qInput four integer values x,y,C from user where 0 <= x,y <= 9, and C = 0 or 1.
If C=0 print the minimum of x,y and if C = 1 print the maximum of x,y in the console.
Ans:
.model small
.stack 100h

.data
x db ?
y db ?
c db ?
result db ?

prompt_x db 'Enter the value of x: $'
prompt_y db 'Enter the value of y: $'
prompt_c db 'Enter the value of c: $'
min_msg db 'The minimum value is: $'
max_msg db 'The maximum value is: $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Prompt for x
    mov ah, 09h
    lea dx, prompt_x
    int 21h
    
    ; Read x
    mov ah, 01h
    int 21h
    sub al, 30h
    mov x, al
    
    ; Prompt for y
    mov ah, 09h
    lea dx, prompt_y
    int 21h
    
    ; Read y
    mov ah, 01h
    int 21h
    sub al, 30h
    mov y, al
    
    ; Prompt for c
    mov ah, 09h
    lea dx, prompt_c
    int 21h
    
    ; Read c
    mov ah, 01h
    int 21h
    sub al, 30h
    mov c, al
    
    ; Find min or max
    cmp c, 0
    je find_min
    jmp find_max
    
find_min:
    cmp x, y
    jge x_min
    mov result, x
    jmp print_result
    
x_min:
    mov result, y
    jmp print_result
    
find_max:
    cmp x, y
    jle x_max
    mov result, x
    jmp print_result
    
x_max:
    mov result, y
    
print_result:
    cmp c, 0
    je print_min
    jmp print_max
    
print_min:
    mov ah, 09h
    lea dx, min_msg
    int 21h
    
    mov dl, result
    add dl, 30h
    mov ah, 02h
    int 21h
    
    jmp end_prog
    
print_max:
    mov ah, 09h
    lea dx, max_msg
    int 21h
    
    mov dl, result
    add dl, 30h
    mov ah, 02h
    int 21h
    
    jmp end_prog
    
end_prog:
    mov ah, 4ch
    int 21h
main endp
end main