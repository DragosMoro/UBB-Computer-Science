#pragma once
#include "repository.h"

class Service {
private:
	Repository& repo;
public:
	Service(Repository& repo) : repo{ repo } {}
	vector<Melodie>& getAll();
	void add(int id, string titlu, string artist, string gen);
	void del(int id);
	Melodie& find(int id);


};