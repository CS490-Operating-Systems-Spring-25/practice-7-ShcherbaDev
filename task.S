.section .data   // section with initialized variables 
  cwd_buffer:
    .fill 256, 1, 0 // Task 1: allocate 256 bytes buffer
  file_buffer:
    .fill 256, 1, 0
  filename:
    .asciz "text.txt"

.section .text
  .global _start

  _start:
    // Tasks 2-3
    ldr x0, =cwd_buffer // Output to buffer
    mov x1, #256        // Number of bytes to write
    mov x8, #17         // getcwd syscall
    svc #0

    mov x0, #1          // stdout
    ldr x1, =cwd_buffer // Read from buffer
    mov x2, #256        // Size of buffer is 256
    mov x8, #64         // write syscall
    svc #0

    // Task 5
    // Open file
    mov x0, #-100     // -100 - current dir because otherwise it requires an absolute path
    ldr x1, =filename // Address of a file name
    mov x2, #2        // O_RDONLY flag (readonly)
    mov x3, #0        // mode = 0
    mov x8, #56       // openat syscall
    svc #0
    mov x28, x0       // Move result to free address

    // Read a file
    mov x0, x28           // File descriptor
    ldr x1, =file_buffer  // Write to buffer
    mov x2, #256          // Size of buffer is 256
    mov x8, #63           // read syscall
    svc #0

    // Print file content
    mov x0, #1            // stdout
    ldr x1, =file_buffer  // Read from buffer
    mov x2, #256          // Size of buffer is 256
    mov x8, #64           // write syscall
    svc #0

    // Add filename to file
    mov x0, x28       // File descriptor
    ldr x1, =filename // Write filename
    mov x2, #8        // Filename is just 8 bytes long
    mov x8, #64       // write syscall
    svc #0

    // Add execution permissions
    mov x0, x28     // File descriptor
    mov x1, #493    // 0755 (rwxr-xr-x)
    mov x8, #52     // fchmod syscall
    svc #0

    // Close file
    mov x0, x28     // file descriptor
    mov x8, #57     // close syscall
    svc #0

    // Task 4
    mov x0, #1    // return status 1
    mov x8, #93   // exit system call is 93
    svc #0        // perform a system call
