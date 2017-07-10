# Tweet Analysis using R
I have started this project as side-project for learning Data Science/Machine Learning using R. I am currently learning these and so to test my knowledge I am creating small side-projects. Feel free to comment, fork. If you find any bug please do report.

I have completed this project using simple sentiment scoring function. Project capabilities, therefore, can further be extended.

In this project, I have used twitteR package in R to fetch the tweet from the twitter. I have here fetched tweet using keyword "#emmawatson". You can use any keyword whether username, hashtag por simple words.

After fetching the tweets, text part has is retrieved from the tweets. Then, text is cleaned for the invalid characters. Then using R's regex cleaning global substitute function, the text is get rid of additional unwanted parts like tabs, punctuation, links etc. And then text is converted to lower case. (You should convert the tweet to text first then do all the steps. But it sometimes gives the error)

After cleaning the text, we want to create the wordcloud to have some idea of the most frequent words. So, now the corpus is created for this purpose using the tm package.

Next, using the in built function of tm package, we remove the stopwords as they are the most common words like a, the, an etc.
Now, using the wordcloud package, a wordcloud is created using the frequency of each word.

![wordcloud plot](https://github.com/VivekYadavOfficial/tweetanalysisinR/raw/master/wordcloud.PNG)

Then for sentiment analysis, I have just used simple scoring function i.e. scoring by each word. Searching for each in the positive and negative words list.

Since, this way of scoring ignores look for sentiment of individual words, it igores the context of the whole. So, many a times it gives the wrong overall sentence. e.g. "She is insanely talented." If you score this sentence by the above method, it would come out to be neutral/negative. But it is actually a highly positive sentence. So, this method is vague.

Using all function, obtain score for all the tweets. Store them in a variable.

Using this information and other information in the fetched tweets data, you can plot and communicate many useful information. Like, what is the popularity of a celebrity, say Emma Watson, around the globe. You can use the scores and respective locations in the tweet (you can directly use longitude and latitude information in the tweet or the 'location' information converted to longitude and latitude using geocode, for the purpose of plotting world map).

I have plotted two simple plots.
![Simple Plot 1](https://github.com/VivekYadavOfficial/tweetanalysisinR/raw/master/plot1.png)

![Simple Plot 2](https://github.com/VivekYadavOfficial/tweetanalysisinR/raw/master/plot.png)

Finally, a lot more can be added to the features of this projects or new feature itself.

If you think there is something wrong, please do report. Thank you.

NOTE: I haven't added the code for the final plot yet. I may update that later.

# License
Read the full license of this project [here](https://github.com/VivekYadavOfficial/tweetanalysisinR/blob/master/LICENSE)

# Thank You
