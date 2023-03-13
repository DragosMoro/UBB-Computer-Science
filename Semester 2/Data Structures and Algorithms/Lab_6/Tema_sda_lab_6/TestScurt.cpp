#include "TestScurt.h"
#include <assert.h>
#include "Multime.h"
#include "IteratorMultime.h"

void testAll() { //apelam fiecare functie sa vedem daca exista
	Multime m;
	assert(m.vida() == true);
	assert(m.dim() == 0); //adaug niste elemente
	assert(m.adauga(5)==true);
	assert(m.adauga(1)==true);
	assert(m.adauga(10)==true);
	assert(m.adauga(7)==true);
	assert(m.adauga(1)==false);
	assert(m.adauga(10)==false);
	assert(m.adauga(-3)==true);
	assert(m.dim() == 5);
	assert(m.cauta(10) == true);
	assert(m.cauta(16) == false);
	assert(m.sterge(1) == true);
	assert(m.sterge(6) == false);
	assert(m.dim() == 4);


	IteratorMultime im = m.iterator();
	im.prim();
	int s = 0;
	while (im.valid()) {
		TElem e = im.element();
		s += e;
		im.urmator();
	}
	assert(s == 19);
	Multime c;
	assert(c.vida() == true);
	assert(c.dim() == 0); //adaug niste elemente
	assert(c.adauga(5) == true);
	assert(c.adauga(1) == true);
	assert(c.adauga(10) == true);
	assert(c.adauga(7) == true);
	
	Multime b;
	assert(b.vida() == true);
	assert(b.dim() == 0); //adaug niste elemente
	assert(b.adauga(5) == true);
	assert(b.adauga(10) == true);
	assert(b.adauga(22) == true);
	assert(b.adauga(23) == true);
	c.intersectie(b);
	assert(c.dim() == 2);
}
