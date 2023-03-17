#include "MelodiiWindow.h"
#include "qmessagebox.h"

UserWindow::UserWindow(Service* serv, MelodiiModel* imodel, QWidget* parent) :
	serv{ serv }, imodel{ imodel }, QWidget(parent)
{
	ui.setupUi(this);
	this->ui.tableView->setModel(imodel);
	this->connectSignalsAndSlots();
	ui.tableView->setSortingEnabled(true);
	ui.tableView->sortByColumn(3, Qt::AscendingOrder);
}

void UserWindow::connectSignalsAndSlots()
{
	QObject::connect(ui.AddpushButton, &QPushButton::clicked, this, &UserWindow::addButtonHandler);
	QObject::connect(ui.tableView->selectionModel(), &QItemSelectionModel::selectionChanged, this, &UserWindow::selectionHandler);
	QObject::connect(ui.RemovePushButton, &QPushButton::clicked, this, &UserWindow::removeButtonHandler);
	QObject::connect(ui.ResolvePushButton, &QPushButton::clicked, this, &UserWindow::resolveHandler);
}