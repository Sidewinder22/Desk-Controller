#include <print>
#include <QIODevice>
#include "TcpClient.hpp"

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
    , prefix_("TcpClient::")
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
    std::println("{}{} Client connected", prefix_, __func__);

    const char *hello = "Hello from Desk-Controller!";
    tcpSocket_->write(hello, qstrlen(hello));

    emit serverConnected(tcpSocket_->peerAddress().toString(), tcpSocket_->peerPort());
}

void TcpClient::disconnected()
{
    std::println("{}{} Client disconnected", prefix_, __func__);
}

void TcpClient::readyRead()
{
    auto processInfo = tcpSocket_->readAll();
    std::println("{}", processInfo.toStdString());
    emit processInfoIsReady(processInfo);
}

void TcpClient::printError(QAbstractSocket::SocketError socketError)
{
    std::println("{}{}, error: {}", prefix_, __func__, static_cast<int>(socketError));
}
