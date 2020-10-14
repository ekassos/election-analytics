---
permalink: /week-5.html
---

# **Week 5 - Probability and Electoral Votes**
#### ***Monday, October 12, 2020***

> "The most important office, and the one which all of us can and should fill, is that of private citizen."
― Louis Brandeis, Former Associate Justice of the Supreme Court of the United States

## **Introduction**
This week, we make a new linear regression prediction model based on the GDP Quarter Growth we saw in Week 2, and the net approval rating for each incumbent party candidate and use those to predict the popular vote share.

## **Simulating a distribution of election results**
The vote total for any particular candidate in any election has a fixed set of
possible values: 0 − VEP, where VEP is the voter eligible population for the
election in question. Let’s say we’re interested in the popular vote total for
Democrat candidates in some state s, DemPVs. Thus, the election outcome for
Democrats in state s is some draw of voters from the voter-eligible population
(VEPs) turning out to vote Democrat. We call this process of draws from a population (often called successes from a number of trials) a binomial process.


### _Model Evaluation_

To begin with, we evaluated our model by comparing the predicted popular vote share for the incumbent party’s candidate with the true share in that election year. We observe, unfortunately, that the predicted and true results very vastly.

![equation](/graph1.png)

As we were not satisfied with the predictive power of our model, we turn to the two-party popular vote share. Using the process described above, we obtained the following predictive model for the two-party popular vote share:

![equation](/eqw4.png)

Once again, we graph the difference between the true and predicted two-party vote share of the candidate nominated by the incumbent party. It is interesting to observe how well the model predicts the last few elections, as signified by the recent election year points being extremely close to the diagonal “perfect fit” line. However, we observe earlier years are not well-predicted by our model. 

![equation](/graph2.png)

We explored our models using ‘leave-one-out (cross) validation’ to decide which model is best to move forward with for our final election prediction. The method uses all but one of the election years to estimate the model and its performance is subsequently tested on the one election year left out. We performed a leave-one-out validation for each of the election years, and got the following results for the mean error rate (difference between true and predicted popular vote share):

<img src="/state_plot2.png" width="300%"> | <img src="/state_plot3.png" width="300%">  | <img src="/state_plot4.png" width="300%">  |
:-------------------------:|:-------------------------:|:-------------------------:
<img src="/state_plot5.png" width="300%"> | <img src="/state_plot6.png" width="300%">  | <img src="/state_plot7.png" width="300%">  |
<img src="/state_plot8.png" width="300%"> | <img src="/state_plot9.png" width="300%">  | <img src="/state_plot10.png" width="300%">  |
<img src="/state_plot11.png" width="300%"> | <img src="/state_plot12.png" width="300%">  | <img src="/state_plot13.png" width="300%">  |
<img src="/state_plot14.png" width="300%"> | <img src="/state_plot15.png" width="300%">  | <img src="/state_plot16.png" width="300%">  |
<img src="/state_plot17.png" width="300%"> | <img src="/state_plot18.png" width="300%">  | <img src="/state_plot19.png" width="300%">  |
<img src="/state_plot20.png" width="300%"> | <img src="/state_plot21.png" width="300%">  | <img src="/state_plot22.png" width="300%">  |
<img src="/state_plot23.png" width="300%"> | <img src="/state_plot24.png" width="300%">  | <img src="/state_plot25.png" width="300%">  |
<img src="/state_plot26.png" width="300%"> | <img src="/state_plot27.png" width="300%">  | <img src="/state_plot28.png" width="300%">  |
<img src="/state_plot29.png" width="300%"> | <img src="/state_plot30.png" width="300%">  | <img src="/state_plot31.png" width="300%">  |
<img src="/state_plot32.png" width="300%"> | <img src="/state_plot33.png" width="300%">  | <img src="/state_plot34.png" width="300%">  |
<img src="/state_plot35.png" width="300%"> | <img src="/state_plot36.png" width="300%">  | <img src="/state_plot37.png" width="300%">  |
<img src="/state_plot38.png" width="300%"> | <img src="/state_plot39.png" width="300%">  | <img src="/state_plot40.png" width="300%">  |
<img src="/state_plot41.png" width="300%"> | <img src="/state_plot42.png" width="300%">  | <img src="/state_plot43.png" width="300%">  |
<img src="/state_plot44.png" width="300%"> | <img src="/state_plot45.png" width="300%">  | <img src="/state_plot46.png" width="300%">  |
<img src="/state_plot47.png" width="300%"> | <img src="/state_plot48.png" width="300%">  | <img src="/state_plot49.png" width="300%">  |
<img src="/state_plot50.png" width="300%"> | <img src="/state_plot51.png" width="300%">  | <img src="/state_plot52.png" width="300%">  |

### _Model Evaluation_
Our model presents some significant outliers, including the 

## **Prediction Results**
We calculated the following two-party electoral vote prediction: **Biden:** 322 electoral votes, **Trump:** 216 electoral votes. As we mentioned above, the prediction interval among individual states might not match that of reality, however, 

## **Look under the hood**
Feel free to test out our model using the R code and datasets, conveniently uploaded in a [ZIP file](/week-5.zip).

## **Onwards**
As we are looking forward to another week and coming closer to election day, we will evaluate the previously defined and fitted election prediction models while critically reviewing other researchers and political scientists' models.
