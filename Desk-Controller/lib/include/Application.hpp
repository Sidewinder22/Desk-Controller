/**
 * @date 27.01.2024
 */

#ifndef APPLICATION_HPP_
#define APPLICATION_HPP_

#include <QObject>
#include "TcpClient.hpp"

class Application : public QObject
{
    Q_OBJECT

public:
    explicit Application(QObject *parent = nullptr);

public slots:
    void ipAndPortDataReady(const QString &ip, const uint16_t &port);

private:
    TcpClient *tcpClient_;
};

#endif // APPLICATION_HPP_
