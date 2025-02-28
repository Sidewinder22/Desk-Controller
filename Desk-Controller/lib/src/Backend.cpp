/**
 * @date 27.01.2024
 */

#include <iostream>
#include <print>
#include <QString>
#include "Backend.hpp"

Backend::Backend(QObject *parent)
    : QObject(parent)
    , prefix_("Backend::")
    , tcpClient_(new TcpClient(parent))
{
    connect(tcpClient_, &TcpClient::serverConnected, this, &Backend::connected);
    connect(tcpClient_, &TcpClient::processInfoIsReady, this, &Backend::processInfoIsReady);

    std::println("Backend created");
    tcpClient_->connectToServer("127.0.0.1", 9999);
}

void Backend::ipAndPortDataReady(const QString &ip, const uint16_t &port)
{
    tcpClient_->connectToServer(ip, port);
}

void Backend::connected(const QString &ip, const uint16_t port)
{
    std::println("{}{}, connected to server, ip: {}, port: {}", prefix_, __func__, ip.toStdString(), port);
    emit serverConnected(ip, port);
}

void Backend::processInfoIsReady(const QString &processInfo)
{
    std::println("{}{}", prefix_, __func__);
    emit sendProcessInfo(processInfo);
}
