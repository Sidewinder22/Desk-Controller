#include <iostream>
#include <source_location>
#include "PCMonitor.hpp"

using sl = std::source_location;

PCMonitor::PCMonitor(QTcpSocket *socket, QObject *parent)
    : QObject(parent)
    , socket_(socket)
{
    connect(socket_, &QTcpSocket::readyRead, this, &PCMonitor::readyRead);
    connect(socket_, &QTcpSocket::disconnected, this, &PCMonitor::socketDisconnected);
}

PCMonitor::~PCMonitor()
{
    if (socket_->isOpen())
    {
        socket_->close();
    }
}

void PCMonitor::readyRead()
{
    std::cout << sl::current().function_name() << std::endl;

    auto data = socket_->readAll();
    std::cout << data.toStdString() << std::endl;

    emit dataReceivedNotif(data);
}

void PCMonitor::socketDisconnected()
{
    std::cout << sl::current().function_name() << std::endl;
    emit pcMonitorDisconnectedNotif();
}
