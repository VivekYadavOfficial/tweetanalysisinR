#vivekyadavofficial

#install these required packages
install.packages(c("devtools", "rjson", "bit64", "httr"))

#install tm package for text mining
install.packages("tm")

#install wordcloud package for creating wordcloud
install.packages("wordcloud")

#install pylr and stringr packages
install.packages(c("plyr","stringr"))

#load devtools library to install package from github
library(devtools)

#install latest twitteR from github
install_github("twitteR",username="geoffjentry")

#create api key and others mentioned here by visiting dev.twitter.com
api_key <- "XXXXXXXXXXXXX"
api_secret <- "XXXXXXXXXXXXXXXX"
access_token <- "XXXXXXXXXXXXXXXXXXX"
access_token_secret <- "XXXXXXXXXXXXXXXXXXXXX"

#direct authentication
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

#user authenticated, now search and store the tweet data
t <- searchTwitter("#emmawatson", n=1000, lang="en")

#extract the text part of the tweet data
t.text <- sapply(t, function(t) t$getText())

#cleaning the text
#remove non-ASCII charaters
t.text <- sapply(t.text, function(x) iconv(x, "latin1", "ASCII", sub=""))
                 
#using gsub, replace the unwanted text parts
#replace rt from text
t.text <- gsub("rt", "", t.text)
                 
#replace usernames
t.text <- gsub("@\\w+", "", t.text)
                 
#similarly replacing tabs, blanck spaces, link etc.
t.text <- gsub("[[:punct:]]", "", t.text)
t.text <- gsub("[[:cntrl:]]", "", t.text)
t.text <- gsub("http\\w+", "", t.text)
t.text <- gsub("https\\w+", "", t.text)
t.text <- gsub("[ |\t]{2,}", "", t.text)
t.text <- gsub("^ ", "", t.text)
t.text <- gsub(" $", "", t.text)
t.text <- gsub("\\d+", "", t.text)

#convert the text to lowercase
t.text <- tolower(t.text)
                 
#now load tm package
library("tm")
                 
#create corpus of tweets
t.text.corpus <- Corpus(VectorSource(t.text))
                 
#now remove stop words
t.text.corpus <- tm_map(t.text.corpus, function(x) removeWords(x,stopwords()))
                        
#now load wordcloud package
library(wordcloud)
                        
#now create the wordcloud of the frequent words in the tweets data
wordcloud(t.text.corpus, min.freq=2, scale=c(8, 0.5), colors=brewer.pal(8, "Dark2"), random.color=TRUE, random.order=FALSE, max.words=40)

#setiment analysis
#obtain list of positive and negative words
pos <- scan(file="positive-words.txt", what="chraracter", comment=";")
neg <- scan(file="negative-words.txt", what="character", comment=";")
                        
#now load the sentiment scoring function from sentimentscore.R file
source("sentimentscore.R")
                        
#now call the function score.sentiment on tweets df
scores <- score.sentiment(t.text, pos, neg)
                        
#now we have the simple sentiment score for each tweet stored in scores. now we can, for example, plot these scores on the spatially
