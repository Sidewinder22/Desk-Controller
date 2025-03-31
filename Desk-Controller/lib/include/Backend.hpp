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
    ~Backend() override = default;

signals:
    void pcMonitorConnectedNotif(const QString &ipAddress);
    void pcMonitorDataReceivedNotif(const QString &loadData);
    void pcMonitorDisconnectedNotif();

public slots:
    void pcMonitorConnected(const QString &ipAddress);
    void pcMonitorDataReceived(const QString &data);
    void pcMonitorDisconnected();

private:
    TcpServer *pcMonitor_;
};

#endif // BACKEND_H
