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
    , pcMonitor_{new TcpServer(9999)}
{
    connect(pcMonitor_, &TcpServer::pcMonitorConnectedNotif, this, &Backend::pcMonitorConnected);
    connect(pcMonitor_, &TcpServer::pcMonitorDataReceivedNotif, this, &Backend::pcMonitorDataReceived);
    connect(pcMonitor_, &TcpServer::pcMonitorDisconnectedNotif, this, &Backend::pcMonitorDisconnected);

    std::cout << sl::current().function_name() << ", ready" << std::endl;

    pcMonitor_->start();
}

void Backend::pcMonitorDataReceived(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    std::cout << data.toStdString() << std::endl;

    emit pcMonitorDataReceivedNotif(data);
}

void Backend::pcMonitorConnected(const QString &ipAddress)
{
    std::cout << sl::current().function_name() << std::endl;
     emit pcMonitorConnectedNotif(ipAddress);
}

void Backend::pcMonitorDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDisconnectedNotif();
}
