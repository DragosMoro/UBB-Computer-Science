#include "gui.h"

void Console::initButtons()
{
	tableModel = new MyTableModel(srv.getAll());
	tableView = new QTableView;
	tableView->setModel(tableModel);
	tableView->setFixedSize(450, 450);

	verticalBL = new QVBoxLayout;
	setLayout(verticalBL);
	verticalBL->addWidget(tableView);

	widget = new QWidget;
	verticalBL->addWidget(widget);
	formLayout = new QFormLayout;
	widget->setLayout(formLayout);

	 labelId = new QLabel("ID");
	 textId = new QLineEdit;
	 labelArtist = new QLabel("Artist");
	 textArtist = new QLineEdit;
	 labelTitlu = new QLabel("Titlu");
	 textTitlu = new QLineEdit;
	 labelGen = new QLabel("Gen");
	 textGen = new QLineEdit;
	 formLayout->addRow(labelId, textId);
	 formLayout->addRow(labelTitlu, textTitlu);
	 formLayout->addRow(labelArtist, textArtist);
	 formLayout->addRow(labelGen, textGen);

	 adaugare = new QPushButton("&Adaugare");
	 formLayout->addWidget(adaugare);

	 stergere = new QPushButton("&Stergere");
	 formLayout->addWidget(stergere);


}

void Console::addMelodie() {
	try {
		
		int id = textId->text().toInt();
		
		srv.add(id, textArtist->text().toStdString(),
			textTitlu->text().toStdString(), textGen->text().toStdString());
		tableModel->setMelodii(srv.getAll());
		
	}
	catch (string& err) {
		QMessageBox::information(this, "Error", QString::fromStdString(err));
	}
}

void Console::connectButtons() {
	
	QObject::connect(tableView->selectionModel(),
		&QItemSelectionModel::selectionChanged, [this]() {
			int row = tableView->selectionModel()->selectedIndexes().at(0).row();
			auto IdIndex = tableView->model()->index(row, 0);
			int id = tableView->model()->data(IdIndex, Qt::DisplayRole).toInt();
			id1 = id;
			Melodie m = srv.find(id);
		});
		
	QObject::connect(adaugare, &QPushButton::clicked, [&]() {
		addMelodie();
		});
	
	QObject::connect(stergere, &QPushButton::clicked, [&]() {
		
			srv.del(id1);
			refreshList();
		});

		
	
}

void Console::refreshList() {
	tableModel->setMelodii(srv.getAll());
}


int MyTableModel::rowCount(const QModelIndex&) const {
	return lista.size();
}

int MyTableModel::columnCount(const QModelIndex&) const {
	return 6;
}

QVariant MyTableModel::data(const QModelIndex& index, int role) const {
	if (role == Qt::DisplayRole) {
		Melodie m = lista[index.row()];
		int nr = -1;
		int nr1 = -1;
		for (auto m1 : lista) {
			if (m1.getArtist() == m.getArtist())
				nr++;
			if (m1.getGen() == m.getGen())
				nr1++;
		}
		switch (index.column()) {
		case 0: return QString::fromStdString(to_string(m.getId()));  break;
		case 1: return QString::fromStdString(m.getTitlu());  break;
		case 2: return QString::fromStdString(m.getArtist());  break;
		case 3: return QString::fromStdString(m.getGen());  break;
		case 4: return QString::fromStdString(to_string(nr));  break;
		case 5: return QString::fromStdString(to_string(nr1));  break;
		default: break;
		}
	}
	
	return QVariant();
}
/*
void Console::paintEvent(QPaintEvent* ev) {
	QPainter painter{ this };
	vector < Melodie > songs = srv.getAll();
	vector < int > raze(4, 5);
	vector < string > genuri = { "pop", "rock", "folk", "disco" };
	vector < QPoint > centers = { QPoint{25, 25}, QPoint{width() - 25, 25}, QPoint{25, height() - 25}, QPoint{width() - 25, height() - 25} };
	std::map < string, int > evidence;
	for (const auto song : songs)
	{
		evidence[song.getGen()]++;
	}
	for (int gen = 0; gen < 4; ++gen)
	{
		for (int cont = 0; cont < evidence[genuri[gen]]; ++cont)
		{
			painter.drawEllipse(centers[gen], raze[gen], raze[gen]);
			raze[gen] += 5;
		}
	}
}
*/