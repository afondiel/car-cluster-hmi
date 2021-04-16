/********************************************************************************
** Form generated from reading UI file 'QtAutomotiveClusterDemo.ui'
**
** Created: Mon Mar 24 10:50:01 2014
**      by: Qt User Interface Compiler version 4.8.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_QTAUTOMOTIVECLUSTERDEMO_H
#define UI_QTAUTOMOTIVECLUSTERDEMO_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHeaderView>
#include <QtGui/QMainWindow>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_QtAutomotiveClusterDemoClass
{
public:
    QAction *actionExit;
    QWidget *centralWidget;

    void setupUi(QMainWindow *QtAutomotiveClusterDemoClass)
    {
        if (QtAutomotiveClusterDemoClass->objectName().isEmpty())
            QtAutomotiveClusterDemoClass->setObjectName(QString::fromUtf8("QtAutomotiveClusterDemoClass"));
        QtAutomotiveClusterDemoClass->setEnabled(false);
        QtAutomotiveClusterDemoClass->resize(600, 400);
        actionExit = new QAction(QtAutomotiveClusterDemoClass);
        actionExit->setObjectName(QString::fromUtf8("actionExit"));
        centralWidget = new QWidget(QtAutomotiveClusterDemoClass);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        QtAutomotiveClusterDemoClass->setCentralWidget(centralWidget);

        retranslateUi(QtAutomotiveClusterDemoClass);
        QObject::connect(actionExit, SIGNAL(triggered()), QtAutomotiveClusterDemoClass, SLOT(close()));

        QMetaObject::connectSlotsByName(QtAutomotiveClusterDemoClass);
    } // setupUi

    void retranslateUi(QMainWindow *QtAutomotiveClusterDemoClass)
    {
        QtAutomotiveClusterDemoClass->setWindowTitle(QApplication::translate("QtAutomotiveClusterDemoClass", "QtAutomotiveClusterDemo", 0, QApplication::UnicodeUTF8));
        actionExit->setText(QApplication::translate("QtAutomotiveClusterDemoClass", "E&xit", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class QtAutomotiveClusterDemoClass: public Ui_QtAutomotiveClusterDemoClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_QTAUTOMOTIVECLUSTERDEMO_H
