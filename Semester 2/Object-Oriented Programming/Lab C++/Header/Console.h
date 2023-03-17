#pragma once
#include "Service.h"
#include <string>
#include "Offer.h"

class UI
{
private:
	Service& srv;
	void AddOfferUI();
	void DeleteOfferUI();
	void PrintUI();
	void MenuUI();
public:
	UI(const UI& other) = delete;
	UI(Service& service) :srv{ service } {}



	void run();


};

