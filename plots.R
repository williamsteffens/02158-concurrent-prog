library(ggplot2)
library(ggthemes)
library(dplyr)
library(Cairo)

CairoWin()

data = read.table("C:\\Users\\William\\Desktop\\02158-concurrent-prog\\ass1data\\p1\\dataP1.csv", header = TRUE, sep=',')

data %>%
  ggplot(aes(run, execution.time)) + 
    geom_line(size = 1.5, alpha = 0.8) + 
    labs(title = "No Warmups",
         subtitle = "this is a subtitle",
         x = "Runs",
         y = "Execution Time") + 
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(), legend.position = "right") + 
    ggsave("cario.png", type = "cairo")
