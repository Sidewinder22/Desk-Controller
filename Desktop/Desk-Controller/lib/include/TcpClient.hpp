#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>

class TcpClient : public QObject
{
    Q_OBJECT

public:
    explicit TcpClient(QObject *parent = nullptr);
    void connectToServer(const QString& ipAddress, uint16_t portNumber);

signals:
    void serverConnected(const QString &ip, const uint16_t port);
    void processInfoIsReady(const QString &processInfo);

private slots:
    void connected();
    void disconnected();

    void readyRead();
    void printError(QAbstractSocket::SocketError socketError);

private:
    std::string_view prefix_;
    QTcpSocket *tcpSocket_ = nullptr;
};

#endif // TCPCLIENT_H
