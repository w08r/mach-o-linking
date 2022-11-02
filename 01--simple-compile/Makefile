all: run

run: run.c foo.s
	clang -c -g -O0 foo.s run.c
	clang -O0 -g -o run run.o foo.o

dis: run
	otool -xv run

odfoo:
	od -vAx -tx4 foo.o

otfoo:
	otool -xvVj foo.o

clean:
	rm -f run *.o

@PHONY: clean dis
