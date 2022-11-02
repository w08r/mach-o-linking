all: run

libfoo.a:
	clang -o foo.o -c foo.s
	ar r libfoo.a foo.o

run: run.c libfoo.a
	clang -c run.c
	clang -o run run.o libfoo.a

dis: run
	otool -xv run

clean:
	rm -f run *.o libfoo.a

@PHONY: clean dis
