/**
 * @date 27.01.2024
 */

#ifndef BACKEND_H
#define BACKEND_H

#include <memory>
#include <QObject>
#include "TcpServer.hpp"

class Backend : public QObject
{
    Q_OBJECT

public:
    explicit Backend(QObject *parent = nullptr);

signals:

public slots:
    void dataReady(const QString &data);

private:
    TcpServer *pcMonitor_;
};

#endif // BACKEND_H
