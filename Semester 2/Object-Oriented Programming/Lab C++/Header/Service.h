#pragma once
#include "Repo.h"
#include "Valid.h"
#include "Offer.h"

class Service
{
private:
	Repository& repo;
	Valid& valid;


public:
	Service(Repository& repository, Valid& validation);
	/// <summary>
	/// Adds a new element to the repository
	/// </summary>
	int AddOffer(int id, const string& name_offer, const string& dest, const string& type_of, int price);
	/// <summary>
	/// Removes an element from the repository
	/// </summary>
	int DeleteOffer(int id);
	/// <summary>
	/// It returns all offers
	/// </summary>
	vector<Offer> GetAll() const;
};