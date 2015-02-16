library(RCurl)
library(ggplot2)
library(tidyr)
library(dplyr)

df_sales <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from sales"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_thc359', PASS='orcl_thc359', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# mean price by country
df_sales %>% select(PAYMENT_TYPE, COUNTRY, PRICE) %>% group_by(COUNTRY) %>% summarise(mean_price = mean(PRICE)) 

# mean price by country
mean_price <- tapply(df_sales$PRICE, df_sales$COUNTRY, mean)
COUNTRY <- factor(levels(df_sales$COUNTRY), levels=levels(df_sales$COUNTRY))
g <- qplot(COUNTRY, mean_price, geom="bar", stat="identity", fill = factor(COUNTRY))
g <- g + labs(x="Country", y="Mean Price", title="Country Expenses")
g <- g + theme(axis.text.x=element_text(angle=90, size=8, vjust=0.5))
g + theme(legend.position="none")