#include "IteratorMultime.h"
#include "Multime.h"
#include <iostream>
#include <exception>
#define NIL -1000000
#define STERS -1000001
using namespace std;
void IteratorMultime::deplasare()
{
	//complexitate O(m)
	while ((curent < multime.m) && (multime.e[curent] == NIL || multime.e[curent] == STERS))
		curent++;
}
IteratorMultime::IteratorMultime(const Multime& m) : multime(m){
	//complexitate teta(1)
	curent = 0;
	deplasare();
}


void IteratorMultime::prim() {
	//complexitate teta(1)
	curent = 0;
	deplasare();

}


void IteratorMultime::urmator() {
	//complexitate teta(1)
	if (valid())
	{
		curent++;
		deplasare();
	}
	else throw exception();

	
}


TElem IteratorMultime::element() const {
	//complexitate teta(1)
	if (valid())
		return multime.e[curent];
	else throw exception();
}

bool IteratorMultime::valid() const {
	//complexitate teta(1)
	if (curent < multime.m)
		return true;
	return false;
}
