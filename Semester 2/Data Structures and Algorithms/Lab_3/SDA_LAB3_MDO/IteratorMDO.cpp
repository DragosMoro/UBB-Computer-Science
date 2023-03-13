#include "IteratorMDO.h"
#include "MDO.h"

IteratorMDO::IteratorMDO(const MDO& d) : dict(d) {
	/* de adaugat */
	curent = dict.prim;
}

TCheie IteratorMDO::cheie() const {
	/* de adaugat */
	//returns key;
	if (valid())
		return curent->el();
	else
		throw("Exceptie");
}
PNod2 IteratorMDO::listval() const {
	if (valid()) {
		return curent->get_list_pointer();
	}
	else {
		throw("Exceptie");
	}
}

void IteratorMDO::prim() {
	/* de adaugat */
	curent = dict.prim;
}

void IteratorMDO::urmator() {
	/* de adaugat */
	curent = curent->urmator();
}

bool IteratorMDO::valid() const {
	/* de adaugat */
	if (curent != nullptr)
		return true;
	return false;
}

PNod IteratorMDO::get_prim() const {
	return dict.prim;
}

