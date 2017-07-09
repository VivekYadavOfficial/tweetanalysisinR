#vivekyadavofficial

#sentiment scoring function
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
  
{
  
  require(plyr)
  
  require(stringr)
 
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # split into words. str_split is in the stringr package
    
    word.list = str_split(sentence, '\\s+')
    
    # sometimes a list() is one level of hierarchy too much
    
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    
    pos.matches = match(words, pos.words)
    
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    
    pos.matches = !is.na(pos.matches)
    
    neg.matches = !is.na(neg.matches)
    
    #sum all the non NA to find the score of the tweet
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
    
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  
  return(scores.df)
  
}
