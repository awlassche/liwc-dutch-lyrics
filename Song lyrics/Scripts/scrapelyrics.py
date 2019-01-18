import lyricsgenius as genius
import numpy as np
import pandas as pd

api = genius.Genius("33DSA0WQaKipvHXAka4Rfyj0AVQBvbjBnQBHrxRNdsTq7nrLdzFqmCC8pVCM0ITl")

def creatingsonglist(artists):
    for artist_name in artists:
        try:
            artist = api.search_artist(artist_name, max_songs=100)
            artist.save_lyrics(format_='txt')
        except AttributeError:
            continue


if __name__ == '__main__':
    df = pd.read_csv("/Users/alielassche/documents/github/cultural-analytics/decade3zonderdubbel.csv", sep=';')
    creatingsonglist(df['decade3'])