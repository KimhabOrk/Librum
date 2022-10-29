#pragma once
#include <QImage>
#include <QString>

namespace domain::models
{

struct BookMetaData
{
    QString title;
    QString author;
    QString creator;
    QString creationDate;
    QString format;
    QString language;
    QString documentSize;
    QString pagesSize;
    int pageCount;
    QString addedToLibrary;
    QString lastOpened;
    QImage cover;

    bool operator==(const BookMetaData& rhs) const
    {
        return title == rhs.title && author == rhs.author &&
               creator == rhs.creator && creationDate == rhs.creationDate &&
               format == rhs.format && language == rhs.language &&
               documentSize == rhs.documentSize && pagesSize == rhs.pagesSize &&
               pageCount == rhs.pageCount &&
               addedToLibrary == rhs.addedToLibrary &&
               lastOpened == rhs.lastOpened && cover == rhs.cover;
    }
};

}  // namespace domain::models