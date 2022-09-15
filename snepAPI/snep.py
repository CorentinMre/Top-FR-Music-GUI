
import requests
from bs4 import BeautifulSoup

class SNEP:
    def __init__(self) -> None:

        self.session = requests.Session()
        self.session.headers = {"User-Agent": "Modzilla/5.0"}

        self.singlesList = []
        self.albumsList = []
    
    def getSinglesList(self, nbRang) -> list:

        self.__getSingles(nbRang)
        return self.singlesList
    
    def getAlbumsList(self, nbRang) -> list:

        self.__getAlbums(nbRang)
        return self.albumsList

    def __getInfos(self, url, nbRang) -> list :

        req = self.session.get(url)
        soup = BeautifulSoup(req.text, "html.parser")
        Top200 = soup.find_all("div", {"class": "item"})
        musicList = []

        for music in range(200 if nbRang > 200 else nbRang):
            musicList.append({"rang": Top200[music].find("div", {"class":"rang"}).text,
                                        "coverUrl":Top200[music].find("div", {"class": "cover"})["style"].replace("background:url(","").replace(")",""),
                                        "titre":Top200[music].find("div", {"class": "titre"}).text,
                                        "artiste":Top200[music].find("div", {"class":"artiste"}).text,
                                        "editeur":Top200[music].find("div", {"class": "editeur"}).text,
                                        "rangPrecedent": "N/A" if not Top200[music].find("div", {"class": "rang_precedent"}) else Top200[music].find("div", {"class": "rang_precedent"}).strong.text})
        return musicList


    def __getSingles(self, nbRand):

        self.singlesList = self.__getInfos("https://snepmusique.com/les-tops/le-top-de-la-semaine/top-albums/?categorie=Top Singles", nbRand)

    def __getAlbums(self, nbRang):

        self.albumsList = self.__getInfos("https://snepmusique.com/les-tops/le-top-de-la-semaine/top-albums/", nbRang)

if __name__ == "__main__":

    snep = SNEP()

    singlesList = snep.getSinglesList(10)
    print(singlesList)

    albumsList = snep.getAlbumsList(10)
    print(albumsList)
    