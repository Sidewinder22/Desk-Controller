#include <QIODevice>
#include "TcpClient.hpp"

#include <iostream>

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
    , tcpSocket_(new QTcpSocket(this))
{
    connect(tcpSocket_, &QAbstractSocket::connected, this, &TcpClient::connected);
    connect(tcpSocket_, &QAbstractSocket::disconnected, this, &TcpClient::disconnected);
    connect(tcpSocket_, &QAbstractSocket::readyRead, this, &TcpClient::readyRead);
    connect(tcpSocket_, &QAbstractSocket::errorOccurred, this, &TcpClient::printError);
}

void TcpClient::connectToServer(const QString& ipAddress, uint16_t portNumber)
{
    tcpSocket_->connectToHost(ipAddress, portNumber);
}

void TcpClient::connected()
{
    std::cout << "Connected" << std::endl;

    const char *hello = "Hello from Desk-Controller!";
    tcpSocket_->write(hello, qstrlen(hello));

    emit connectedToServer(tcpSocket_->peerAddress().toString(), tcpSocket_->peerPort());
}

void TcpClient::disconnected()
{
    std::cout << "Disconnected" << std::endl;
}

void TcpClient::readyRead()
{
    std::cout << "message: " << tcpSocket_->readAll().toStdString() << std::endl;
}

void TcpClient::printError(QAbstractSocket::SocketError socketError)
{
    std::cout << __func__ << ", error: " << socketError << std::endl;
}
