#pragma once
#include <iostream>

using namespace std;

class Melodii {
public:
	Melodii() = default;
	Melodii(int id, string titlu, string artist, int rank);
	~Melodii() = default;
	int getId();
	string getTitlu();
	string getArtist();
	int getRank();
	void setTitlu(string titlu_nou);
	void setArtist(string artist_nou);
	void setRank(int rank_nou);
	friend ostream& operator<<(ostream& os, const Melodii& m);
	friend istream& operator>>(istream& is, Melodii& m);

private:
	int id;
	string titlu;
	string artist;
	int rank;

};