## see `man dyld`

all: run

lib/libfoo.1.dylib:
	mkdir -p lib
	clang -o foo.o -c foo.s
	clang -shared -Wl,-compatibility_version -Wl,1.0.0 -Wl,-current_version -Wl,1.2.3 -o lib/libfoo.1.dylib foo.o
	rm -f lib/libfoo.dylib
	ln -s ${PWD}/lib/libfoo.1.dylib lib/libfoo.dylib

run: run.c lib/libfoo.1.dylib
	clang -c run.c
	clang -o run run.o -L${PWD}/lib -lfoo

otool: run
	otool -L run

rpath: 
	otool -l run | grep -A5 RPATH

clean:
	rm -fr run *.o *.dylib ./lib ./xlib

move:
	mv lib/libfoo.1.dylib .
	DYLD_LIBRARY_PATH=${PWD} ./run

change:
	install_name_tool -change lib/libfoo.1.dylib @rpath/libfoo.1.dylib run
	install_name_tool -add_rpath xlib run
	mkdir xlib
	mv libfoo.1.dylib xlib
	./run

@PHONY: clean dis
