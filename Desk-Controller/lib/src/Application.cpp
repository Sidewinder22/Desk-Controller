/**
 * @date 27.01.2024
 */

#include <QString>
#include "Application.hpp"

Application::Application(QObject *parent)
    : QObject(parent)
    , tcpClient_(new TcpClient(parent))
{ }

void Application::ipAndPortDataReady(const QString &ip, const uint16_t &port)
{
    tcpClient_->connectToServer(ip, port);
}
