df_background <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from background"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
library(tidyr)
library(dplyr)

tbl_df(df_background)
#view(df_background)
df_background <- df_background %>% select(ID_NUMBER, CAFFEINE) %>% tbl_df
df_ratings <- df_ratings %>% select(ID_NUMBER, SLEEP_QUALITY) %>% tbl_df
df_join <- left_join(df_background, df_ratings, by ="ID_NUMBER")
df_join %>% select(ID_NUMBER, CAFFEINE, SLEEP_QUALITY) %>% group_by(CAFFEINE) %>% ggplot(aes(x=ID_NUMBER, y=SLEEP_QUALITY, color=CAFFEINE)) + geom_point()
