library(RCurl)
library(ggplot2)
df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
library(tidyr)
library(dplyr)

df_sales %>% group_by(PAYMENT_TYPE) %>% select(PAYMENT_TYPE, COUNTRY)
# ggplot(aes(x=PAYMENT_TYPE, y=COUNTRY)) + geom_point()
