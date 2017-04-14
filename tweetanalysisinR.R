#install these required packages
install.packages(c("devtools", "rjson", "bit64", "httr"))

#load devtools library to install package from github
library(devtools)

#install latest twitteR from github
install_github("twitteR",username="geoffjentry")

#create api key and others mentioned here by visiting dev.twitter.com
api_key <- "XXXXXXXXXXXXX"
api_secret <- "XXXXXXXXXXXXXXXX"
acces_token <- "XXXXXXXXXXXXXXXXXXX"
access_token_secret <- "XXXXXXXXXXXXXXXXXXXXX"

#direct authentication
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

#user authenticated, now you can search for tweets
searchTwitter("#emmawatson")