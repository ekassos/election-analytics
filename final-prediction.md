---
permalink: /final-prediction.html
---

# **Final Election Prediction - It all comes down to this**
#### ***Sunday, November 1, 2020***

> "_pluralitas non est ponenda sine necessitate_: plurality should not be posited without necessity."
> ~ Scholastic philosopher William of Ockham

## **Introduction**
The election is right around the corner, and we are ready to make our final prediction for the 2020 General Presidential Election. This time we use a three-step model to grapple with the idiosyncrasies of each state. Using our model, we determine the popular vote winner in each state, along with the winner of the Electoral College vote.

## Model Idiation and Walkthrough

Our model relies on three different parts:

(a) an initial prediction of candidates' popular vote share based on a weighted model of poll ranking and a decay-over-time effect for each poll's impact on the final result,

(b) a probabilistic model that predicts the popular vote share using turnout estimates based on the age of the population, the popularity of mail-in and early voting, and the COVID-19 spread in the state, and

(c) an ensemble of the two predictions to correct the probabilistic model's uncertainty and tie everything back together to produce the final result.

### Part I: Weighted Poll Rankings

As we saw in our Week 3 blog, FiveThirtyEight provides poll ratings based on each poll's Predictive Plus-Minus rating, which aims to address the variation between methodological standards score and accuracy differences between each poll and includes a "herding penalty" for pollsters with low methodology ratings. As we get much closer to Election Day and more independent (i.e., unaffiliated) or undecided voters make up their mind, polls become even more accurate in predicting the actual popular vote share. Therefore, we have decided to use the weighted model based on poll ratings to essentially "sort through" all 50 states and determine which ones we should denote as "battleground states" that require further analysis to determine the actual winner.

As we saw in our Week 3 blog, FiveThirtyEight provides poll ratings based on each poll's Predictive Plus-Minus rating, which aims to address the variation between methodological standards score and accuracy differences between each poll and includes a "herding penalty" for pollsters with low methodology ratings. As we get much closer to Election Day and more independent (i.e., unaffiliated) or undecided voters make up their mind, polls become even more accurate in predicting the actual popular vote share. Therefore, we have decided to use the weighted model based on poll ratings to essentially "sort through" all 50 states and determine which ones we should denote as "battleground states" that require further analysis to determine the actual winner.

Our model uses the poll weighting method described below. For each of the poll ratings, we use the following scoring function, where x represents each one of the poll results:
![equation](/equation.png)

We chose the specific grading scheme, resembling that of a course grading scale, because as we saw in Week 3, and shown in the graph below, where we obtained by analyzing the distribution of letter poll ratings that FiveThirtyEight provides based on each poll's Predictive Plus-Minus rating, there is a large number of polls that are rated B/C, and a few rated higher or lower. Therefore, a 2.5/4 score for a B/C-rated poll constitutes an average score, meaning that our model "awards" polls of higher quality and almost disregards low-scoring polls, as expected. To normalize all election poll results and calculate the "contribution" of each result to the final calculated popular vote share of a candidate, we divide each score over the sum of all poll scores and then multiply it with the actual poll-predicted state popular vote share:

![eq](/eq.png)

Finally, the state popular vote share calculated for a specific candidate is:

![eq](/eq2.png)

## **Prediction Results**
We calculated the following two-party electoral vote prediction: **Biden:** 322 electoral votes, **Trump:** 216 electoral votes. As we mentioned above, the prediction interval among individual states might not match that of reality, however, in the general sense, our probabilistic model predicts the electoral vote share result quite close to FiveThirtyEight’s prediction (**Biden:** 346 electoral votes, **Trump:** 192 electoral votes).

## **Look under the hood**
Feel free to test out our model using the R code and datasets, conveniently uploaded in a [ZIP file](/week-07.zip).

## **Onwards**
As we are finally coming closer to election day, we will evaluate the election prediction model while critically reviewing other researchers and political scientists’ models.
