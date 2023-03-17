#pragma once
#include "Offer.h"
#include <vector>
#include <string>
using namespace std;

class Exceptions {
public:
	string GetException(const vector<string>& excep);
};

class Valid
{
public:
	bool ValidateID(int id);
	bool Validate(Offer& offer);
};

