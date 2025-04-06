/**
 * @date 27.01.2024
 */

#include <iostream>
#include <source_location>
#include <QString>
#include "Backend.hpp"
#include "TcpServer.hpp"

using sl = std::source_location;

Backend::Backend(QObject *parent)
    : QObject{parent}
    , tcpServer_{new TcpServer(9999)}
{
    connect(tcpServer_, &TcpServer::pcMonitorConnectedNotif, this, &Backend::pcMonitorConnected);
    connect(tcpServer_, &TcpServer::pcMonitorDataReceivedNotif, this, &Backend::pcMonitorDataReceived);
    connect(tcpServer_, &TcpServer::pcMonitorDisconnectedNotif, this, &Backend::pcMonitorDisconnected);

    connect(tcpServer_, &TcpServer::rpiMonitorConnectedNotif, this, &Backend::rpiMonitorConnected);
    connect(tcpServer_, &TcpServer::rpiMonitorDataReceivedNotif, this, &Backend::rpiMonitorDataReceived);
    connect(tcpServer_, &TcpServer::rpiMonitorDisconnectedNotif, this, &Backend::rpiMonitorDisconnected);

    std::cout << sl::current().function_name() << ", ready" << std::endl;

    tcpServer_->start();
}

void Backend::pcMonitorDataReceived(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    std::cout << data.toStdString() << std::endl;

    emit pcMonitorDataReceivedNotif(data);
}

void Backend::pcMonitorConnected(const QString &ipAddress, const QString &hostname)
{
    std::cout << sl::current().function_name() << std::endl;
     emit pcMonitorConnectedNotif(ipAddress, hostname);
}

void Backend::pcMonitorDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDisconnectedNotif();
}

void Backend::rpiMonitorConnected(const QString &ipAddress, const QString &hostname)
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorConnectedNotif(ipAddress, hostname);
}

void Backend::rpiMonitorDataReceived(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorDataReceivedNotif(data);
}

void Backend::rpiMonitorDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorDisconnectedNotif();
}
