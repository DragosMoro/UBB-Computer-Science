#pragma once

#include <QWidget>
#include "ui_UserWindow.h"
#include "MelodiiModel.h"
#include "Service.h"


class UserWindow : public QWidget
{
	Q_OBJECT

public:
	UserWindow(Service* serv, MelodiiModel* imodel, QWidget* parent = Q_NULLPTR);
	~UserWindow() = default;

	void connectSignalsAndSlots();
	void addButtonHandler();
	int selectionHandler();
	void removeButtonHandler();
	void resolveHandler();

private:
	Ui::UserWindow ui;
	Service* serv;
	MelodiiModel* imodel;
};
