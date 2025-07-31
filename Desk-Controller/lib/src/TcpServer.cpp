#include <iostream>
#include <source_location>
#include "TcpServer.hpp"

using sl = std::source_location;

TcpServer::TcpServer(quint16 port, QObject *parent)
    : QObject(parent)
    , server_(new QTcpServer(this))
    , pcMonitor_(nullptr)
    , port_(port)
{
    std::cout << sl::current().function_name() << ", TCP server is ready" << std::endl;

    connect(server_, &QTcpServer::newConnection, this, &TcpServer::newConnection);
}

TcpServer::~TcpServer()
{
    if (pcMonitor_)
    {
        pcMonitor_.reset();
    }

    if (rpiMonitor_)
    {
        rpiMonitor_.reset();
    }

    if (server_->isListening())
    {
        server_->close();
    }
}

bool TcpServer::start()
{
    std::cout << sl::current().function_name() << std::endl;

    if (server_->listen(QHostAddress::AnyIPv4, port_))
    {
        std::cout << sl::current().function_name() << ", server's listening on port: " << port_ << std::endl;
        return true;
    }
    else
    {
        std::cout << sl::current().function_name() << ", server couldn't start!" << std::endl;
        return false;
    }
}

void TcpServer::newConnection()
{
    std::cout << sl::current().function_name() << std::endl;

    QTcpSocket *socket = server_->nextPendingConnection();
    socket->waitForReadyRead();

    auto hostname = socket->readAll().trimmed();
    std::cout << "Hostname: " << hostname.toStdString() << "." << std::endl;

    if (hostname.toStdString() == pcHostname)
    {
        std::cout << sl::current().function_name() << hostname.toStdString() << " connected" << std::endl;

        auto ipAddres = socket->peerAddress().toString();

        pcMonitor_.reset(new PCMonitor(socket, this));
        connect(pcMonitor_.get(), &PCMonitor::pcMonitorDisconnectedNotif, this, &TcpServer::pcMonitorDisconnected);
        connect(pcMonitor_.get(), &PCMonitor::dataReceivedNotif, this, &TcpServer::pcMonitorDataReceived);

        emit pcMonitorConnectedNotif(ipAddres, hostname);
    }
    else if (hostname.toStdString() == rpiHostname)
    {
        std::cout << sl::current().function_name() << hostname.toStdString() << " connected" << std::endl;

        auto ipAddres = socket->peerAddress().toString();

        rpiMonitor_.reset(new RpiMonitor(socket, this));
        connect(rpiMonitor_.get(), &RpiMonitor::rpiMonitorDisconnectedNotif, this, &TcpServer::rpiMonitorDisconnected);
        connect(rpiMonitor_.get(), &RpiMonitor::dataReceivedNotif, this, &TcpServer::rpiMonitorDataReceived);

        emit rpiMonitorConnectedNotif(ipAddres, hostname);
    }
    else
    {
        std::cout << sl::current().function_name() << "Other device connected - nothing to do" << std::endl;
    }
}

void TcpServer::pcMonitorDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDisconnectedNotif();
}

void TcpServer::pcMonitorDataReceived(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDataReceivedNotif(data);
}

void TcpServer::rpiMonitorDataReceived(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorDataReceivedNotif(data);
}

void TcpServer::rpiMonitorDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorDisconnectedNotif();
}
