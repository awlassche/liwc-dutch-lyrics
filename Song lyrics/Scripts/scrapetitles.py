import lyricsgenius as genius
import numpy as np
import pandas as pd

api = genius.Genius("33DSA0WQaKipvHXAka4Rfyj0AVQBvbjBnQBHrxRNdsTq7nrLdzFqmCC8pVCM0ITl")

def creatingsonglist(artists):
    dict_decadetest = {}
    for artist_name in artists:
        try:
            artist = api.search_artist(artist_name, max_songs=100)
            dict_decadetest[artist.name] = artist.songs
        except AttributeError:
            dict_decadetest[artist_name] = 'None'
    return dict_decadetest

if __name__ == '__main__':
    df = pd.read_csv("/Users/alielassche/documents/github/cultural-analytics/hitschanged.csv", sep=';')
    np.save('decade1.npy', creatingsonglist(df['decade1']))
    np.save('decade2.npy', creatingsonglist(df['decade2']))
    np.save('decade3.npy', creatingsonglist(df['decade3']))



# # Load
# read_dictionary = np.load('my_file.npy').item()
# print(read_dictionary['hello'])