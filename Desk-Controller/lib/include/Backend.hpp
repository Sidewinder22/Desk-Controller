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
    void pcMonitorConnectedNotif(const QString &ipAddress, const QString &hostname);
    void pcMonitorDataReceivedNotif(const QString &loadData);
    void pcMonitorDisconnectedNotif();

    void rpiMonitorConnectedNotif(const QString &ipAddress, const QString &hostname);
    void rpiMonitorDataReceivedNotif(const QString &loadData);
    void rpiMonitorDisconnectedNotif();

public slots:
    void pcMonitorConnected(const QString &ipAddress, const QString &hostname);
    void pcMonitorDataReceived(const QString &data);
    void pcMonitorDisconnected();

    void rpiMonitorConnected(const QString &ipAddress, const QString &hostname);
    void rpiMonitorDataReceived(const QString &data);
    void rpiMonitorDisconnected();

private:
    TcpServer *tcpServer_;
};

#endif // BACKEND_H
