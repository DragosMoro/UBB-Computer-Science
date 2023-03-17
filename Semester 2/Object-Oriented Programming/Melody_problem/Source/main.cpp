#include "Melodii2.h"
#include <QtWidgets/QApplication>
#include "gui.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Repository repo{ "input2.txt" };
    Service srv{ repo };
    Console c{ srv };
    c.show();
    return a.exec();
}
