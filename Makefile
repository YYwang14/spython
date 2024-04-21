.PHONY: all clean byte 

OCB_FLAGS = -tag bin_annot -use-ocamlfind -I src -use-menhir -menhir "menhir --unused-tokens --unused-precedence-levels" -pkg menhirLib
OCB = ocamlbuild $(OCB_FLAGS)

all: clean native

clean: 
	$(OCB) -clean
	rm -f a.out main *.ll *.s *out *.log *.diff spython

test: native
	./testall.sh

native:
	$(OCB) spython.native
	mv spython.native spython
