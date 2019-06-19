sms_spam_df<-read.csv("C:/Users/AKHIL/Desktop/New folder/spam.csv")
View(sms_spam_df)
dim(sms_spam_df)

library(tm)
library(stringr)
library(wordcloud)
library(SnowballC)

sms_spam_df<-sms_spam_df[,c(1,2)]
View(sms_spam_df)
dim(sms_spam_df)


colnames(sms_spam_df)<-c("type","text")
View(sms_spam_df)

sms_corpus<-Corpus(VectorSource(sms_spam_df$text))
inspect(sms_corpus[1:3])


clean_corpus<-tm_map(sms_corpus,tolower)
clean_corpus<-tm_map(clean_corpus,removeNumbers)
clean_corpus<-tm_map(clean_corpus,removeWords,stopwords())
clean_corpus<-tm_map(clean_corpus,stripWhitespace)
clean_corpus<-tm_map(clean_corpus,removePunctuation)
inspect(clean_corpus[1:3])


sms_dtm<-DocumentTermMatrix((clean_corpus))    ####
sms_dtm



############################train and test##############################33333333
sms_raw_train<-sms_spam_df[1:5000,];dim(sms_raw_train)
sms_raw_test<-sms_spam_df[5000:6778,]

sms_dtm_train<-sms_dtm[1:5000,]

sms_corpus_train<-clean_corpus[1:5000] ####later used to build final train set
sms_corpus_test<-clean_corpus[5000:6778]###later used to build final test set




#########################################################################################
five_times_words<-findFreqTerms(sms_dtm_train,5)##only those words which occur 5 times
five_times_words
