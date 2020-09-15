---
permalink: /week-1.html
---

# **Week 1 - Preliminaries**

## **Introduction**
Before taking a deep dive into election result predictions, we thought it would be of great interest to investigate some of the parallel universes, or contributing factors if you would like, of election night results. Thus, we look at swing states and how we can identify those based on historical and current trends. We finish up with a preliminary election prediction statistic, calculate electoral votes, and interpret results based on our previous analysis.

## **Uncovering Swing States**

### _Using the historical approach_
We begin by looking at the differences between the popular vote percentage that Democrats received in a given election and the popular vote percentage that the party received in the previous election cycle. We use the two-party (Republican and Democrat) popular vote sum to calculate the percentages, as none of the independent or third-party candidates have secured any electoral votes in the period 1984-2016 we are considering ([Dave Leip’s Atlas of U.S. Presidential Elections](https://uselectionatlas.org/RESULTS/)). We will spend some time exploring the impact of the third-party vote (i.e., in the 2000 presidential election in Florida) in a future blog post.

To calculate the swing percentage we use the following formula:

<img src="https://render.githubusercontent.com/render/math?math=\frac{D_{i}}{D_{i} %2B R_{i}} - \frac{D_{i-4}}{D_{i-4} %2B R_{i-4}}">, where <img src="https://render.githubusercontent.com/render/math?math=D_{i}"> and <img src="https://render.githubusercontent.com/render/math?math=R_{i}"> are the popular vote percentages that the Democratic and Republican candidate received in year i respectively, and <img src="https://render.githubusercontent.com/render/math?math=D_{i-4}"> and <img src="https://render.githubusercontent.com/render/math?math=R_{i-4}"> are the popular vote percentages that the Democratic and Republican candidate received in previous election cycle respectively.

Working with the data from the popular vote results for both parties on the elections of 1980 to 2016, we generated the following map:

![Swing States Historical Data](/PV_swing_states_historical.png)
<sup>Please note that because of the nature of the formula we use to calculate the change in percentage of the popular vote, we cannot create a map for the year 1980, but use it to create the map for the year 1984.</sup>

In the map, a deeper blue color of a state denotes that the Democratic party saw substantial increases in the percentage of the popular vote they secured against their Republican contenders compared to the previous election. On the other hand, a deep red color points to a strong Republican resurgence in the state's popular vote results compared to the percentage scored four years before.

## **Does turnout affect the results?**

## **Current electoral vote prediction**
