#ifndef QtAutomotiveClusterDemo_H
#define QtAutomotiveClusterDemo_H

#include <QtGui/QMainWindow>
#include "ui_QtAutomotiveClusterDemo.h"
#include <QDeclarativeView>
 #include <QDeclarativeContext>
#include <QWidget>
#include <QLayout>
#include <QObject>

class QSvgRenderer;
class QtSvgPixmapCache; 

class QtAutomotiveClusterDemo : public QMainWindow 
{
	Q_OBJECT

public:
	QtAutomotiveClusterDemo(QWidget *parent = 0, Qt::WFlags flags = 0);
	~QtAutomotiveClusterDemo();

public slots:
	void buttonSlot(int signal);

private:
	Ui::QtAutomotiveClusterDemoClass ui;
};

#endif // QtAutomotiveClusterDemo_H
