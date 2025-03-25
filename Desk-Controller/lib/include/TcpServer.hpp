#ifndef TCPSERVER_HPP
#define TCPSERVER_HPP

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class TcpServer : public QObject
{
    Q_OBJECT

public:
    TcpServer(quint16 port, QObject *parent = nullptr);
    virtual ~TcpServer();
    bool start();

signals:
    void dataReady(const QString &data);

public slots:
    void newConnection();
    void readyRead();

private:
    QTcpServer *server_ = nullptr;
    QTcpSocket *socket_ = nullptr;
    quint16 port_;
};

#endif // TCPSERVER_HPP
