all: run

libfoo.1.dylib:
	clang -o foo.o -c foo.s
	clang -shared -Wl,-compatibility_version -Wl,1.0.0 -Wl,-current_version -Wl,1.2.3 -o libfoo.1.dylib foo.o
	ln -s libfoo.1.dylib libfoo.dylib

run: run.c libfoo.1.dylib
	clang -c run.c
	clang -o run run.o -L. -lfoo

otool: run
	otool -L run

clean:
	rm -f run *.o *.dylib

@PHONY: clean dis
