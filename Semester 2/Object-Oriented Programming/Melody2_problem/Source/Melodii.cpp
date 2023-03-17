#include "Melodii.h"
using namespace std;
Melodii::Melodii(int id, string titlu, string artist, int rank) : id{ id }, titlu{ titlu }, artist{ artist }, rank{rank}
{
}

int Melodii::getId()
{
	return this->id;
}


string Melodii::getTitlu()
{
	return this->titlu;
}
string Melodii::getArtist()
{
	return this->artist;
}

int Melodii::getRank()
{
	return this->rank;
}

void Melodii::setTitlu(string titlu_nou)
{
	this->titlu = titlu_nou;
}

void Melodii::setArtist(string artist_nou)
{
	this->artist = artist_nou;
}

void Melodii::setRank(int rank_nou)
{
	this->rank = rank_nou;
}

ostream& operator<<(ostream& os, const Melodii& m)
{
	return os << m.id << m.titlu << m.titlu << m.rank;

}

istream& operator>>(istream& is, Melodii& m)
{
	return is >> m.id >> m.titlu >> m.titlu >> m.rank;

}
