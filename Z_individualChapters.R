#use the settings in the Z_complete book.r file.
#this file doesn't work 7/13/2014

library("car")
library("knitr")
library("lattice")
library("psych")
library("sm")
library(knitr)


getwd()
#Set Main working directory for Aaron's PC
setwd("C:/Users/admin/Dropbox/book/")
##knit("../01_Theory/01_old_theory2.Rnw")


#!!!!!!! DO not update without checking with Aaron
#Chapter1

#setwd("01_Theory")
knit("01_Theory/01_theory.Rnw")


#Chapter2
#setwd("../02_ResearchDesign/")
knit("02_ResearchDesign/02_ResearchDesign.Rnw")

#chapter3
#setwd("../03_Data/")
knit("03_Data/03_Data.Rnw")

#chapter4
#setwd("../04_Probability/")
knit("04_Probability/04_Probability.Rnw")
load("04_Probability//04_Probability.Rnw")

file.edit("04_Probability//04_Probability.Rnw")
?file.edit
file.edit("http://www.mayin.org/ajayshah/KB/R/tutorial.R")
file.show("http://www.mayin.org/ajayshah/KB/R/tutorial.R") 
opens a file in a new window.

read.csv("http://ww2.coastal.edu/kingw/statistics/R-tutorials/text/caffeine.csv") -> caff
fix(caff)
caff
write.csv(caff, file="caffeine2.csv", row.names=FALSE)


Or, you could assign it to the same name, in effect updating measurements with the edits you are 
about to make: 
  > measurements <- edit(measurements)
You could also use the fix function, which calls edit, and then assigns the new version to 
the same name. 
> fix(measurements) # equivalent to measurements <- edit(measurements)
mydata <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,4,5)
hist(mydata)
library(MASS)

# again histogram with prob = T by default
truehist(mydata) # looks OK

source(file="http://ww2.coastal.edu/kingw/statistics/R-tutorials/text/sample_script.txt")

#batch execute R script via Internet
source("http://www.mayin.org/ajayshah/KB/R/tutorial.R")
source("04_Probability//04_Probability.Rnw")

install.packages("devtools")
library(devtools)
source_url('http://www.mayin.org/ajayshah/KB/R/tutorial.R')

#chapter5
#setwd("../05_Inference/")
knit("05_Inference/05_Inference.Rnw")

#chapter6
#setwd("../06_Association/")
knit("06_Association/06_association.Rnw")

#chapter7
#setwd("../07_OLSlogic/")
knit("07_OLSlogic/07_OLSlogic.Rnw")

#chapter8
#setwd("../08_Derivatives/")
knit("08_Derivatives/08_old_derivatives.Rnw")

#chapter9
#setwd("../09_InterpretSimple/")
knit("09_InterpretSimple/09_interpretSimple.Rnw")

#chapter10
#setwd("../10_SimpleDiagnostics/")
knit("10_SimpleDiagnostics/10_simplediagnostics3.Rnw")

#chapter11
#setwd("../11_Matrix/")
knit("11_Matrix/11_matrix.Rnw")


#Chapter 12
#setwd("../12_LogicMult/")
knit("12_LogicMult/12_logicMult.Rnw")

#chapter 13
#setwd("../13_ModelFit/")
knit("13_ModelFit/13_modelFit.Rnw")

#chapter 14
setwd("../14_Topics/")
knit("14_topics.Rnw")

#chapter 15
#setwd("../15_Diagnostics/")
knit("15_Diagnostics/15_diagnostics2.Rnw")

#chapter 16
#setwd("../16_Logit/")
knit("16_Logit/16_logit.Rnw")


