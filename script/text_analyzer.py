#!/usr/bin/python

# don't need since the average isn't calculated here
from __future__ import division
import sys
import os
import argparse
#import nltk
from nltk.corpus import stopwords
import json

# use: 
#      python text_analyzer.py

# Performs lexical analysis on the given text
# using the nltk (Natural language toolkit)
# 

# echos __________ to STDOUT


# only dealing with english for now
english_stopwords = stopwords.words('english')

# affinity scoreboard for common words
# scores range from -5 (negative) to 5 (positive)
# source: http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010
afinn = dict(map(lambda (k,v): (k,int(v)),
                     [ line.split('\t') for line in open(sys.path[0] + "/AFINN-111.txt") ]))

# accepts a string of text
# returns an array of tokens, with stopwords stripped
def remove_stopwords(text):
    return [w for w in text.split() if w not in english_stopwords]

# retrieve the tweets from the arguments
parser = argparse.ArgumentParser(description='')
parser.add_argument('tweets', metavar='STR', nargs='+', 
                     help='The text to parse and lexically classify')

args = parser.parse_args()

# total 
total = 0;
normalized_total = 0;
num_positive = 0;
num_negative = 0;

for t in args.tweets:
    # remove stop words
    cleansed = remove_stopwords(t.lower())

    if len(cleansed) > 0:
        # Determine if the tweet is independently positive or negative
        this_sum = sum(map(lambda word: afinn.get(word, 0), cleansed))

        # keeping track
        if this_sum > 0:
            num_positive += 1
        else:
            num_negative += 1

        # Add it to the total for the brand, which will be returned
        total += this_sum

        # average score per word in the tweet.
        this_average = this_sum / len(cleansed)

        normalized_total += this_average

# calcula the average in the parent script. Save time
# average = total / len(args.tweets)

print json.dumps({ 'score': str(total), 'normalized_score': str(normalized_total), 'num_positive': num_positive, 'num_negative': num_negative })
