import sys
import os

from threading import Thread

#Importing the 'snepAPI' class
import snepAPI

# IMPORT MODULES
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal

# Main Window Class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)


    # Signals To Send Data
    albumsFound = Signal(list)
    singlesFound = Signal(list)

    # Function Start search
    @Slot(str)
    def search(self, whatCategory:str):

        def albums():

            albums = snepAPI.SNEP()
            self.albumsFound.emit(albums.getAlbumsList(10))

        
        def singles():
            albums = snepAPI.SNEP()
            self.singlesFound.emit(albums.getSinglesList(10))


        if whatCategory == "albums": thread = Thread(target=albums)
        else: thread = Thread(target=singles)
        
        thread.start()
    

            
# INSTACE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon("images/logo.png"))
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    # Check Exit App
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
