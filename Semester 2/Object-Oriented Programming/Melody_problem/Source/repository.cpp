#include "repository.h"
#include <fstream>
void Repository::readFromFile()
{
	ifstream fin(filename);
	if (!fin.is_open())
		return;
	while (!fin.eof())
	{
		int id;
		string titlu, artist, gen;
		fin >> id >> titlu >> artist >> gen;
		if(titlu!="" && artist!="" && gen!="")
			if (gen == "folk" || gen == "rock" || gen == "pop" || gen == "disco")
			{
				Melodie m(id, titlu, artist, gen);
				lista.push_back(m);
			}

	}
	fin.close();


}

void Repository::writeToFile()
{
	ofstream fout(filename);
	if (!fout.is_open())
		return;
	for (auto& m : lista)
	{
		fout<<m.getId() << " " << m.getTitlu() << " " << m.getArtist()
			<< " " << m.getGen() << "\n";
	}

}


vector<Melodie>& Repository::getAll()
{
	return lista;

}

void Repository::add(int id, string titlu, string artist, string gen) 
{
	for (auto& elem : lista)
	{
		if (elem.getId() == id)
			throw string("Id deja existent\n");
	}
	Melodie m(id, titlu, artist, gen);
	lista.push_back(m);
	writeToFile();
}
void Repository::del(int id)
{
	int i=0;
	for (auto& elem : lista)
	{
		if (elem.getId() == id)
			lista.erase(lista.begin()+i);
		i++;
	}
	writeToFile();
}