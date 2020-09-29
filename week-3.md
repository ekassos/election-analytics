---
permalink: /week-3.html
---

# **Week 3 - Grading Election Polls**
#### ***Monday, September 28, 2020***

> "I always lose the election in the polls, and I always win it on election day."
― Benjamin Netanyahu, Prime Minister of Israel

## **Introduction**
This week, we make a new prediction model by comparing FiveThirtyEight's [election poll rankings](https://github.com/fivethirtyeight/data/tree/master/pollster-ratings). In particular, we will make a national popular vote prediction model based on the scaled results of each poll, influenced by FiveThirtyEight's election poll rankings.

## **Election Poll Rankings**
### _Selecting the right quarter_

![FTE](/538.png)

### _Building a model based on poll ratings_

![equation](/equation.png)

![eq](/eq.png)

## **Prediction Results**
Using the data provided from the 2020 election polls, and our model formula for scaling the popular vote share of each poll result to match the rating provided by FiveThirtyEight, we find the following popular vote prediction:

**Biden: `49.17621%`, Trump: `41.94046%`**

## **Look under the hood**
Feel free to test out our model using the R code and datasets, conveniently uploaded in a [ZIP file](/week-3.zip).

## **Onwards**
As we are looking forward to another week and coming closer to election day, we will start revising and updating our own election prediction models while critically reviewing other researchers and political scientists' models. 
