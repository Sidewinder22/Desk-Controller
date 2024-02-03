/**
 * @date 27.01.2024
 */

#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "TcpClient.hpp"

class Backend : public QObject
{
    Q_OBJECT

public:
    explicit Backend(QObject *parent = nullptr);

signals:
    void serverConnected(const QString &ip, const uint16_t port);

public slots:
    void ipAndPortDataReady(const QString &ip, const uint16_t &port);
    void connected(const QString &ip, const uint16_t port);

private:
    TcpClient *tcpClient_;
};

#endif // BACKEND_H
