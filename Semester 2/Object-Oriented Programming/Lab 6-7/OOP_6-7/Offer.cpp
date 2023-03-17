#include "Offer.h"
#include <iostream>
const string& Offer::getName() const
{
	return this->name;
}
const string& Offer::getDestination() const
{
	return this->destination;
}
const string& Offer::getType() const
{
	return this->type;
}
int Offer::getID() const
{
	return this->id;
}
int Offer::getCost() const
{
	return this->cost;
}
void Offer::setName(const string& newName)
{
	this->name = newName;
}
void Offer::setDestination(const string& newDestination)
{
	this->destination = newDestination;
}
void Offer::setType(const string& newType)
{
	this->type = newType;
}
Offer::Offer(const Offer& other)
{
	id = other.id;
	name = other.name;
	destination = other.destination;
	type = other.type;
	cost = other.cost;
}
void Offer::setCost(int newCost) 
{
	this->cost = newCost;
}