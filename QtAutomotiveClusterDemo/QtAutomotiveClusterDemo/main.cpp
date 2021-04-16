
#include "stdafx.h"
#include "QtAutomotiveClusterDemo.h"
#include <QtGui/QApplication>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	QDeclarativeView view, graphView;

	QtAutomotiveClusterDemo w;
	view.rootContext()->setContextProperty("myObject", &w);							// set the myObject to communicate between qml and c++
	view.setSource(QUrl::fromLocalFile("QtAutomotiveClusterDemoDesign/qml.qml"));	// qml.qml is main page
	//view.setWindowFlags(Qt::FramelessWindowHint | Qt::Window);					// this statement can make the window frameless
	view.isFullScreen();																
	view.show();
	//w.showMaximized();
	return a.exec();
}
