---
permalink: /week-3.html
---

# **Week 3 - Pennies and Quarters**
#### ***Monday, September 28, 2020***

> "To preserve our independence we must not let our rulers load us with perpetual debt. We must make our election between economy and liberty or profusion and servitude."
― Thomas Jefferson

## **Introduction**
This week, we start creating our election prediction model by comparing economy data with popular vote results. In particular, we will make and compare a national popular vote prediction model based on the second or third-quarter GDP growth percentage of election years.

## **Quarter Economics: Predicting the election result based on GDP growth**
### _Selecting the right quarter_
We begin by looking at the differences between election prediction models that use the percent growth of the Gross Domestic Product in the second or third quarters to predict the popular vote result. To do so, we use linear regression to create a predictive model based on the second quarter (Q2) and third quarter (Q3) GDP quarterly growth percentages. In our updated GDP quarterly growth [CSV file](/updated_econ.csv), we used [estimates](https://fortune.com/2020/08/06/us-gdp-growth-record-rebound-q3-2020-election/) from Morgan Stanley, IHS Markit, S&P Global Ratings, and the Federal Reserve Bank of Atlanta to calculate the average estimated Q3 GDP growth in 2020 as 20.35%.

Working with the data on the updated GDP quarterly growth and the popular election vote results, we generate the following plots:
![Q2_plot](/Q2.png)
![Q3_plot](/Q3.png)

To understand which model predicts the actual election results better, we then compare the two model fits by plotting the in-sample error via residuals, which captures the difference between each observed and predicted value.

Second Quarter             |  Third Quarter
:-------------------------:|:-------------------------:
![Q2_compare](/Q2-compare.png)  |  ![Q3_compare](/Q3-compare.png)

We observe that the predicted data points fit better with the line of the actual data on our third-quarter GDP growth prediction model. We decide to take a more detailed look by plotting a histogram of the frequency of the magnitudes of the residuals. 

Second Quarter             |  Third Quarter
:-------------------------:|:-------------------------:
![Q2_histogram](/Q2-hist.png)  |  ![Q3_histogram](/Q3-hist.png)

Once again, we observe a wider spread of the residual magnitudes on our Q2 GDP growth prediction model, which means that the Q2 GDP growth prediction model that we devised fits the true data in a better way, pointing us to select that model instead. We perform one final model test, cross-validation. In this test, we withhold a random subset of the sample, fit the predictive model on the rest of the sample, and evaluate its predictive performance on the held-out observations. We chose this model testing method against one out-of-sample testing (withholding one observation before fitting and see how well the model predicts the true value for the held-out observation), as it involves repeatedly evaluating performance against many randomly held-out "out-of-sample" datasets. This approach provides for a more accurate and reliable model testing method. In our examples, we run 1000 single cross-validation tests and report the mean out-of-sample residual in each case. Finally, we plot the following histograms that present the spread of mean residuals for each of the cross-validation of the two predictive models.
