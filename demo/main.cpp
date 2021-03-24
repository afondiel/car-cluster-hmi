#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    // set High DPI to increase pixel density resolution
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // Create a Qt Graphical UI application instance : receiver==client
    QGuiApplication app(argc, argv);
    // Create a Qt Engine application instance for qml file loading : sender==server 
    QQmlApplicationEngine engine;
    // load qml file from ressource collection(.qrc)
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    // config connection to qml application
    /*
     *QObject::connect(
        const QObject *sender, 
        const char *signal, 
        const QObject *receiver, 
        const char *method, 
        Qt::ConnectionType type)
    **/
    QObject::connect(
        &engine, 
        &QQmlApplicationEngine::objectCreated,
        &app, 
        [url](QObject *obj, const QUrl &objUrl) 
        {
            // check if the connection failed
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, 
        Qt::QueuedConnection);

    // load the qml files to be sent to UI (sender)
    engine.load(url);

    // start the GUI application (receiver)
    return app.exec();
}
