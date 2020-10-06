---
permalink: /week-4.html
---

# **Week 4 - Trump and Incumbency**
#### ***Monday, October 6, 2020***

> "Incumbency adds a layer of advantage on top of this party dominance. But rather than foster an environment in which members of Congress feel free to buck popular sentiment and wrestle seriously with the problems confronting the country, it reinforces the ideological divide between the parties."
― Thomas E. Mann, Political Scientist

## **Introduction**
This week, we make a new linear regression prediction model based on the GDP Quarter Growth we saw in Week 2, and the net approval rating for each incumbent party candidate and use those to predict the popular vote share.

## **Election Poll Rankings**
We wanted to examine how incumbency and the “time for change” attitude of the electorate plays into the popular vote shares for the presidential candidates. Since the presidential candidate is seen as the representative of the party, which adapts its platform to empower their campaign, feelings of anger or wariness regarding the party be can be personified into the presidential nominee. This correlation attitude might affect the candidates of incumbent parties in a negative sense, especially when their own approval ratings are not especially high. Using linear regression, we obtain the following model:

![equation](/eqw42.png)

### _Model Evaluation_

To begin with, we evaluated our model by comparing the predicted popular vote share for the incumbent party’s candidate with the true share in that election year. We observe, unfortunately, that the predicted and true results very vastly.

![equation](/graph1.png)

As we were not satisfied with the predictive power of our model, we turn to the two-party popular vote share. Using the process described above, we obtained the following predictive model for the two-party popular vote share:

![equation](/eqw4.png)

Once again, we graph the difference between the true and predicted two-party vote share of the candidate nominated by the incumbent party. It is interesting to observe how well the model predicts the last few elections, as signified by the recent election year points being extremely close to the diagonal “perfect fit” line. However, we observe earlier years are not well-predicted by our model. 

![equation](/graph2.png)

We explored our models using ‘leave-one-out (cross) validation’ to decide which model is best to move forward with for our final election prediction. The method uses all but one of the election years to estimate the model and its performance is subsequently tested on the one election year left out. We performed a leave-one-out validation for each of the election years, and got the following results for the mean error rate (difference between true and predicted popular vote share):

General Popular Vote             |  Two-Party Popular Vote
:-------------------------:|:-------------------------:
6.598534|  -5.062036e-15

Seeing the stark difference, we choose to move forward with the two-party popular vote share. In that way, we can also predict the two-party popular vote share of President Trump’s challenger in the upcoming election.

## **Prediction Results**
We use the FiveThirtyEight data gathered from the recent popularity/unpopularity opinions to predict the average net approval ratings. Mr. Trump has a `-10.6%` disapproval rating, and the GDP growth was recorded using methods presented in Week’s 2 blog. We calculated the following two-party popular vote prediction:

**Biden: `47.99%`, Trump: `52.01%`**

## **Look under the hood**
Feel free to test out our model using the R code and datasets, conveniently uploaded in a [ZIP file](/week4.zip).

## **Onwards**
As we are looking forward to another week and coming closer to election day, we will keep revising and updating our own election prediction models while critically reviewing other researchers and political scientists' models.
