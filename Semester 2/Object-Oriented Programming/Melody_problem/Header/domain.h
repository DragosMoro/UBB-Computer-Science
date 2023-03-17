#pragma once
#include <iostream>
#include <string>
using namespace std;

class Melodie {
private:
	int id;
	string titlu;
	string artist;
	string gen;

public:
	Melodie(int id, string titlu, string artist, string gen) :id{ id }, titlu{ titlu }, artist{ artist }, gen{ gen }{}
	int getId()
	{
		return this->id;
	}
	const string& getTitlu()
	{
		return this->titlu;
	}
	const string& getArtist()
	{
		return this->artist;
	}
	const string& getGen()
	{
		return this->gen;
	}
	~Melodie() = default;

};