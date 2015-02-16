library(RCurl)
library(ggplot2)
df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
library(tidyr)
library(dplyr)

# mean price by payment type
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(PAYMENT_TYPE) %>% summarise(mean_price = mean(PRICE)) %>% ggplot(aes(x=PAYMENT_TYPE, y=mean_price)) + geom_point()

# mean price by country
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(COUNTRY) %>% summarise(mean_price = mean(PRICE)) %>% ggplot(aes(x=COUNTRY, y=mean_price)) + geom_point()
df_sales <- df_sales + theme(axis.text.x=element_text(angle=90, size=8, vjust=0.5)
                             
# pie chart of payment type
a <- nrow(subset(df_sales, PAYMENT_TYPE == 'Mastercard'))
b <- nrow(subset(df_sales, PAYMENT_TYPE == 'Visa'))
c <- nrow(subset(df_sales, PAYMENT_TYPE == 'Amex'))
d <- nrow(subset(df_sales, PAYMENT_TYPE == 'Diners'))

library(plotrix)
slices <- c(a, b, c, d)
lbls <- c('Mastercard', 'Visa', 'Amex', 'Diners')
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie3D(slices,labels = lbls, explode = 0.1,
    main='International Market Share of Payment Types')
