#include "Service.h"


Service::Service(Repository<Melodii>* repo) : repo{ repo } {}

vector<Melodii> Service::getAll()
{
	return this->repo->getAll();
}
int Service::GetRepo()
{
	return this->repo->getSize();

}