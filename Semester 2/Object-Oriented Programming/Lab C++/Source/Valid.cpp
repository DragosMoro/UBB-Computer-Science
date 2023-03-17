#include "Valid.h"
#include <iostream>
using namespace std;
bool Valid::ValidateID(int id)
{

    if (id <= 0)
        return false;

    return true;
}

bool Valid::Validate(Offer& offer)
{
    vector<string>excep;
    Exceptions ex;

    if (!ValidateID(offer.getID()))
        excep.push_back("Invalid ID!\n");
    if (offer.getDestination().length() < 1 || offer.getDestination().length() >50 )
        excep.push_back("Invalid Destination!\n");
    if (offer.getType().length() < 1 || offer.getType().length() >50)
        excep.push_back("Invalid Type!\n");
    if (offer.getName().length() < 1 || offer.getName().length() >50)
        excep.push_back("Invalid Name!\n");
    if (offer.getCost() < 0 || offer.getCost() > 10000)
        excep.push_back("Invalid Cost!\n");

    if (excep.size() > 0)
        throw runtime_error(ex.GetException(excep));

    return true;
}

string Exceptions::GetException(const vector<string>& excep)
{
    string s;
    for (const auto& el : excep) {
        s = s + el;
    }
    return s;
}
