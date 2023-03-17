#include <QtWidgets/QApplication>
#include "MelodiiWindow.h"


int main(int argc, char* argv[])
{
    QApplication a(argc, argv);

    std::string melodii = "melodii.txt";
    std::string issueFP = "issues.txt";

    //std::ifstream Uip(userFP);

    Repository<Melodii>* m = new Repository<Melodii>{ melodii};

    Service* serv = new Service{ m};
    MelodiiModel* mmodel = new MelodiiModel{ serv };

   
    UserWindow* window = new UserWindow{ serv, mmodel};
    window->show();
    return a.exec();
}
