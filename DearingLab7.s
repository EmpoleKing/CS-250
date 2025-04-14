.section .text
    .global string_length

string_length:
    xor     %eax, %eax          # Clear EAX to use as counter
.loop:
    cmpb    $0, (%rdi, %rax)    # Compare byte at [rdi + rax] with null terminator
    jz      .done               # If null terminator found, jump to .done
    inc     %eax                # Otherwise, increment EAX (move to next character)
    jmp     .loop               # Jump back to .loop to continue the loop
.done:
    ret                         # Return the length stored in EAX
