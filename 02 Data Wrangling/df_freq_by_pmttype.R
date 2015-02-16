library(RCurl)
library(ggplot2)
library(tidyr)
library(dplyr)

df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

#freq by pmt type
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(PAYMENT_TYPE) %>% count(PAYMENT_TYPE)

#g <- ggplot(df_sales, aes(PAYMENT_TYPE, fill=COUNTRY)) + geom_bar()
#g + geom_bar(width=.7) + theme(legend.position="none") + labs(x="Payment Type", y="Count", title="Frequency #of Payment Type")

qplot(factor(PAYMENT_TYPE), data=df_sales, geom="bar") + coord_flip() + facet_wrap(~COUNTRY) + labs(x="Count", y="Payment Type", title="Frequency of Payment Type By Country") + theme(axis.text.x=element_text(angle=90, size=8, vjust=0.5))
