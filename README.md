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

## Analysis

The tool creates a data summary, a univarient (distribution) analysis and a bivarient (correlation and regression) analysis.

#### Data summary
High level information about the dataset.
![High Level Summary](https://github.com/Gholtes/dataExploration/images/highLevel.png)

#### Univarient analysis
Detailed analysis of each variable and their distributions.
![UniVar Summary](https://github.com/Gholtes/dataExploration/images/uniVar.png)

#### Bivarient analysis
Analysis of the relationships between variables using correlation, regression and scatter plots.
![UniVar Summary](https://github.com/Gholtes/dataExploration/images/biVar1.png)
![UniVar Summary](https://github.com/Gholtes/dataExploration/images/biVar2.png)

### Prerequisites

Required: ```R, RStudio``` are needed, and the ```dataExporation.R, univarient.R, bivarient.R, main.RMD``` files should be in the working directory.


# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
