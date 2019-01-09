import lyricsgenius as genius
# api = genius.Genius("33DSA0WQaKipvHXAka4Rfyj0AVQBvbjBnQBHrxRNdsTq7nrLdzFqmCC8pVCM0ITl")
# artist = api.search_artist("René Froger", max_songs=5)
# print(artist.song.lyrics)


import requests
import urllib2

# Format a request URI for the Genius API
search_term = 'Marco Borsato'
_URL_API = "https://api.genius.com/"
_URL_SEARCH = "search?q="
querystring = _URL_API + _URL_SEARCH + urllib2.quote(search_term)
request = urllib2.Request(querystring)
request.add_header("Authorization", "Bearer " + "33DSA0WQaKipvHXAka4Rfyj0AVQBvbjBnQBHrxRNdsTq7nrLdzFqmCC8pVCM0ITl")
request.add_header("User-Agent", "")
