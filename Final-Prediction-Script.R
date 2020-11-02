library(tidyverse)
library(ggplot2)
library(dplyr)

polls_data <- read_csv("president_polls.csv")
poll_results <- data.frame(state = character(), pred_DEM = double(), pred_REP = double(), differ = double())
for (state_name in state.name) {
  print(state_name)

dem_dat <- polls_data %>% 
  filter(candidate_party == "DEM") %>%
  filter(state == state_name)

dem_dat <- dem_dat %>% 
  mutate(scaled_pct = ((((fte_num_grade/sum(fte_num_grade)) * pct)*0.8)+(0.2*((exp(-0.2*as.integer(days_till_election))/sum(exp(-0.2*as.integer(days_till_election)))* pct)))))

DEM <- sum(dem_dat$scaled_pct)

rep_dat <- polls_data %>% 
  filter(candidate_party == "REP") %>%
  filter(state == state_name)

rep_dat <- rep_dat %>% 
  mutate(scaled_pct = ((((fte_num_grade/sum(fte_num_grade)) * pct)*0.6)+(0.4*((exp(-0.2*as.integer(days_till_election))/sum(exp(-0.2*as.integer(days_till_election)))* pct)))))

REP <- sum(rep_dat$scaled_pct)

poll_results <- rbind(poll_results, c(state = state_name, pred_DEM = DEM, pred_REP = REP, differ = abs(REP-DEM)))
}

## Get relevant data
vep_data <- read_csv("vep_2016.csv")
df <- vep_data %>%
  filter(state == "Ohio")

VEP_PA_2020 <- as.integer(df$VEP)

PA_R <- poll_pvstate_vep_df %>% filter(state=="Ohio", party=="republican")
PA_D <- poll_pvstate_vep_df %>% filter(state=="Ohio", party=="democrat")

## Fit D and R models
PA_R_glm <- glm(cbind(R, VEP-R) ~ avg_poll, PA_R, family = binomial)
PA_D_glm <- glm(cbind(D, VEP-D) ~ avg_poll, PA_D, family = binomial)

## Get predicted draw probabilities for D and R
prob_Rvote_PA_2020 <- predict(PA_R_glm, newdata = data.frame(avg_poll=50.29), type="response")[[1]]
prob_Dvote_PA_2020 <- predict(PA_D_glm, newdata = data.frame(avg_poll=45.66), type="response")[[1]]

turnout <- VEP_PA_2020 * df$turnout_2016 * (1 - 0.2 * df$older_than_65 + 0.4 * (df$total_early +(df$cases_100K_7day/200))- 0.3 * df$cases_100K_7day/200)

## Get predicted distribution of draws from the population
sim_Rvotes_PA_2020 <- rbinom(n = 100000, size = as.integer(rnorm(n = 100000, mean=turnout, sd=turnout*0.02)), prob = rnorm(100000, mean=prob_Rvote_PA_2020, sd=0.001))
sim_Dvotes_PA_2020 <- rbinom(n = 100000, size = as.integer(rnorm(n = 100000, mean=turnout, sd=turnout*0.02)), prob = rnorm(100000, mean=prob_Dvote_PA_2020, sd=0.001))

## Simulating a distribution of election results: Biden PA PV
png("OH_D.png")
hist((sim_Dvotes_PA_2020/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100, xlab="predicted turnout draws for Biden\nfrom 100,000 binomial process simulations", breaks=100)
dev.off()

## Simulating a distribution of election results: Trump PA PV
png("OH_R.png")
hist((sim_Rvotes_PA_2020/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100, xlab="predicted turnout draws for Trump\nfrom 100,000 binomial process simulations", breaks=100)
dev.off()

## Simulating a distribution of election results: Biden win margin
sim_elxns_PA_2020 <- ((sim_Dvotes_PA_2020-sim_Rvotes_PA_2020)/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100
hist(sim_elxns_PA_2020, xlab="predicted draws of Biden win margin (% pts)\nfrom 100,000 binomial process simulations")

sim_elxns_state_2020 <- ((sim_Dvotes_PA_2020-sim_Rvotes_PA_2020)/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100
png("OH_f.png")
hist(sim_elxns_state_2020, main = "OH", xlab="predicted draws of Biden win margin (% pts)\nfrom 100,000 binomial process simulations")
dev.off()

mean(sim_elxns_state_2020)
mean((sim_Rvotes_PA_2020/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100)
mean((sim_Dvotes_PA_2020/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020))*100)

final <- read_csv("final_prediction.csv")

states_map <- usmap::us_map()
head(states_map)

nah <- plot_usmap(data = final, regions = "states", values = "deff_2", labels = TRUE,
                label_color = "black") +
  ggtitle("Margin of popular vote victory in every state\nbased on our explorative 2020 election prediction") +
  scale_fill_gradient2(
    high = "blue", 
    mid = "white",
    low = "red", 
    breaks = c(-6,-3,0,3,6),
    limits = c(-7,7),
    name = "Margin of popular\nvote win"
  ) +
  theme_void()+
  theme(strip.text = element_text(size = 12),
        plot.title   = element_text(size = 18, family = "Palatino", face = "bold"))


ggsave("name3.png", plot = nah, height = 6, width = 10)

