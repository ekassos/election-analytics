library(tidyverse)
library(ggplot2)
library(geofacet) ## map-shaped grid of ggplots

install.packages("ggthemes") # Install 
library(scales)

library(ggthemes) # Load

data <- read_csv("Final Narrative.csv")

ggplot(data, aes(x=bidenPRC, y=senatePRC)) + 
  geom_point(size=0.1) +
  geom_abline(intercept = 0, slope = 1, color='olivedrab4', size=1.5) +
  geom_abline(intercept = -4.8, slope = 0.87, color='firebrick3', size=1.5) +
  geom_abline(intercept = -0.7, slope = 0.35, color='royalblue3', size=1.5) +
  xlab("Joe Biden's county popular vote share") +
  ylab("Democratic Senate candidate\ncounty popular vote share") +
  ggtitle("Relationship between Joe Biden's popular vote share\nand Democratic Senate candidate's popular vote result\n(in each contested county, November 3 General Election)") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))

focused <- data %>% 
  filter(total_votes <= 100000) %>% 
  select(difference, total_votes)

focused2 <- data %>% 
  filter(total_votes <= 20000) %>% 
  select(difference, total_votes)

focused3 <- data %>% 
  filter(total_votes > 100000) %>% 
  select(difference, total_votes)

ggplot(focused, aes(x=total_votes, y=difference)) + 
  geom_point(size=0.5) +
  ylab("Second quarter GDP growth") +
  scale_x_continuous(name="Fluorescent intensity/arbitrary units", labels = comma)+
  ggtitle("Difference between Joe Biden's popular vote share and\nDemocratic Senate candidate popular vote share\nbased on county total vote count") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))

ggplot(data, aes(x=total_votes, y=difference)) + 
  geom_point(size=0.5) +
  ylab("Difference between Joe Biden's popular\nvote share and Democratic Senate\ncandidate popular vote share in county") +
  scale_x_continuous(name="County total votes count", labels = comma)+
  ggtitle("Difference between Joe Biden's popular vote share and\nDemocratic Senate candidate popular vote share\nbased on county total vote count") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))

ggplot(focused, aes(x=total_votes, y=difference)) + 
  geom_point(size=0.5) +
  ylab("Difference between Joe Biden's popular\nvote share and Democratic Senate\ncandidate popular vote share in county") +
  scale_x_continuous(name="County total votes count", labels = comma)+
  labs(subtitle = "(<= 100,000 vote-count subset)") +
  ggtitle("Difference between Joe Biden's popular vote share and\nDemocratic Senate candidate popular vote share\nbased on county total vote count") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.subtitle   = element_text(size = 16, family = "Palatino", face = "italic"),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))

ggplot(focused2, aes(x=total_votes, y=difference)) + 
  geom_point(size=0.5) +
  ylab("Difference between Joe Biden's popular\nvote share and Democratic Senate\ncandidate popular vote share in county") +
  scale_x_continuous(name="County total votes count", labels = comma)+
  labs(subtitle = "(<= 20,000 vote-count subset)") +
  ggtitle("Difference between Joe Biden's popular vote share and\nDemocratic Senate candidate popular vote share\nbased on county total vote count") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.subtitle   = element_text(size = 16, family = "Palatino", face = "italic"),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))

ggplot(focused3, aes(x=total_votes, y=difference)) + 
  geom_point(size=0.5) +
  ylab("Difference between Joe Biden's popular\nvote share and Democratic Senate\ncandidate popular vote share in county") +
  scale_x_continuous(name="County total votes count", labels = comma)+
  labs(subtitle = "(> 100,000 vote-count subset)") +
  ggtitle("Difference between Joe Biden's popular vote share and\nDemocratic Senate candidate popular vote share\nbased on county total vote count") +
  theme_stata() + scale_fill_stata() +
  theme(strip.text = element_text(size = 14),
        plot.subtitle   = element_text(size = 16, family = "Palatino", face = "italic"),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"),
        axis.title.x = element_text(size = 13, face = "bold"),
        axis.text.x = element_text(size = 12, hjust = 0.7),
        axis.title.y = element_text(size = 13, face = "bold"))
