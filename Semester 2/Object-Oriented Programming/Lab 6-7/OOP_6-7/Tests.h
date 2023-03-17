#include "Repo.h"
#include "Service.h"
#include "Valid.h"
#pragma once

class Tests
{

public:
	void runTests();


private:
	void testDomain();
	void testService();
	void testCreateServ();
	void testServAdd();
	void testServDelete();
	void testServGetAll();
	void testRepo();

};

