library(RCurl)
library(ggplot2)
library(tidyr)
library(dplyr)

df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# pie chart of payment type
a <- nrow(subset(df_sales, PAYMENT_TYPE == 'Mastercard'))
b <- nrow(subset(df_sales, PAYMENT_TYPE == 'Visa'))
c <- nrow(subset(df_sales, PAYMENT_TYPE == 'Amex'))
d <- nrow(subset(df_sales, PAYMENT_TYPE == 'Diners'))

slices <- c(a, b, c, d)
lbls <- c('Mastercard', 'Visa', 'Amex', 'Diners')
pie(slices, labels = lbls, main = 'International Market Share of Payment Types')