.section .data
data_items:
  .long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0
.section .text

.globl _start

_start:
  movl $0, %edx
  movl data_items(,%edi,4), %eax
  movl %eax, %ebx
max:
  cmpl $13, %edx
  je fin
  incl %edx
  movl data_items(,%edx,4), %eax
  cmpl %ebx, %eax
  jle max
  movl %eax, %ebx
  jmp max
fin:
  movl $1, %eax
  int $0x80
