#include "MelodiiModel.h"

MelodiiModel::MelodiiModel(Service* service) :
    service{ service }
{
}

int MelodiiModel::rowCount(const QModelIndex& parent) const
{
    return this->service->GetRepo();
}

int MelodiiModel::columnCount(const QModelIndex& parent) const
{
    return 4;
}

QVariant MelodiiModel::data(const QModelIndex& index, int role) const
{
    int row = index.row();
    int column = index.column();
    auto idea = this->service->getAll()[row];

    if (role == Qt::DisplayRole) {
        switch (column) {
        case 0: return QString::number(idea.getId());
        case 1: return QString::fromStdString(idea.getTitlu());
        case 2: return QString::fromStdString(idea.getArtist());
        case 3: return QString::number(idea.getRank());
        default: break;
        }
    }

    return QVariant();
}

QVariant MelodiiModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (orientation == Qt::Horizontal && role == Qt::DisplayRole) {
        switch (section) {
        case 0: return QString{ "ID" };
        case 1: return QString{ "Titlu" };
        case 2: return QString{ "Artist" };
        case 3: return QString{ "Rank" };
        default: break;
        }
    }
    return QVariant();
}

