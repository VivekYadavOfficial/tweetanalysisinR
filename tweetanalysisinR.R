#vivekyadavofficial

#install these required packages
install.packages(c("devtools", "rjson", "bit64", "httr"))

#install tm package for text mining
install.packages("tm")

#install wordcloud package for creating wordcloud
install.packages("wordcloud")

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
t <- searchTwitter("#emmawatson")

#extract the text part of the tweet data
t.text <- sapply(t, function(t) t$getText())

#cleaning the text

#convert the text to lowercase
t.text <- tolower(t.text)
                 
#using gsub, replace the unwanted text parts
#replace rt from text
t.text <- gsub("rt", "", t.text)
                 
#replace usernames
t.text <- gsub("@\\w+", "", t.text)
                 
#similarly replacing tabs, blanck spaces, link etc.
t.text <- gsub("[[punct:]]", "", t.text)
t.text <- gsub("http\\w+", "", t.text)
t.text <- gsub("https\\w+", "", t.text)
t.text <- gsub("[ |\t]{2,}", "", t.text)
t.text <- gsub("^ ", "", t.text)
t.text <- gsub(" $", "", t.text)
                 
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
