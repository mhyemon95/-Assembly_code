include 'emu8086.inc'
org 100h
print "Input your mark here :"
call scan_num ; 
printn ''
printn 'Your Grade is:'

cmp cx,80
jge gradeA+

cmp cx,75
jge gradeA

cmp cx,70
jge gradeA-

cmp cx,65
jge gradeB+

cmp cx,60
jge gradeB

cmp cx,55
jge gradeB- 

cmp cx,50
jge gradeC+ 

cmp cx,45
jge gradeC 

cmp cx,40
jge gradeD 

cmp cx,40
jl gradeF

gradeA+: 
    printn 'A+' 
    jmp stop

gradeA: 
    printn 'A'
    jmp stop

grdA-: 
    printn 'A-' 
 
jmp stop

gradeB+: 
    printn 'B+'
    jmp stop

gradeB: 
    printn 'B '
    jmp stop

grdB-: 
    printn 'B-'  
    jmp stop

gradeC+: 
    printn 'C+ '

    jmp stop

gradeC: 
    printn 'C '

    jmp stop 

gradeD: 
    printn 'D '
    jmp stop 

gradeF: 
    printn 'F '

jmp stop 

stop:
    ret 
define_scan_num
define_print_num
define_print_num_uns
end
