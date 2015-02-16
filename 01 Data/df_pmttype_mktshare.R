library(RCurl)
library(ggplot2)
library(tidyr)
library(dplyr)

df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

df_sales %>% select(PAYMENT_TYPE) %>% ggplot(aes(x=PAYMENT_TYPE)) + geom_histogram()

# pie chart of payment type
a <- nrow(subset(df_sales, PAYMENT_TYPE == 'Mastercard'))
b <- nrow(subset(df_sales, PAYMENT_TYPE == 'Visa'))
c <- nrow(subset(df_sales, PAYMENT_TYPE == 'Amex'))
d <- nrow(subset(df_sales, PAYMENT_TYPE == 'Diners'))

slices <- c(a, b, c, d)
lbls <- c('Mastercard', 'Visa', 'Amex', 'Diners')
ppct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main='International Market Share of Payment Types')

