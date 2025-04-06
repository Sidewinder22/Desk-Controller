#ifndef RPIMONITOR_HPP
#define RPIMONITOR_HPP

#include <QObject>
#include <QTcpSocket>

class RpiMonitor : public QObject
{
    Q_OBJECT

public:
    RpiMonitor(QTcpSocket *socket, QObject *parent = nullptr);
    ~RpiMonitor() override;

signals:
    void dataReceivedNotif(const QString &data);
    void rpiMonitorDisconnectedNotif();

public slots:
    void readyRead();
    void socketDisconnected();

private:
    QTcpSocket *socket_ = nullptr;
};

#endif // RPIMONITOR_HPP
