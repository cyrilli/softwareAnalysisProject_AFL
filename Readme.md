## Example Usage to fuzz test-instr:
1. Download and install american fuzzy lop (afl): http://lcamtuf.coredump.cx/afl/

You can find installation and usage instructions under "./docs" folder of AFL, or instructions [here](https://github.com/mykter/afl-training/tree/master/quickstart) might also be helpful.

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
For programs that read files as input, refer to afg QuickStartGuide for details. To undestand the status screen of AFL, refer to http://lcamtuf.coredump.cx/afl/status_screen.txt.

## Target programs provided:
1. test-instr.c
2. get_sign.c
3. regexp.c
