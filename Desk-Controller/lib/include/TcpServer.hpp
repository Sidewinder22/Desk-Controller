#ifndef TCPSERVER_HPP
#define TCPSERVER_HPP

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QScopedPointer>
#include "PCMonitor.hpp"
#include "RpiMonitor.hpp"

class TcpServer : public QObject
{
    Q_OBJECT

public:
    TcpServer(quint16 port, QObject *parent = nullptr);
    ~TcpServer() override;
    bool start();

signals:
    void pcMonitorConnectedNotif(const QString &ipAddress, const QString &hostname);
    void pcMonitorDataReceivedNotif(const QString &data);
    void pcMonitorDisconnectedNotif();

    void rpiMonitorConnectedNotif(const QString &ipAddress, const QString &hostname);
    void rpiMonitorDataReceivedNotif(const QString &data);
    void rpiMonitorDisconnectedNotif();

public slots:
    void newConnection();

    void pcMonitorDataReceived(const QString &data);
    void pcMonitorDisconnected();

    void rpiMonitorDataReceived(const QString &data);
    void rpiMonitorDisconnected();

private:
    QTcpServer *server_ = nullptr;
    QScopedPointer<PCMonitor> pcMonitor_;
    QScopedPointer<RpiMonitor> rpiMonitor_;
    quint16 port_;

    static constexpr std::string_view pcHostname = "Raptor";
    static constexpr std::string_view rpiHostname = "Raspberry Pi 4";
};

#endif // TCPSERVER_HPP
