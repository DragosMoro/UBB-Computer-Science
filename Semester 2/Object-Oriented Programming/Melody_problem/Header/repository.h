#pragma once
#include "domain.h"
#include <vector>
class Repository {
private:
	vector<Melodie> lista;
	string filename;
public:
	Repository(const string& filename) :filename{ filename } {
		readFromFile();
	}
	void readFromFile();
	void writeToFile();
	vector<Melodie>& getAll();
	void add(int id, string titlu, string artist, string gen);
	void del(int id);

};