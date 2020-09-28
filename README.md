# Data Exploration
Automated data exploration in R

## Getting Started

Using this tool is a simple as importing the ```dataExporation.R``` functions and passing in a DataFrame of interest.

```
data <- read.csv("your_data_file.csv")

source("dataExporation.R")
dataExploration(data)
```

Note that the scripts and RMD files need to be in the working directory for this to work.

### Prerequisites

Required: ```R, RStudio``` are needed, and the ```dataExporation.R, univarient.R, bivarient.R, main.RMD``` files should be in the working directory.

## Analysis

The tool creates a data summary, a univarient (distribution) analysis and a bivarient (correlation and regression) analysis. Full example outputs are available for [the Titanic dataset](http://www.grantholtes.com/Titanic.html?) and [macroeconomic data](http://www.grantholtes.com/Swiss.html?)

#### Data summary
High level information about the dataset.

![UniVar Summary](https://github.com/Gholtes/dataExploration/blob/master/images/highLevel.PNG)

#### Univarient analysis
Detailed analysis of each variable and their distributions.

![UniVar Summary](https://github.com/Gholtes/dataExploration/blob/master/images/uniVar.PNG)

#### Bivarient analysis
Analysis of the relationships between variables using correlation, regression and scatter plots.

![UniVar Summary](https://github.com/Gholtes/dataExploration/blob/master/images/biVar1.PNG)

![UniVar Summary](https://github.com/Gholtes/dataExploration/blob/master/images/biVar2.PNG)


# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
