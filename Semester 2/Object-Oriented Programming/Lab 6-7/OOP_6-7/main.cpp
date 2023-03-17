#include <iostream>
#include "Repo.h"
#include "Service.h"
#include "Console.h"
#include "Valid.h"
#include "Tests.h"

using namespace std;

int main() {
	Tests tests;
	tests.runTests();

	Repository repo;
	Valid valid;
	Service srv{ repo, valid };
	UI ui{ srv };
	ui.run();


	return 0;
}
