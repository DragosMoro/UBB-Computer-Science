#include "Console.h"
#include <iostream>
#include <exception>
#include <string> 
void UI::MenuUI()
{
	cout << "MENU:\n";
	cout << "'ADD' - ADD AN OFFER\n";
	cout << "'DEL' - DELETE AN OFFER\n";
	cout << "'EXIT' - EXIT FROM THIS PROGRAM\n";


}

void UI::AddOfferUI()
{
	string id;
	string name;
	string destination;
	string type;
	string cost;
	int id_int = 0;
	int cost_int = 0;
	cout << "ID: ";
	cin >> id;
	cout << "Name: ";
	cin >> name;
	cout << "Destination: ";
	cin >> destination;
	cout << "Type: ";
	cin >> type;
	cout << "Cost: ";
	cin >> cost;
	if (id.length() > 16 || cost.length()>10)
		cout << "ID/Cost too long!\n";
	else {
		try {
			id_int = stoi(id);
		}
		catch (exception& ) {
			cout <<"invalid ID!\n";
			return;
		}
		try{
			cost_int = stoi(cost);
		}
		catch (exception&) {
			cout << "invalid COST!\n";
			return;
		}
		try {
			srv.AddOffer(id_int, name, destination, type, cost_int);

		}
		catch (exception& ex) {
			cout << ex.what();
		}

		cout << "\n";
	}
}
void UI::DeleteOfferUI()
{
	int id_int = 0;
	string id;
	cout << "ID: ";
	cin >> id;

	if (id.length()> 1000)
		cout << "ID too long!\n";
	else
	{
		try {
			id_int = stoi(id);
		}
		catch (exception&) {
			cout << "invalid ID";
			return;
		}
		try {
			srv.DeleteOffer(id_int);

		}
		catch (exception& ex) {
			cout << ex.what();
		}

	}
	cout << "\n";
}
void UI::PrintUI()
{
	vector<Offer>v = srv.GetAll();
	for (const auto& el : v)

		cout << el.getID() << " " << el.getName() << " " << el.getDestination() << " " << el.getType() << " " << el.getCost() << "\n";

	cout << "\n";
}

void UI::run() {
	string cmd;
	MenuUI();
	while (1) {
		cout << "Enter your command\n>>>";
		cin >> cmd;
		if (cmd == "ADD")
			AddOfferUI();
		else if (cmd == "DEL")
			DeleteOfferUI();
		else if (cmd == "ALL")
			PrintUI();
		else if (cmd == "EXIT")
			return;
	}
}