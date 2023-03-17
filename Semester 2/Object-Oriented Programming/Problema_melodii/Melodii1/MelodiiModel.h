#pragma once
#include <QAbstractTableModel>
#include "Service.h"

class MelodiiModel : public QAbstractTableModel
{
private:
	Service* service;

public:
	MelodiiModel(Service* service);

	int rowCount(const QModelIndex& parent = QModelIndex()) const override;
	int columnCount(const QModelIndex& parent = QModelIndex()) const override;
	QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
	QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

	//void addIssue(std::string d, User u);
	//void removeIssue(std::string d);
	//void updateStatus(std::string name, std::string d);
	//void clearData();
};