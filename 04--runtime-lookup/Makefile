all: run

libfoo.dylib:
	clang -o foo.o -c foo.s
	clang -shared -o libfoo.dylib foo.o

run: run.c
	clang -c run.c
	clang -o run run.o

clean:
	rm -f run *.o libfoo.dylib

@PHONY: clean dis
