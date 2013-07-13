.PHONY: install uninstall clean

dist/build/lib-mpris/mpris.cmxa:
	obuild configure
	obuild build

install:
	ocamlfind install mpris lib/META \
		$(wildcard dist/build/lib-mpris/*) \
		$(wildcard dist/build/lib-mpris_clients/*) \

uninstall:
	ocamlfind remove mpris

clean:
	rm -rf dist
