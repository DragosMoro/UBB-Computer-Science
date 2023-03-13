#pragma once

#define NULL_TVALOARE -1
typedef int TCheie;
typedef int TValoare;
class IteratorDictionar;
#include <utility>
typedef std::pair<TCheie,TValoare> TElem;

class Dictionar {
	friend class IteratorDictionar;

	private:
	static const int nimic = -1;
	/* aici e reprezentarea */
	int cp;
	int lungime;
	TElem* e;
	int* urm;
	int* prec;
	//referinta catre primul element al listei
	int prim;

	int ultim;
	//referinta catre primul element din lista spatiului liber
	int primLiber;

	//functii pentru alocarea/dealocarea unui spatiu liber
	//se returneaza pozitia unui spatiu liber in lista
	int aloca();
	//dealoca spatiul de indice i
	void dealoca(int i, int precedent);
	//functie privata care creeaza un nod in lista inlantuita
	void redim();
	public:

	// constructorul implicit al dictionarului
	Dictionar();

	// adauga o pereche (cheie, valoare) in dictionar	
	//daca exista deja cheia in dictionar, inlocuieste valoarea asociata cheii si returneaza vechea valoare
	// daca nu exista cheia, adauga perechea si returneaza null: NULL_TVALOARE
	TValoare adauga(TCheie c, TValoare v);

	//cauta o cheie si returneaza valoarea asociata (daca dictionarul contine cheia) sau null: NULL_TVALOARE
	TValoare cauta(TCheie c) const;

	//sterge o cheie si returneaza valoarea asociata (daca exista) sau null: NULL_TVALOARE
	TValoare sterge(TCheie c);

	//returneaza numarul de perechi (cheie, valoare) din dictionar 
	int dim() const;

	//verifica daca dictionarul e vid 
	bool vid() const;

	// se returneaza iterator pe dictionar
	IteratorDictionar iterator() const;


	// destructorul dictionarului	
	~Dictionar();

};

