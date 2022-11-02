all: run

libfoo.dylib:
	clang -o foo.o -c foo.s
	clang -shared -o libfoo.dylib foo.o

run: run.c libfoo.dylib
	clang -c run.c
	clang -o run run.o -L. -lfoo

dis-run: run
	otool -Ixv run

dis-lib: libfoo.dylib
	otool -xv libfoo.dylib

clean:
	rm -f run *.o libfoo.dylib

@PHONY: clean dis
