library(ggplot2)
library(ggthemes)
library(dplyr)
library(Cairo)

CairoWin()


### P1
# no warmups
dataP1R10 = read.table(".\\ass1data\\p1\\dataR10.csv", header = TRUE, sep = ',')

#dataP1R10$runs = dataP1R10$runs + 1

dataP1R10 %>%
  ggplot(aes(x = as.factor(runs), y = execution.time, group = 1)) +
  geom_point() +
  geom_line(size = 1, alpha = 0.8) +
  labs(title = "Execution Time v. Runs",
       subtitle = "w/o Warm-ups",
       x = "Runs",
       y = "Execution Time (s)") + 
  #theme_fivethirtyeight() + 
  theme(text = element_text(size = 14), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p1\\plotR10.png", width = 8, height = 4.5, type = "cairo")


# with warmups
dataP1R10W4 = read.table(".\\ass1data\\p1\\dataR10W4.csv", header = TRUE, sep = ',')

#dataP1R10W4$runs = dataP1R10W4$runs + 1

myColors = c("#000000", "#7fbd60", "#0784a3", "#6d4196")

dataP1R10$warmup = FALSE
dataP1R10W4$warmup = TRUE

dataP1merge = rbind(dataP1R10, dataP1R10W4)

dataP1merge %>%
  ggplot(aes(x = factor(runs), y = execution.time, group = warmup, color = warmup)) + 
  geom_point() +
  geom_line(size = 1, alpha = 1) + 
  labs(title = "Execution Time v. Runs",
       subtitle = "w/ and w/o Warm-ups",
       x = "Runs",
       y = "Execution Time (s)",
       color = "Warm-ups") + 
  #theme_fivethirtyeight() + 
  theme(text = element_text(size = 14), axis.title = element_text(), legend.position = "right") + 
  scale_color_manual(labels = c("w/o warm-ups", "w/ warm-ups"), values = myColors) +
  ggsave(".\\ass1data\\p1\\plotR10W4.png", width = 8, height = 4.5, type = "cairo")



### P2
# T1-20
dataT120 = read.table(".\\ass1data\\p2\\dataT1-20.csv", header = TRUE, sep = ',')

dataT120 %>%
  ggplot(aes(x = factor(ntasks), y = speedup, group = 1)) + 
  geom_point() +
  geom_line(size = 1, alpha = 0.8) + 
  ylim(0,1.5) +
  labs(title = "Speedup v. ntasks",
       subtitle = "Single Thread Executor",
       x = "ntasks",
       y = "Speedup") + 
  #theme_fivethirtyeight() + 
  theme(text = element_text(size = 14), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p2\\plotT1-20.png", width = 8, height = 4.5, type = "cairo")



### P3
#T1-20-100
dataT120100 = read.table(".\\ass1data\\p3\\dataT1-20-100.csv", header = TRUE, sep = ',')

dataT120100 %>%
  ggplot(aes(x = factor(ntasks), y = speedup, group = 1)) + 
  geom_point() +
  geom_line(size = 1, alpha = 0.8) + 
  labs(title = "Speedup v. ntasks",
       subtitle = "Cached Thread Pool",
       x = "ntasks",
       y = "Speedup") + 
  #theme_fivethirtyeight() + 
  theme(text = element_text(size = 14), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p3\\plotT1-20-100.png", width = 8, height = 4.5, type = "cairo")



### P4
#TH1-20T1-20-100
dataTH120T120100 = read.table(".\\ass1data\\p4\\dataTH1-20T1-20-100-500.csv", header = TRUE, sep = ',')

dataTH120T120100 %>%
  ggplot(aes(x = factor(ntasks), y = speedup, group = nthreads, color = nthreads)) + 
  geom_point() +
  geom_line(size = 1, alpha = 1) + 
  labs(title = "Speedup v. ntasks",
       subtitle = "Fixed Thread Pool",
       x = "ntasks",
       y = "Speedup") + 
  #theme_fivethirtyeight() + 
  #(~nthreads, nrow = 2) + 
  scale_color_gradient(low = "#DA8A67", high = "#008080", n.breaks = 5) + 
  theme(text = element_text(size = 18), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p4\\plotTH1-20T1-20-100.png", width = 18, height = 9, type = "cairo")



dataP42 = dataTH120T120100[dataTH120T120100$nthreads >= 11, ]

dataP42 %>%
  ggplot(aes(x = factor(ntasks), y = speedup, group = nthreads, color = nthreads)) + 
  geom_point() +
  geom_line(size = 1, alpha = 1) + 
  labs(title = "Speedup v. ntasks",
       subtitle = "Fixed Thread Pool for nthreads > 10",
       x = "ntasks",
       y = "Speedup") + 
  #theme_fivethirtyeight() + 
  #(~nthreads, nrow = 2) + 
  scale_color_gradient(low = "#DA8A67", high = "#008080", n.breaks = 5) + 
  theme(text = element_text(size = 18), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p4\\plotP42.png", width = 18, height = 9, type = "cairo")




# Collected of the best and the worst?












### P5
#T1-20-100
dataP5T120100 %>%
  ggplot(aes(x = factor(ntasks), y = speedup, group = 1)) + 
  geom_point() +
  geom_line(size = 1, alpha = 0.8) + 
  labs(title = "Speedup v. ntasks",
       subtitle = "Cached Thread Pool",
       x = "ntasks",
       y = "Speedup") + 
  #theme_fivethirtyeight() + 
  theme(text = element_text(size = 14), axis.title = element_text(), legend.position = "right") + 
  ggsave(".\\ass1data\\p3\\plotT1-20-100.png", width = 8, height = 4.5, type = "cairo")


#TH1-20T1-20-100















