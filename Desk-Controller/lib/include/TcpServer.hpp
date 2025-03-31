#ifndef TCPSERVER_HPP
#define TCPSERVER_HPP

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QScopedPointer>
#include "PCMonitor.hpp"

class TcpServer : public QObject
{
    Q_OBJECT

public:
    TcpServer(quint16 port, QObject *parent = nullptr);
    ~TcpServer() override;
    bool start();

signals:
    void pcMonitorConnectedNotif(const QString &ipAddress);
    void pcMonitorDataReceivedNotif(const QString &data);
    void pcMonitorDisconnectedNotif();

public slots:
    void newConnection();
    void pcMonitorDataReceived(const QString &data);
    void pcMonitorDisconnected();

private:
    QTcpServer *server_ = nullptr;
    QScopedPointer<PCMonitor> pcMonitor_;
    quint16 port_;
};

#endif // TCPSERVER_HPP
