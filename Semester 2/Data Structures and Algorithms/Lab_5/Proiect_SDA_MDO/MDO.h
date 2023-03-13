#pragma once

#include <vector>

typedef int TCheie;
typedef int TValoare;

#include <utility>
//typedef std::pair<TCheie, TValoare> TElem;

using namespace std;

class IteratorMDO;

typedef bool(*Relatie)(TCheie, TCheie);

class Nod;
class Nod2;

typedef Nod* PNod;
typedef Nod2* PNod2;
class Nod2 {
public:
	friend class IteratorMDO;
	friend class MDO;
	Nod2(TValoare v, PNod2 lista);
	PNod2 urmator();
private:
	TValoare v;
	PNod2 urm;
};
class Nod {
public:
	friend class IteratorMDO;
	friend class MDO;
	//constructor
	Nod(TCheie c, PNod2 pointer_lista, PNod urm);
	TCheie el();
	PNod2 get_list_pointer();
	PNod urmator();

private:
	TCheie c;
	PNod urm;
	PNod2 pointer_lista;
};


class MDO {
	friend class Nod;
	friend class IteratorMDO;
private:
	PNod prim;
	PNod ultim;
	Relatie rel;
	/* aici e reprezentarea */
public:

	// constructorul implicit al MultiDictionarului Ordonat
	MDO(Relatie r);

	// adauga o pereche (cheie, valoare) in MDO
	void adauga(TCheie c, TValoare v);


	void adaugacheie(TCheie c);

	vector<TValoare> stergeValoriPentruCheie(TCheie c) const;

	//cauta o cheie si returneaza vectorul de valori asociate
	vector<TValoare> cauta(TCheie c) const;

	//sterge o cheie si o valoare 
	//returneaza adevarat daca s-a gasit cheia si valoarea de sters
	bool sterge(TCheie c, TValoare v);

	//returneaza numarul de perechi (cheie, valoare) din MDO 
	int dim() const;

	//verifica daca MultiDictionarul Ordonat e vid 
	bool vid() const;

	// se returneaza iterator pe MDO
	// iteratorul va returna perechile in ordine in raport cu relatia de ordine
	IteratorMDO iterator() const;

	// destructorul 	
	~MDO();

	void setprim(PNod);

};