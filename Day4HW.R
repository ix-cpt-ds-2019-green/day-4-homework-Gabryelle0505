---
  title: "4c"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
  
  ```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:
  
  ```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

library(tidyverse)
( 3+ 4) %>% 
  cos
select(iris, Sepal.Length, petal = Petal.Width)
select(iris, ends_with("Length"))
iris %>% select(Species, Petal.Width:Petal.Length)
select(iris, -Sepal.Length)
select(iris)

select(iris, -Species)
rename(iris, plant = Species)
iris %>% filter(Petal.Width < 0.4 & Sepal.Width < 3.1)
iris %>% arrange(Sepal.Length)
iris %>% arrange(desc(Sepal.Width))
iris %>% mutate(Sepal.Ration = Sepal.Length + Sepal.Length)
iris %>% transmute(Sepal.Ratio = Sepal.Length +Sepal.Length)
iris %>% group_by(Species) %>% summarise(
  min = min(Sepal.Length), min = min(Sepal.Length), avg = mean(Sepal.Length)
)
iris %>% group_by(Species) %>% summarise(
  max = max(Sepal.Length), min = min(Sepal.Length), avg = mean(Sepal.Length)
) %>% mutate(range = max - min) %>% filter(range < 3) %>% select(Species, avg)


new_airquality <- airquality %>% mutate(Ratio = Ozone/Wind)
new_airquality %>% filter(!is.na(Ratio))%>%summarise(min = min(Ratio), max = max(Ratio), sd = sd(Ratio))
airquality %>% mutate(Solar.R/Temp)
new_airquality <- airquality %>% 
  mutate(SR = Solar.R/Temp)
new_airquality %>% filter(!is.na(SR))%>% 
  summarise(min = min(SR), max = max(SR), sd = sd(SR))

library(rvest)
movies = read_html("http://www.the-numbers.com/market/2015/top-grossing-movies")
movies.table = movies %>% html_nodes("table") %>% .[[1]] %>% html_table(fill = TRUE)
movies.table <- na.omit(movies.table)
summary(movies.table)
names(movies.table)[6:7] <- c("Gross", "TicketsSold")
is.numeric(movies.table$Gross)
as.numeric(movies.table$Gross)
movies.table$Gross <- as.numeric(str_remove_all(movies.table$Gross, '[,|$]'))
movies.table %>% group_by(Genre)  %>%
  filter(!is.na(Gross))%>% 
  summarise(min = min(Gross), max = max(Gross), mean = mean(Gross))
as.numeric(c("-.1"," 2.7 ","B"))
