import lyricsgenius as genius
import pandas as pd

api = genius.Genius("XXX")

def creatingsonglist(artists):
    for artist_name in artists:
        try:
            artist = api.search_artist(artist_name, max_songs=100)
            artist.save_lyrics(format_='txt')
        except AttributeError:
            continue


if __name__ == '__main__':
    df = pd.read_csv("../Data/Hits.csv", sep=';')
    creatingsonglist(df['decade3'])