#include "Repo.h"
#include <iostream>
#include <string>
#include <algorithm>
int Repository::AddOfferRepo(const Offer& offer)
{
	if (FindOfferRepo(offer.getID()))
		throw runtime_error("This Offer Already Exists!\n");

	this->list.push_back(offer);
	return 1;
}

int Repository::DeleteOfferRepo(int id)
{
	auto iterator = find_if(list.begin(), list.end(), [=](const Offer& offer) {return offer.getID() == id; });
	if (iterator != list.end())
	{
		list.erase(iterator);
		return 1;
	}
	throw runtime_error("This Offer Doesn't Exist!\n");
}

int Repository::FindOfferRepo(int id)
{
	auto iterator = find_if(list.begin(), list.end(), [=](const Offer& offer) {return offer.getID() == id; });
	if (iterator != list.end())
		return 1;
	return 0;
}

size_t Repository::Length()
{
	return this->list.size();
}

vector<Offer> Repository::GetAllOffers() const
{
	return list;
}