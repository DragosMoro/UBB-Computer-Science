#pragma once
#include <string>
using std::string;

class Offer
{
private:
	int id;
	string name;
	string destination;
	string type;
	int cost;


public:
	Offer(int id, const string& name_offer, const string& dest, const string& type_of, int price) : id{ id }, name{ name_offer }, destination{ dest }, type{ type_of }, cost{ price }{}
	Offer(const Offer& other);
	const string& getName() const;
	const string& getDestination() const;
	const string& getType() const;
	int getID() const;
	int getCost() const;
	void setName(const string& newName);
	void setDestination(const string& newDestination);
	void setType(const string& newType);
	void setCost(int newCost);
	
	Offer& operator=(const Offer& other)
	{
		this->id = other.id;
		this->name = other.name;
		this->destination = other.destination;
		this->cost = other.cost;
		return *this;
	}

	bool operator==(const Offer& other)
	{
		return (this->id == other.id);
	}
};
