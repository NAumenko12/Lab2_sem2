.text
.align 2
.global _main

_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #400            ; Место для 100 int'ов
    adrp x0, fmt
    add x0, x0, fmt@PAGEOFF
    mov x1, sp
    bl _scanf
    ldr w19, [sp]               ; N
    mov w20, #0                 ; i = 0
read_loop:
    cmp w20, w19
    b.ge count_init
    adrp x0, fmt
    add x0, x0, fmt@PAGEOFF
    add x1, sp, #4
    bl _scanf
    ldr w21, [sp, #4]
    add x22, sp, #8
    str w21, [x22, w20, lsl #2]
    add w20, w20, #1
    b read_loop

count_init:
    mov w20, #0                 ; counter = 0
    mov w21, #1                 ; i = 1

count_loop:
    cmp w21, w19
    b.ge print
    add x22, sp, #8
    ldr w23, [x22, w21, lsl #2]     ; arr[i]
    sub w24, w21, #1
    ldr w25, [x22, w24, lsl #2]     ; arr[i-1]
    cmp w23, w25
    b.ne next
    add w20, w20, #1

next:
    add w21, w21, #1
    b count_loop
    
print:
    adrp x0, fmt
    add x0, x0, fmt@PAGEOFF
    mov w1, w20
    bl _printf

exit:
    mov w0, #0
    add sp, sp, #400
    ldp x29, x30, [sp], #16
    ret

.section __TEXT,__cstring,cstring_literals
fmt:
    .asciz "%d"