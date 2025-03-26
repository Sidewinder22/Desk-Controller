/**
 * @date 27.01.2024
 */

#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "TcpServer.hpp"

class Backend : public QObject
{
    Q_OBJECT

public:
    explicit Backend(QObject *parent = nullptr);

signals:
    void pcMonitorConnected(const QString &ipAddress);
    void pcMonitorDisconnected();
    void loadDataReceived(const QString &loadData);

public slots:
    void dataReady(const QString &data);
    void pcMonitorConnectedSlot(const QString &ipAddress);
    void pcMonitorDisconnectedSlot();

private:
    TcpServer *pcMonitor_;
};

#endif // BACKEND_H
