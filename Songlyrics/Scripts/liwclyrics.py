from __future__ import division
from __future__ import print_function
import argparse
import os
import re
import string

from codecs import open

import nltk
import pandas as pd

# TOKENIZER
TOKENIZER = nltk.tokenize.word_tokenize

# REMOVE PUNCTUATION
def is_punct(t):
    return re.match(f'[{string.punctuation}]+$', t) is not None

# DUTCH LIWC DATA
csv = '/Users/alielassche/documents/github/cultural-analytics/LIWC_Dutch.csv' 
csvfile = open(csv,"r", encoding='utf-8')
liwcfile = csvfile.read().split("\n")
csvfile.close()

liwc_nl_dict = dict()
for line in liwcfile:
	line = line.rsplit(",")
	liwc_nl_dict[line[0]] = line[1:]

# FUNCTIONS
def freqdict(text):

	"""This function returns a frequency dictionary of the input list. All words are transformed to lower case."""
	
	freq_dict = dict() 
	for word in text:
		word = word.lower()
		if word in freq_dict:
			freq_dict[word] += 1
		else:
			freq_dict[word] = 1
	return freq_dict

def liwc(text,output='rel',lang='nl'):

	"""This function takes a list of tokens as input and returns a dictionary with the relative (output='rel') or absolute (output='abs') frequencies for every LIWC category. This function works for languages English (lang='en') and Dutch (lang='nl')."""

# decide on relative or absolute frequencies
	if output == 'abs': #absolute frequency as output
		division = 1
	elif output == 'rel': #relative frequency as output
		division = len(text)

# make frequency dictionary of the text to diminish number of runs in further for loop
	freq_dict = freqdict(text) 	
	
	if lang == 'nl':
		liwc_dict = liwc_nl_dict
	else:
		liwc_dict = liwc_en_dict
	
	features = dict()		
	for category in liwc_dict:
		freq = 0
		for term in liwc_dict[category]:
			term = term.lower()
			if term[-1] == u"*": #'*' indicates partial words that should match the beginning of the word (include variations on words)
				for word in freq_dict:
					if word.startswith(term[:-1]):
						freq += freq_dict[word]
			else:
				if term in freq_dict:
					freq += freq_dict[term]
		features[category] = freq / division
		
	return features

def liwc_nl(text,output="rel"):
	"""This function applies Dutch liwc() on input. Output is relative frequencies of liwc categories."""
	return liwc(text,output=output,lang="nl")


if __name__ == '__main__':
	
	parser = argparse.ArgumentParser()
	parser.add_argument("--path", help="The directory to operate on")
	args = parser.parse_args()
	Rows = []
	Names = []
	
	for doc in os.scandir(args.path):
		try:
			with open(doc, 'r') as f:
				chars = f.read().replace('\n', ' ')
				words = []
				for sentence in TOKENIZER(chars, language="dutch"):
					words.extend([w.lower() for w in sentence.split() if not is_punct(w)])
			Rows.append(liwc(words,output='rel',lang='nl'))
			Names.append(doc.name)
		except UnicodeDecodeError:
			continue
		except ZeroDivisionError:
			continue
	df = pd.DataFrame(Rows)
	df.index = Names
	df.to_csv('lyrics_liwc.csv', sep='\t')