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
    void connectedToServer(const QString &ip, const uint16_t port);

private slots:
    void connected();
    void disconnected();

    void readyRead();
    void printError(QAbstractSocket::SocketError socketError);

private:
    QTcpSocket *tcpSocket_ = nullptr;
};

#endif // TCPCLIENT_H
