TARGET = harbour-tuulitunneli

CONFIG += sailfishapp

SUBDIRS = src

QT += dbus

PKGCONFIG += connman-qt5

SOURCES += src/harbour-tuulitunneli.cpp \
    src/tuulitunneli.cpp

OTHER_FILES += qml/harbour-tuulitunneli.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-tuulitunneli.changes.in \
    rpm/harbour-tuulitunneli.spec \
    rpm/harbour-tuulitunneli.yaml \
    translations/*.ts \
    harbour-tuulitunneli.desktop \
    rpm/50-harbour-tuulitunneli.pkla \
    rpm/org.messinalug.harbour.tuulitunneli.bundle.policy \
    qml/pages/FirstPage.qml \
    qml/pages/About.qml \
    src/src.pro

# to disable building translations every time, comment out the
# following CONFIG line
#CONFIG += sailfishapp_i18n
#TRANSLATIONS += translations/harbour-tuulitunneli-de.ts

HEADERS += \
    src/tuulitunneli.h

