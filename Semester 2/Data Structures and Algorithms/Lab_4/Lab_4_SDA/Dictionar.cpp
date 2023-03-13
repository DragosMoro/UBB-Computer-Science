#include "Dictionar.h"
#include <iostream>
#include "IteratorDictionar.h"
#include <exception>
using namespace std;
Dictionar::Dictionar() {
	/* de adaugat */
	prim = nimic;
	ultim = nimic;
	cp = 1000;
	lungime = 0;
	primLiber = 0;

	e = new TElem[cp];
	urm = new int[cp];
	prec = new int[cp];

	//se initializeaza lista spatiului liber - toate pozitiile din vecto sunt marcate ca fiind libere
	for (int i = 0; i < cp-1; i++)
	{
		urm[i] = i + 1;
		prec[i] = i - 1;

	}
	urm[cp - 1] = nimic;
	//referinta spre prima pozitie libera din lista
	prec[0] = nimic;
}
int Dictionar::aloca() {
	//se sterge primul element din lista spatiului liber
	int i = primLiber;
	primLiber = urm[primLiber];
	return i;
}

void Dictionar::dealoca(int i, int precedent) {
	//se trece pozitia i in lista spatiului liber
	if (prim == ultim)
	{
		prim = ultim = -1;
	}
	else if (precedent == -1)
	{
		prim = urm[i];
	}
	else if (urm[i] == -1)
	{
		ultim = prec[i];
	}
	else {
		prec[urm[i]] = precedent;
		urm[precedent] = urm[i];
	}
	urm[i] = primLiber;
	primLiber = i;
}

void Dictionar::redim()
{
	cp *= 2;
	TElem* elem_nou = new TElem[cp];
	int* urm_nou = new int[cp];
	int* prec_nou = new int[cp];
	for (int i = 0; i < lungime; i++)
	{
		elem_nou[i] = e[i];
		urm_nou[i] = urm[i];
		prec_nou[i] = prec[i];
	}
	for (int i = lungime; i < cp-1; i++)
	{
		urm_nou[i] = i+1;
	}
	urm_nou[cp-1] = nimic;
	primLiber = lungime;
	delete[] prec;
	delete[] e;
	delete[] urm;
	e = elem_nou;
	urm = urm_nou;
	prec = prec_nou;

}

Dictionar::~Dictionar() {
	/* de adaugat */
	delete[] e;
	delete[] urm;
	delete[] prec;
}

TValoare Dictionar::adauga(TCheie c, TValoare v){	
	int p = prim;
	TElem elem;
	elem.first = c;
	elem.second = v;

	if (primLiber == nimic)
	{
		redim();
	}

	while ( p != nimic)
	{
		if (c == e[p].first)
		{
			TValoare val_veche = e[p].second;
			e[p].second = v;
			return val_veche;
		}
		p = urm[p];
	}
	
	int nod = aloca();
	
	if (lungime == 0)
	{
		e[nod] = elem;
		urm[prim] = nod;
		prim = nod;
		ultim = nod;
	}
	else
	{
		e[nod] = elem;
		urm[ultim] = nod;
		ultim = nod;
	}
	lungime++;
	return NULL_TVALOARE;
}



//cauta o cheie si returneaza valoarea asociata (daca dictionarul contine cheia) sau null
TValoare Dictionar::cauta(TCheie c) const{
	/* de adaugat */
	TValoare v;
	int p = prim;
	while (c != e[p].first && p != nimic)
	{
		p = urm[p];
	}
	if (p == nimic)
		return NULL_TVALOARE;
	else {
		v = e[p].second;
		return v;
	}
}


TValoare Dictionar::sterge(TCheie c){
	/* de adaugat */
	int p = prim;
	int precedent = -1;
	while (p != nimic)
	{
		if (c == e[p].first)
		{
			TValoare val_veche = e[p].second;
			dealoca(p, precedent);
			lungime--;
			return val_veche;
		}
		precedent = p;
		p = urm[p];
		
	}
	return NULL_TVALOARE;
}


int Dictionar::dim() const {
	/* de adaugat */
	return lungime;
}

bool Dictionar::vid() const{
	/* de adaugat */
	if (lungime == 0)
		return true;
	else return false;
}


IteratorDictionar Dictionar::iterator() const {
	return  IteratorDictionar(*this);
}


