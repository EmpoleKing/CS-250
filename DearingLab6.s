.section .data
data_area:
    newline: .byte 10  # Newline character
    space: .byte ' '  # Space character

.section .text
.global round_number

round_number:
    pushq %rbp
    movq %rsp, %rbp

    movq %rdi, %rax
    movq %rsi, %rcx

    movq $10, %rdx
    shlq %cl, %rdx

    addq %rdx, %rax
    andq $-1, %rax

    popq %rbp
    ret

.global main
main:
    movq $15, %rdi
    movq $3, %rsi
    callq test_round

    movq $34, %rdi
    movq $1, %rsi
    callq test_round

    movq $50, %rdi
    movq $4, %rsi
    callq test_round

    movq $0, %rax
    ret

test_round:
    callq round_number
    # Print the original and rounded numbers
    movq %rdi, %rdi  # Original number
    movq %rax, %rsi  # Rounded number
    callq print_value
    ret

print_value:
    pushq %rbp
    movq %rsp, %rbp

    subq $40, %rsp  # Allocate space for string conversion

    movq %rdi, %rax
    leaq data_area(%rip), %r8
    callq convert_string

    movq %rsi, %rax
    leaq data_area(%rip), %r9
    callq convert_string

    movq %r8, %rdi
    callq print_string

    movq $space, %rdi
    callq print_string

    movq %r9, %rdi
    callq print_string

    movq $newline, %rdi
    callq print_string

    addq $40, %rsp  # Restore stack pointer

    popq %rbp  # Restore base pointer
    ret

print_string:
    movq $1, %rax  # Syscall number for write
    movq $1, %rdi  # File descriptor (stdout)
    movq %rdi, %rsi  # Pointer to string
    movq $100, %rdx  # Maximum number of bytes to write
    syscall
    ret

convert_string:
    movq %r8, %rbx
    movq $10, %rcx
    addq $20, %rbx
    movb $0, (%rbx)

    convert_loop:
        decq %rbx
        xorq %rdx, %rdx
        divq %rcx
        addb $'0', %dl
        movb %dl, (%rbx)
        testq %rax, %rax
        jnz convert_loop

    movq %rbx, %rax
    ret
