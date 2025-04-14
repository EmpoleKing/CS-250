.section .text
.global main
main:
    movq %rsp, %rbp

    # Open the file
    leaq filename(%rip), %rdi
    movq $0, %rsi
    callq open
    movq %rax, %rbx  # Save file descriptor

    movq $1024, %rdi
    callq malloc
    movq %rax, %rsi
    movq $1024, %rdx

    movq %rbx, %rdi  # Pass file descriptor to read
    movq %rsi, %rsi  # Pass buffer to read
    callq read

    movq %rsi, %rdi  # Pass buffer to to_upper

to_upper:
    movb (%rdi), %al
    test %al, %al
    jz end_convert

    cmpb $'a', %al
    jl dont_convert
    cmpb $'z', %al
    jg dont_convert

    # Convert lowercase to uppercase
    subb $32, %al  # 'a' - 'A'

    # Print the modified character
    movq $1, %rdi
    movq %rdi, %rsi
    addq %rsi, %rsi
    addq %rsi, %rsi
    movq $1, %rdx
    callq write

dont_convert:
    incq %rdi
    jmp to_upper

end_convert:
    movq %rsp, %rdi
    callq free

    movq %rbx, %rdi  # Pass file descriptor to close
    callq close

    movq $0, %rdi
    ret

.section .text
filename:
    .string "open_file.s"
