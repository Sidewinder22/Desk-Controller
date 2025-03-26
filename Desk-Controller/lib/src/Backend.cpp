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
    connect(pcMonitor_, &TcpServer::dataReady, this, &Backend::dataReady);
    connect(pcMonitor_, &TcpServer::tcpSocketConnected, this, &Backend::pcMonitorConnectedSlot);
    connect(pcMonitor_, &TcpServer::tcpSocketDisconnected, this, &Backend::pcMonitorDisconnected);

    std::cout << sl::current().function_name() << ", ready" << std::endl;

    pcMonitor_->start();
}

void Backend::dataReady(const QString &data)
{
    std::cout << sl::current().function_name() << std::endl;
    std::cout << data.toStdString() << std::endl;

    emit loadDataReceived(data);
}

void Backend::pcMonitorConnectedSlot(const QString &ipAddress)
{
    std::cout << sl::current().function_name() << std::endl;
     emit pcMonitorConnected(ipAddress);
}

void Backend::pcMonitorDisconnectedSlot()
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDisconnected();
}
