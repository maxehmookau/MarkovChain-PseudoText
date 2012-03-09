#!/usr/bin/python

#Markov Chain String Generator
import string
from random import choice
from sets import Set

def countDuplicatesInList(dupedList):
   uniqueSet = Set(item for item in dupedList)
   return [[item, dupedList.count(item)] for item in uniqueSet]

#Open input file for reading
f = open("lyrics.txt", "r")

#Read file in to string and get rid of carriage return (UNIX) and line breaks (Win)
lyrics = f.read().replace("\r", " ")
#Tokenize the words in to a list
words = lyrics.split(" ");

#Remove empty spaces
for i in words:
	if (i == "" or i == " "):
		words.remove(i)


unigrams = {}
count = 1
for i in words:
	#Dont overshoot the array
	if(count < len(words)):
		#If the word hasn't already been looked at, create
		#a new key, and add the next word as a value.
		if(unigrams.has_key(i)==0):
			unigrams[i] = [words[count]]
		else:
			#If the key already exists, append the next word as a value for k
			unigrams[i].append(words[count])
	count = count + 1


#HOORAY! It works... now generate some random text.
#First, pick a random word from words and append it to our text
data = []
currentWord = choice(words)
currentChoices = unigrams[currentWord]
text = ""
text = currentWord


for i in range(10):
	#Pick a random word from that value, the probabliity distribution is implied
	#print [currentWord, countDuplicatesInList(currentChoices)] 
	data.append([currentWord, countDuplicatesInList(currentChoices)])
	currentWord = choice(unigrams[currentWord])
	currentChoices = unigrams[currentWord]
	text= text + " " + currentWord 
	
#print data

#write text to file
f = open("words.txt", "w")
f.write(str(data))
#print the text
print text
