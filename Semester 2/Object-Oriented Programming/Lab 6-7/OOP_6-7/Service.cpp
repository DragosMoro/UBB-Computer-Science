#include "Service.h"
#include <iostream>
#include <algorithm>

Service::Service(Repository& repository, Valid& validation) :repo{ repository }, valid{ validation }{}

int Service::AddOffer(int id, const string& name_offer, const string& dest, const string& type_of, int price)
{
	Offer offer{ id, name_offer, dest, type_of, price };
	valid.Validate(offer);
	return repo.AddOfferRepo(offer);
}

int Service::DeleteOffer(int id)
{
	if (!valid.ValidateID(id))
		throw runtime_error("Invalid ID!\n");
	return repo.DeleteOfferRepo(id);
}

vector<Offer> Service::GetAll() const
{
	return repo.GetAllOffers();
}