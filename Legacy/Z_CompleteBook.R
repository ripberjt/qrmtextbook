getwd()

# set working directory
#setwd()

# data
ds<-read.csv("Class Data Set.csv")
newdat<-read.csv("w1_w13_longdata.csv")

# load packages
library(car)
library(knitr)
library(lattice)
library(psych)
library(sm)
library(knitr)
library(scatterplot3d)
library(effects)
library(lmtest)
library(vcd)
library(stats)
library(formatR)

# compile and knit book
Sweave2knitr("stats_book_completeV3.Rnw")
knit("stats_book_completeV3.Rnw")
