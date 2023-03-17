#pragma once

#include "FileRepository.h"

class Service
{
public:
	Service(Repository<Melodii>* repo);
	int GetRepo();
	vector<Melodii> getAll();
	//void addMelodie(string m);
	//void removeMelodie(string m);
	//void updateMelodie()


private:
	Repository<Melodii>* repo;
};