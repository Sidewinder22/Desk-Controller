#ifndef PCMONITOR_H
#define PCMONITOR_H

#include <QObject>
#include <QTcpSocket>

class PCMonitor : public QObject
{
    Q_OBJECT

public:
    PCMonitor(QTcpSocket *socket, QObject *parent = nullptr);
    ~PCMonitor() override;

signals:
    void dataReceivedNotif(const QString &data);
    void pcMonitorDisconnectedNotif();

public slots:
    void readyRead();
    void socketDisconnected();

private:
    QTcpSocket *socket_ = nullptr;
};

#endif // PCMONITOR_H
