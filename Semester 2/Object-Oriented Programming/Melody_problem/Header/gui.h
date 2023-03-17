#pragma once
#include "service.h"
#include <iostream>
#include <qwidget.h>
#include <qtableview.h>
#include <QtWidgets/qboxlayout.h>
#include <qlabel.h>
#include <QtWidgets/qlineedit.h>
#include <QtWidgets/qformlayout.h>
#include <qpushbutton.h>
#include <qmessagebox.h>
using namespace std;

class MyTableModel :public QAbstractTableModel
{
private: 
	vector<Melodie> lista;

public:
	MyTableModel(vector <Melodie>& lista) : lista{ lista } {}
	int rowCount(const QModelIndex& parent = QModelIndex()) const override;
	int columnCount(const QModelIndex& parent = QModelIndex()) const override;
	QVariant data(const QModelIndex& index, int role) const override;
	void setMelodii(const vector<Melodie>& list)
	{
		lista = list;
		std::sort(lista.begin(), lista.end(), [](Melodie& m1, Melodie& m2) {
			return m1.getArtist() < m2.getArtist(); });
		QModelIndex topLeft = createIndex(0, 0);
		QModelIndex bottomRight = createIndex(rowCount(), columnCount());
		emit dataChanged(topLeft, bottomRight,
			{ Qt::DisplayRole, Qt::BackgroundRole });
		emit layoutChanged();
	}


};

class Console : public QWidget {
private:
	int id1 = -1;
	Service& srv;
	QTableView* tableView;
	MyTableModel* tableModel;
	QVBoxLayout* verticalBL;
	QWidget* widget;
	QVBoxLayout* verticalBL2;
	
	QFormLayout* formLayout;
	QLabel* labelId;
	QLineEdit* textId;
	QLabel* labelArtist;
	QLineEdit* textArtist;
	QLabel* labelTitlu;
	QLineEdit* textTitlu;
	QLabel* labelGen;
	QLineEdit* textGen;
	
	QPushButton* adaugare;
	QPushButton* stergere;
	QPaintEvent* Event;
	QSlider* slider;

public:
	Console(Service& srv) :srv{ srv } {
		initButtons();
		connectButtons();
		refreshList();
		//void paintEvent(QPaintEvent * ev) override;
	}
	void initButtons();
	void connectButtons();
	void addMelodie();
	void refreshList();




};