## Example Usage to fuzz test-instr:
1. Install american fuzzy lop (afl): http://lcamtuf.coredump.cx/afl/
- Download afl.
- Read QuickStartGuide in the doc folder for installation instructions.

2. Compile the test-instr program to be fuzzed using afl-gcc.
```console
foo@bar:~/path_to_this_project$ CC=afl-gcc make clean all
```
Note: make sure the Makefile is correctly set up for the target program.

3. Test it:
```console
foo@bar:~/path_to_this_project$ ./test-instr
0
Looks like a zero to me!
```

4. Put a small but valid input file for the test-instr program under "inputs/test-instr_inputs" folder

5. Since all example programs provided reads input from stdin, we can run afl like this:
```console
foo@bar:~/path_to_this_project$ afl-fuzz -i inputs/test-instr_inputs -o out ./test-instr
```
For programs that read files as input, refer to afg QuickStartGuide for details.

## Target programs provided:
1. test-instr.c
2. get_sign.c
3. regexp.c