#include "Tests.h"
#include <string>
#include <assert.h>
#include <iostream>
using namespace std;

void Tests::runTests()
{
	testDomain();
	testService();

}
void Tests::testDomain()
{
	int id = 1;
	string name{ "Belvedere" };
	string dest{ "Burundi" };
	string type{ "cheap" };
	int cost = 2000;
	Valid validator;
	Offer offer{ id, name, dest, type, cost };
	assert(offer.getID() == id);
	assert(offer.getName() == name);
	assert(offer.getDestination() == dest);
	assert(offer.getType() == type);
	assert(offer.getCost() == cost);
	assert(validator.Validate(offer));

	Offer offer2{ -1, "", "", "", -1 };
	try {
		validator.Validate(offer2);
	}
	catch (exception& ex) {
		string s = ex.what();
		assert(s == "Invalid ID!\nInvalid Destination!\nInvalid Type!\nInvalid Name!\nInvalid Cost!\n");
	}
	offer2 = Offer{ 1, "", "", "", -1 };
	offer2.setCost(offer.getCost());
	offer2.setDestination(offer.getDestination());
	offer2.setName(offer.getName());
	offer2.setType(offer.getType());
	assert(offer == offer2);
}

void Tests::testService()
{
	testCreateServ();
	testServAdd();
	testServDelete();
	testServGetAll();

}

void Tests::testCreateServ()
{
	Repository repo;
	Valid val;
	Service serv{ repo, val };

	assert(repo.Length() == 0);


}
void Tests::testServAdd()
{
	Repository repo;
	Valid val;
	Service serv{ repo , val };
	int id = 1;
	string name = "Belvedere" ;
	string dest = "Burundi" ;
	string type = "cheap" ;
	int cost = 2000;
	Offer offer{ id, name, dest, type, cost };
	repo.AddOfferRepo(Offer{ id, name, dest, type, cost });
	assert(repo.Length() == 1);
	try {
		serv.AddOffer(id, name, dest, type, cost);
	}
	catch (const exception& ex) {
		string exc = ex.what();
		assert(exc == "This Offer Already Exists!\n");
	}
}
void Tests::testServDelete()
{
	Repository repo;
	Valid val;
	Service serv{ repo , val };
	int id = 1;
	string name = "Belvedere";
	string dest = "Burundi";
	string type = "cheap";
	int cost = 2000;
	Offer offer{ id, name, dest, type, cost };
	repo.AddOfferRepo(Offer{ id, name, dest, type, cost });
	assert(repo.Length() == 1);
	serv.DeleteOffer(1);
	assert(repo.Length() == 0);
	try {
		serv.DeleteOffer(1);
	}
	catch (const exception& ex) {
		string exc = ex.what();
		assert(exc == "This Offer Doesn't Exist!\n");
	}
	try {
		serv.DeleteOffer(-1);
	}
	catch (const exception& ex) {
		string exc = ex.what();
		assert(exc == "Invalid ID!\n");
	}

}

void Tests::testServGetAll()
{
	Repository repo;
	Valid val;
	Service serv{ repo , val };

	int id = 1;
	string name = "Belvedere";
	string dest = "Burundi";
	string type = "cheap";
	int cost = 2000;

	serv.AddOffer(id, name, dest, type, cost);
	vector<Offer>v = serv.GetAll();
	assert(v.size() == 1);

}
