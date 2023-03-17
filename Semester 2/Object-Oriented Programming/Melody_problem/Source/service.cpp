#include "service.h"

vector<Melodie>& Service::getAll() {
	return repo.getAll();
}
void Service::del(int id) {
	repo.del(id);
}
void Service::add(int id, string titlu, string artist, string gen) {
	repo.add(id, titlu, artist, gen);
}

Melodie& Service::find(int id) {
	int index = 0;
	for (auto& el : repo.getAll()) {
		if (el.getId() == id)
			break;
		index++;
	}
	return repo.getAll()[index];
}
