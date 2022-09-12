#pragma once
#include <QObject>
#include <QString>


namespace domain::models
{

class Tag : public QObject
{
    Q_OBJECT
    
public:
    Tag(QString name);
    
    QString name();
    void setName(QString newName);
    
private:
    QString m_name;
};

} // namespace domain::models