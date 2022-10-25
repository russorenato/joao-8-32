library(academictwitteR)
library(dplyr)
library(googlesheets4)
googlesheets4::gs4_deauth()
googlesheets4::gs4_auth()
tweet_mar_aug_2020<-get_all_tweets(query = "João 8 32",
                                   start_tweets = "2022-09-25T00:00:00Z",
                                   end_tweets = "2022-10-08T00:00:00Z", 
                                   bearer_token = get_bearer(),
                                   data_path = "data",
                                   n = 10000,
                                   is_retweet = FALSE)
View(tweets_joao_8_32)
tweets_joao_8_32 <- tweet_mar_aug_2020
save(tweets_joao_8_32, file = 'joao_8_32_1_turno.rda')

tweets_joao_8_32_txt <- tweets_joao_8_32 |> 
  select(conversation_id:created_at)

write_sheet(tweets_joao_8_32_txt)
