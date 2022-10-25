library(academictwitteR)
library(dplyr)
library(googlesheets4)
googlesheets4::gs4_deauth()
googlesheets4::gs4_auth()
# Searching:
tweet_mar_aug_2020<-get_all_tweets(query = "João 8 32",
                                   start_tweets = "2022-09-25T00:00:00Z",
                                   end_tweets = "2022-10-08T00:00:00Z", 
                                   bearer_token = get_bearer(),
                                   data_path = "data",
                                   n = 10000,
                                   is_retweet = FALSE)

# Changing the name, because I originally forgot to do it:
tweets_joao_8_32 <- tweet_mar_aug_2020

# Saving a Rda file:
save(tweets_joao_8_32, file = 'joao_8_32_1_turno.rda')

# Creating a spreadsheet to be stored in google drive:
tweets_joao_8_32_txt <- tweets_joao_8_32 |>
  select(conversation_id:created_at, in_reply_to_user_id)

write_sheet(tweets_joao_8_32_txt,
            ss = "https://docs.google.com/spreadsheets/d/1zacPKjrm906FaKybf9mPOtDEklCbcYLrEdvv1Ou1JEA")

colSums(is.na(tweets_joao_8_32))
# number of tweets that are reply to another user: 4713 - 1118 = 3595