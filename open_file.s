# Opening a file and printing it out
# C style
.section .data
filename:
    .asciz "open_file.s"
.section .text
.global main
main:
    mov $5, %rax
    mov $filename, %rbx
    mov $0, %rcx # O_RDONLY is 0
    int $0x80 # Open the file

    # Now we'll have a file descriptor in %rax
    push %rax

    # Let's get some memory
    mov $1024, %rdi
    call malloc
    # Our memory address is in rax

    mov (%rsp), %rbx
    push %rax # Our memory address
    mov %rax, %rcx
    mov $3, %rax
    mov $1024, %rdx
    int $0x80

    mov %rax, %rdx
    mov $4, %rax
    mov $1, %rbx
    mov (%rsp), %rcx # More direct than pop followed by push
    int $0x80

    pop %rdi
    call free

    mov $6, %rax
    pop %rbx
    int $0x80

    ret