# KaguOS task 3.1 - C++ Hardware Emulation

1. Building a `bootloader.cpp`: `clang++ bootloader.cpp -o bootloader`

2. Building a KaguOS: `./asm.sh src/01_stack.kga src/02_fs.kga src/kernel_base.kga` (compilation succeeded)

3. Running `./bootloader build/kernel.disk 1500` works fine.

4. Output of running tests with `CPP_BOOTLOADER=1 tests/test_cpu_emulation.sh`:

```bash
Testing tests/cpu/test_add.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_concat_with.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_contains.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_decr.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_div.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_get_column.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_get_length.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_incr.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_is_num.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_mod.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_mul.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_read_write_block.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_replace_column.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_starts_with.kga
PASSED
---------------------------------------------
Testing tests/cpu/test_sub.kga
PASSED
---------------------------------------------
```
