# Demo

This is a quick demo of a Digital instrument cluster using Qt Quick and QML language (similar to JS).
Qt Quick is great for embedded app prototyping and quick design testing without writing any C++ or Python code.

The Only C++ code is the main.cpp file which is used to load the main.qml file

- The Qt Quick creates the components (sender, receiver...) 
- The QML handles all signals interaction among all the components using property bindings 

# Requirements tools :

- Qt5.12.*
- > QtQuick 2.0
- > QtQuick.Window 2.0
- C++11 commpiler

# Usage :

After all requirement tools covered open the [demo-cluster.pro](https://github.com/afondiel/car-cluster-hmi/blob/master/demo/demo-cluster.pro) file from Qt application and you free to go ! 


