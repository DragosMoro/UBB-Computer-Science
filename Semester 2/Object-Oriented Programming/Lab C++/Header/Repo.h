#pragma once
#include <vector>
#include <string>
#include "Offer.h"
using namespace std;

class Repository
{
private:

	vector<Offer>list;

public:
	/// <summary>
	/// Adds a new element to the repository
	/// </summary>

	int AddOfferRepo(const Offer& offer);

	/// <summary>
	/// Removes an element from the repository
	/// </summary>
	int DeleteOfferRepo(int id);
	/// <summary>
	/// Search by id
	/// </summary>
	int FindOfferRepo(int id);
	/// <summary>
	/// It returns the length of the vector
	/// </summary>
	size_t Length();
	/// <summary>
	/// It returns all offers
	/// </summary>
	vector<Offer> GetAllOffers() const;


};