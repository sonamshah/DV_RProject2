library(RCurl)
library(ggplot2)
df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
library(tidyr)
library(dplyr)

# mean price by payment type
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(PAYMENT_TYPE) %>% summarise(mean_price = mean(PRICE)) %>% ggplot(aes(x=PAYMENT_TYPE, y=mean_price)) + geom_point()

# mean price by country
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(COUNTRY) %>% summarise(mean_price = mean(PRICE)) %>% ggplot(aes(x=COUNTRY, y=mean_price)) + geom_point()
# df_sales <- df_sales + theme(axis.text.x=element_text(angle=90, size=8, vjust=0.5)
                             
# df_sales %>% select(PAYMENT_TYPE) %>% group_by(PAYMENT_TYPE) %>% summarise(count_pmt = count(PAYMENT_TYPE)) %>% ggplot(aes(x=PAYMENT_TYPE,y=count_pmt/999*100,color=color)) +geom_point()

require(tidyr)
require(dplyr)
library(ggplot2)
tbl_df(diamonds)
View(diamonds)

diamonds %>% select(cut) %>% group_by(cut) %>% summarise(count_pmt = count(cut)) 

# dim(diamonds)
# names(diamonds)

# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")
