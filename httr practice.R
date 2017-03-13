library(httr)
Trump_M <- GET("https://www.nytimes.com/2017/02/26/us/politics/trump-budget.html?_r=0")
status_code(Trump_M)
View(content(Trump_M, "text"))
