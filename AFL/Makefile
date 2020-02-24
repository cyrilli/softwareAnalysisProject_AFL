# Enable debugging and suppress pesky warnings
CFLAGS ?= -g -w

all:	test-instr

clean:
	rm -f test-instr

vulnerable: test-instr.c
	${CC} ${CFLAGS} test-instr.c -o test-instr
