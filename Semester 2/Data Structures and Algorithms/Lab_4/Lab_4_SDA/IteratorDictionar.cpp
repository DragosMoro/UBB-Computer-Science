#include "IteratorDictionar.h"
#include "Dictionar.h"
#include <iostream>
#include <exception>
using namespace std;

IteratorDictionar::IteratorDictionar(const Dictionar& d) : dict(d){
	/* de adaugat */
	curent = dict.prim;
}


void IteratorDictionar::prim() {
	/* de adaugat */
	curent = dict.prim;
}


void IteratorDictionar::urmator() {
	/* de adaugat */
	if (valid())
		curent = dict.urm[curent];
	else throw exception();
}


TElem IteratorDictionar::element() const{
	/* de adaugat */
	if (valid())
		return dict.e[curent];
	else throw exception();
	
	return pair <TCheie, TValoare>  (-1, -1);
}


bool IteratorDictionar::valid() const {
	/* de adaugat */
	if (curent != nimic)
		return true;
	return false;
}

