#include <iostream>
#include <print>
#include <source_location>
#include "TcpServer.hpp"

using sl = std::source_location;

TcpServer::TcpServer(quint16 port, QObject *parent)
    : server_(new QTcpServer(this))
    , port_(port)
{
    std::cout << sl::current().function_name() << ", TCP server/* is ready" << std::endl;

    connect(server_, &QTcpServer::newConnection, this, &TcpServer::newConnection);
}

TcpServer::~TcpServer()
{
    if (socket_->isOpen())
    {
        socket_->close();
    }
    if (server_->isListening())
    {
        server_->close();
    }
}

bool TcpServer::start()
{
    std::cout << sl::current().function_name() << std::endl;

    if (server_->listen(QHostAddress::LocalHost, port_))
    {
        std::cout << sl::current().function_name() << ", server's listening on port: " << port_ << std::endl;
        return true;
    }
    else
    {
        std::cout << sl::current().function_name() << ", server coulnd't start!" << std::endl;
        return false;
    }
}

void TcpServer::newConnection()
{
    std::cout << sl::current().function_name() << std::endl;

    socket_ = server_->nextPendingConnection();
    connect(socket_, &QTcpSocket::readyRead, this, &TcpServer::readyRead);

    const char *hello = "Hello from Desk-Controller!";
    socket_->write(hello, qstrlen(hello));
    socket_->flush();

    auto data = socket_->readAll();
    std::cout << data.toStdString() << std::endl;
}

void TcpServer::readyRead()
{
    std::cout << sl::current().function_name() << std::endl;

    auto data = socket_->readAll();
    emit dataReady(data);
}
