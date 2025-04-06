#include <iostream>
#include <source_location>
#include "RpiMonitor.hpp"

using sl = std::source_location;

RpiMonitor::RpiMonitor(QTcpSocket *socket, QObject *parent)
    : QObject(parent)
    , socket_(socket)
{
    connect(socket_, &QTcpSocket::readyRead, this, &RpiMonitor::readyRead);
    connect(socket_, &QTcpSocket::disconnected, this, &RpiMonitor::socketDisconnected);
}

RpiMonitor::~RpiMonitor()
{
    if (socket_->isOpen())
    {
        socket_->close();
    }
}

void RpiMonitor::readyRead()
{
    std::cout << sl::current().function_name() << std::endl;

    auto data = socket_->readAll();
    std::cout << data.toStdString() << std::endl;

    emit dataReceivedNotif(data);
}

void RpiMonitor::socketDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit rpiMonitorDisconnectedNotif();
}
