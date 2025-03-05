.section .data   // section with initialized variables 
  buffer:
    .fill 256, 1, 0 // Task 1: allocate 256 bytes buffer

.section .text
  .global _start

  _start:
    // Tasks 2-3
    ldr x0, =buffer // Output to buffer
    mov x1, #256    // Number of bytes to write
    mov x8, #17     // getcwd syscall
    svc #0

    mov x0, #1      // stdout
    ldr x1, =buffer // Read from buffer
    mov x2, #256    // Size of buffer is 256
    mov x8, #64     // write syscall
    svc #0
    
    // mov x0, #1     // file descriptor for standard output is 1
    // ldr x1, =message  // load address of the variable with data to x1
    // mov x2, #7    // bytes count to write
    // mov x8, #64   // write system call number is 64
    // svc #0        // perform a system call

    mov x0, #0    // return status 0
    mov x8, #93   // exit system call is 93
    svc #0        // perform a system call
