section .data
    numbers db 30, 40, 50, 55, 60, 35, 45, 70
    array_size equ $ - numbers
    threshold db 50

section .text
    global _start

_start:
    mov eax, 0
    mov ebx, 0

count_loop:
  cmp ebx, array_size
  jge end_loop_count

  mov al, [numbers + ebx]
  cmp al, threshold
  jle skip_increment

  inc eax

skip_increment:
  inc ebx
  jmp count_loop

end_loop_count:
  mov ebx, eax
  mov eax, 1
  int 0x80