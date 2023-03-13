#include "Multime.h"
#include "IteratorMultime.h"

#include <iostream>
#include <math.h>
#define NIL -1000000
#define STERS -1000001

int hashCode(TElem e)
{
	//complexitate teta(1)
	return abs(e);
}
int Multime::d(TElem e, int i)
{
	//complexitate teta(1)
	int d1, d2,d3, r, x, y;
	d1 = hashCode(e) % m;
	d2 = 1 + hashCode(e) % (m - 2);
	d3 = d1 + i * d2;
	return d3;
}

Multime::Multime() {
	//complexitate teta(m)
	lungime = 0;
	m = MAX;
	n = MAX;
	e = new TElem[m];
	for (int i = 0; i < m; i++)
		e[i] = NIL;
}

void Multime::redim()
{
	TElem* e_nou = new TElem[m*2];
	for (int i = 0; i < m; i++)
	{
		e_nou[i] = e[i];
	}
	for (int i = m; i < m*2; i++)
	{
		e_nou[i] = NIL;
	}
	delete[] e;
	m *= 2;
	e = e_nou;
	
}


bool Multime::adauga(TElem elem) {
	//complexitate O(m)
	int i = 0;
	bool found = false;
	for (int j = 0; j < m; j++)
		if (e[j] == elem)
			return false;
	while (i < m && !found)
	{
		int k = d(elem, i);
		if ( k< m && (e[k] == NIL || e[k] == STERS) )
		{
			e[k] = elem;
			found = true;
			lungime++;
		}
		else i++;
	}
	return found;
}


bool Multime::sterge(TElem elem) {
	//complexitate O(m)
	int i = 0;
	bool found = false;
	while (i < m && !found)
	{
		int k = d(elem, i);
		if (k < m && e[k] == elem)
		{
			e[k] = STERS;
			found = true;
			lungime--;
		}
		else i++;
		
	}
	return found;	
}


bool Multime::cauta(TElem elem) {
	//complexitate O(m)
	int i = 0;
	int k = 0;
	bool found = false;
	while (i < n && !found)
	{
		k = d(elem, i);
		if ( k < n && e[k] == elem)
		{
			found = true;
		}
		else i++;
	}
	return found;
}

void Multime::intersectie( Multime& b)
{	
	/*
	* //complexitate O(m)
	subalgoritm intersectie(m, b)
	di:m, b
	do:m' = m intersectat cu b
		{m:multime, b:multime}
		ok<-false
	pentru i=0,m.dim
	ok<-b.cauta(e[i])
	daca(ok=true)
	sterge(e[i]);
	sf daca
	sf pentru
	sf subalgoritm
	
	*/

	bool ok = false;
	for (int i = 0; i < dim(); i++)
	{ 
		ok = b.cauta(e[i]);
		if (ok == true)
		{
			sterge(e[i]);
		}		
		}
}
int Multime::dim() const {
	//complexitate teta(1)
	return lungime;
}

bool Multime::vida() const {
	//complexitate teta(1)
	if (lungime == 0)
		return true;
	else return false;
}


Multime::~Multime() {
	//complexitate teta(1)
	delete[] e;
}



IteratorMultime Multime::iterator() const {
	//complexitate teta(1)
	return IteratorMultime(*this);
}

