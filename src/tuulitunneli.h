#ifndef TUULITUNNELI_H
#define TUULITUNNELI_H


#include<QString>
#include<QObject>
#include <QtCore/QPointer>

#include<iostream>

#include<connman-qt5/networkmanager.h>
#include<connman-qt5/networktechnology.h>

class Tuulitunneli : public QObject {
    Q_OBJECT
public:
    explicit Tuulitunneli(QObject* parent = 0) : QObject(parent) {
        manager = new NetworkManager(this);
    }

   Q_INVOKABLE void stop_tunnelling();
   //Q_INVOKABLE void start_tunnelling(QString dnsServer, QString dnsPasswd);
   Q_INVOKABLE void start_tunnelling();


private:
    QPointer<NetworkManager> manager;
};

#endif // TUULITUNNELI_H
