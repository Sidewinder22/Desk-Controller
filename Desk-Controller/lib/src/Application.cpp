/**
 * @date 27.01.2024
 */

#include <iostream>
#include <QString>
#include "Application.hpp"

Application::Application(QObject *parent)
    : QObject(parent)
{ }

void Application::ipAndPortDataReady(const QString &ip, const uint16_t &port)
{
    std::cout << __func__ << ", ip: " << ip.toStdString()
              << ", port: " << port << std::endl;
}
