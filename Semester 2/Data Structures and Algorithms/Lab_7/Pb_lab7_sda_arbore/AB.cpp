#include "AB.h"
#include "IteratorAB.h"
#include <exception>
#include <string>


AB::AB() {
	/* de adaugat */
	rad = 0;
	stanga = new int[256];
	dreapta = new int[256];
}

AB::AB(const AB& ab) {
	rad = ab.rad;
	/* de adaugat */
}

AB::AB(TElem e){
	rad = e;
	stanga[e] = 0;
	dreapta[e] = 0;
	/* de adaugat */
}

AB::AB(const AB& st, TElem e, const AB& dr){
	distruge(rad);
	rad = e;
	stanga[e] = 0;
	dreapta[e] = 0;
	stanga[rad] = copiere(st.rad);
	dreapta[rad] = copiere(dr.rad);

}

void AB::distruge(int x)
{

}
void AB::distrugeSubarbori(int x)
{

}
int AB::copiere(int x) const
{
	if (x != 0)
	{

	}
}
void AB::adaugaSubSt(const AB& st){
 	/* de adaugat */
}

void AB::adaugaSubDr(const AB& dr){
	/* de adaugat */
}

TElem AB::element() const{
 	/* de adaugat */
	return -1;
}

AB AB::stang() const{
 	/* de adaugat */
    return AB();
}

AB AB::drept() const{
	/* de adaugat */
	return AB();
}

AB::~AB() {
	/* de adaugat */
}

bool AB::vid() const{
	/* de adaugat */
	return true;
}


IteratorAB* AB::iterator(string s) const {
	if (s=="preordine")
		return new IteratorPreordine(*this);
	if (s=="inordine")
		return new IteratorInordine(*this);
	if (s=="postordine")
		return new IteratorPostordine(*this);
	if (s=="latime")
		return new IteratorLatime(*this);
	return nullptr;
};
