/**
 * @date 27.01.2024
 */

#include <iostream>
#include <QString>
#include "Backend.hpp"

Backend::Backend(QObject *parent)
    : QObject(parent)
    , tcpClient_(new TcpClient(parent))
{
    connect(tcpClient_, &TcpClient::serverConnected, this, &Backend::connected);
    connect(tcpClient_, &TcpClient::processInfoIsReady, this, &Backend::processInfoIsReady);
}

void Backend::ipAndPortDataReady(const QString &ip, const uint16_t &port)
{
    tcpClient_->connectToServer(ip, port);
}

void Backend::connected(const QString &ip, const uint16_t port)
{
    std::cout << __func__ << " connected to server, ip: " << ip.toStdString()
              << ", port; " << port << "\n";

    emit serverConnected(ip, port);
}

void Backend::processInfoIsReady(const QString &processInfo)
{
    std::cout << __func__ << "\n";

    emit sendProcessInfo(processInfo);
}
