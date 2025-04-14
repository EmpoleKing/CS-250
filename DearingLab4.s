.section .data

data_items:             # These are the data items
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
    movl $0, %edi                   # Move 0 into the index register
    movl data_items(,%edi,4), %eax          # Load the first byte of data
    movl %eax, %ebx                 # Since this is the first item, %eax is the biggest

    start_loop:                 # Starts a loop
        cmpl $0, %eax               # Checks if we are at the end
        je loop_exit
        incl %edi               # Load next value
        movl data_items(,%edi,4), %eax
        cmpl %ebx, %eax             # Compare values
        jle start_loop              # Go back to start of loop if new value isn't bigger
        movl %eax, %ebx             # Move the value as the largest
        jmp start_loop              # jump to loop beginning

    loop_exit:

        movl $1, %eax
        int $0x80
