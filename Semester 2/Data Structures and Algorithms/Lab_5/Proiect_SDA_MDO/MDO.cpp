#include "IteratorMDO.h"
#include "MDO.h"
#include <iostream>
#include <vector>

#include <exception>
using namespace std;

Nod::Nod(TCheie c, PNod2 pointer_lista, PNod urm) {

    this->c = c;
    this->urm = urm;
    this->pointer_lista = pointer_lista;
}
MDO::MDO(Relatie r) {
    prim = nullptr;
    ultim = nullptr;
    rel = r;
    /* de adaugat */
}
Nod2::Nod2(TValoare v, PNod2 urm)
{
    this->v = v;
    this->urm = urm;

}
void MDO::setprim(PNod primnod) {
    prim = primnod;

}

TCheie Nod::el() {

    //Complexitate generala: teta(1)

    return c;
}

PNod2 Nod::get_list_pointer() {
    return pointer_lista;
}


PNod Nod::urmator() {
    /*
    Complexitate generala: teta(1)
    */
    return urm;
}

void MDO::adauga(TCheie c, TValoare v) {
    /* de adaugat */
     //complexitate o(n)
    PNod2 newNod2 = new Nod2(v, nullptr);
    PNod newNod = new Nod(c, newNod2, nullptr);
    if (prim == nullptr) {

        prim = newNod;
        ultim = prim;
        return;

    }
    else {
        IteratorMDO i = iterator();
        i.prim();
        PNod2 pnod2;
        bool found = false;
        while (i.valid()) {
            if (i.curent->c == c) {
                pnod2 = i.listval();

                while (pnod2 != nullptr) {
                    if (pnod2->urm != nullptr)
                        pnod2 = pnod2->urm;
                    else
                        break;
                }
                pnod2->urm = newNod2;
                found = true;
                break;
            }
            else {
                i.urmator();
            }

        }
        if (!found) {
            ultim->urm = newNod;
            ultim = newNod;

        }

    }
}
vector<TValoare> MDO::stergeValoriPentruCheie(TCheie c) const {


    //complexitate o(n)
    vector <TValoare> vect;
    PNod2 pnod2 = nullptr;
    IteratorMDO i = iterator();
    PNod anterior = nullptr;
    i.prim();
    while (i.valid()) {
        if (i.curent->c == c) {
            pnod2 = i.listval();
            while (pnod2 != nullptr) {
                vect.push_back(pnod2->v);
                pnod2 = pnod2->urm;
            }
            anterior->urm = i.curent->urm;
            break;
        }
        else {
            anterior = i.curent;
            i.urmator();
        }

    }
    return vect;
}


vector<TValoare> MDO::cauta(TCheie c) const {
    vector <TValoare> vect;
    PNod2 pnod2 = nullptr;
    IteratorMDO i = iterator();
    i.prim();
    while (i.valid()) {
        if (i.curent->c == c) {
            pnod2 = i.listval();
            while (pnod2 != nullptr) {
                vect.push_back(pnod2->v);
                pnod2 = pnod2->urm;
            }
            break;
        }
        else {
            i.urmator();
        }

    }
    return vect;
}

bool MDO::sterge(TCheie c, TValoare v) {
    IteratorMDO i = iterator();
    i.prim();
    PNod2 pnod2, anterior_nod2;
    PNod anterior_nod = nullptr;
    int end = 0;
    if (!i.valid())

        return false;

    while (i.valid()) {
        if (i.curent->c == c) {

            pnod2 = i.listval();
            anterior_nod2 = nullptr;

            while (pnod2 != nullptr && end != 1) {
                //parcurgem lista de valori
                //daca am gasit valoarea

                if (pnod2->v == v) {
                    //stergem valoarea v mutand pointerul daca exista mai mult de o valoare in lista de valori
                    if (anterior_nod2 != nullptr) {

                        anterior_nod2->urm = pnod2->urm;//inseamna ca nu esti pe prima pozitie

                    }
                    else if (anterior_nod2 == nullptr && pnod2->urm != nullptr) {//ii prima valoare dar nu singura dintr o cheie
                       //cout<<"intra paici\n";
                        i.curent->pointer_lista = pnod2->urm;

                    }
                    else {
                        //daca exista doar o valoarea in cheia c, stergem nodul principal
                        if (i.curent == i.get_prim() && pnod2->urm == nullptr) {//daca e o singura valoare la prima cheie
                            setprim(i.curent->urm);
                        }
                        else {
                            anterior_nod->urm = i.curent->urm;
                        }

                    }

                    return true;

                }
                else {

                    if (pnod2->urm != nullptr) {
                        //avansam in lista de valori

                        anterior_nod2 = pnod2;
                        pnod2 = pnod2->urm;

                    }
                    else {

                        end = 1;
                        return false;
                    }


                }


            }

        }
        else {
            anterior_nod = i.curent;
            i.urmator();
        }



    }

}

int MDO::dim() const {
    /* de adaugat */
    IteratorMDO i = iterator();
    int nr = 0;
    PNod curent = prim;
    while (curent != nullptr) {
        nr++;
        curent = curent->urm;
    }
    return nr;
}

bool MDO::vid() const {
    /* de adaugat */
    if (prim == nullptr)
        return true;
    return false;
}

IteratorMDO MDO::iterator() const {
    return IteratorMDO(*this);
}

MDO::~MDO() {
    /* de adaugat */
    IteratorMDO i = iterator();
    i.prim();
    while (i.valid()) {
        PNod curent = i.curent;
        i.urmator();
        delete curent;
    }
}
