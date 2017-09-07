# you need to import the data set, set your working directory and attach to your data set

#  getwd()
#  setwd("path")
setwd("C:/Users/Wesley/Dropbox/1_TBUR_Book/Edition3/17_Appendix")
list.files()
#  import/assign your data set.
ds <- read.csv("Class Data Set.csv", header = T) 
#  rm(ds) # if you need to remove your dataset
#  Or use the Import Dataset" button in R Studio.

#  attach(ds) # be aware of the issues with attaching to your data set
#  install.packages("car") # if you need to install the car package
library(car) # used for recoding

#  This script is a central spot for storing regular factors and recodes on the class data set.
#  It may be updated regularly.

#  Set the display rounding and scientific notation, remember that you do this.
options(scipen = 999, digits = 4) 

#  You can also update your packages if you so choose
#  update.packages()  # Note: make sure you look for a hidden pop-up question in the background
#####  See Note  #####

#  Example CAR package recode Syntax
#  ds$new_variable <- recode(ds$old_variable,"1=1; 2:3=2; 4=3; 
#                                              -99=-99; NA=NA; else=NA")
#  Be very careful when using the "else" recode
#  Note you must do NA=NA before the "else" part.

#  Native R Recode Syntax

#  Check the counts before and after after a recode
#  table(variable_name, useNA = "always") #  Check the counts
#  check the sum
#  sum(table(variable_name, useNA = "always"))

##### Begin Recodes with recode

names(ds)
#  Gender where Women = 0; and Men = 1
table(ds$gender, useNA = "always") #  Check the counts
ds$f.gender <- factor(ds$gender, levels=c(0,1), labels=c("Women","Men")) 
table(ds$f.gender, useNA = "always") #  Check the counts and labels

#  example with political party where 1 = Dem; 2 = Rep, 3 = Ind, 4 = other
table(ds$party, useNA = "always") #  Check the counts
ds$f.party <- factor(ds$party, levels=c(1,2,3,4), labels=c("Dem","Rep","Ind", "Other")) 
table(ds$f.party, useNA = "always") #  Check the counts

#  create a version of party with no "Other"
ds$f.party.2 <- recode(ds$f.party, "'Other' = NA")
table(ds$f.party.2, useNA = "always") #  Check the counts - NA should grow

#  Create Independent dummy variable
table(ds$f.party, useNA = "always") #  Check the counts
ds$r.ind <- recode(ds$party, "3=1; 1:2=0; 4=0")
ds$f.ind <- factor(ds$r.ind, levels=c(0,1), 
                   labels=c("Non Ind","Ind")) 
table(ds$f.ind, useNA = "always") #  Check the counts

#  Create Republican dummy variable
table(ds$f.party, useNA = "always") #  Check the counts
ds$r.rep <- recode(ds$party, "2=1; 1=0; 3:4=0")
ds$f.rep <- factor(ds$r.rep, levels=c(0,1), 
                   labels=c("Non Rep","Rep")) 
table(ds$f.rep, useNA = "always") #  Check the counts

#  Create Democrat dummy variable
table(ds$f.party, useNA = "always") #  Check the counts
ds$r.dem <- recode(ds$party, "1=1; 2:4=0;")
ds$f.dem <- factor(ds$r.dem, levels=c(0,1), 
                           labels=c("Non Dem","Dem")) 
table(ds$f.dem, useNA = "always") #  Check the counts

#  Party Strength
#names(ds)
#table(ds$lean, useNA = "always") #  Check the counts
#ds$f.lean <- factor(ds$lean, levels=c(1,2,3), labels=c("Completely","Somewhat","slightly")) 
#table(ds$f.lean, useNA = "always") #  Check the counts

#  Recode education to remove 8; then factor the seven levels
#table(ds$edu, useNA = "always") #  Check the counts
#ds$r.edu <- recode(ds$edu,"8=NA")
#table(ds$r.edu, useNA = "always") #  Check the counts

#  Factor/Label education
table(ds$edu, useNA = "always")
ds$f.edu <- factor(ds$edu, levels=c(1,2,3,4,5,6,7,8), 
                labels=c("< HS","HS/GED","Vocational/Technical", "Some College",
                         "2 year/Associates", "Bachelor's Degree", "Master's degree", "PhD/JD/MD")) 
table(ds$f.edu, useNA = "always") #  Check the counts

#  Factor Race
table(ds$race, useNA = "always") #  Check the counts
ds$f.race <- factor(ds$race, levels=c(1,2,3,4,5,6,7), 
                 labels=c("White","African Amer","Amer India", "Asian", "Nat. Hawaian/Pac. Isl.", 
                          "2+ races", "Other")) 
table(ds$f.race, useNA = "always") #  Check the counts

#  Additional Race Variables Recodes
#  Recode American Indian and Asian American to Other; re-level the groups
table(ds$race, useNA = "always") #  Check the counts
ds$r.race <- recode(ds$race, "2=1; 1=2; NA=NA; else=3")
table(ds$r.race, useNA = "always") #  Check the counts
ds$f.race.2 <- factor(ds$r.race, levels=c(1,2,3), 
                  labels=c("African Amer", "White", "Other")) 

table(ds$f.race.2, useNA = "always") #  Check the counts
sum(table(ds$f.race.2, useNA = "always")) #  Check the counts

#  White - Dummy Variable
table(ds$race, useNA = "always") #  Check the counts
ds$r.white <- recode(ds$race, "1=1; NA=NA; else=0")
ds$f.white <- factor(ds$r.white, levels=c(0,1), 
                labels=c("Non White","White")) 
table(ds$f.white, useNA = "always") #  Check the counts
sum(table(ds$f.white, useNA = "always")) #  Check the counts

#  African American - Dummy Variable
table(ds$f.race, useNA = "always") #  Check the counts
ds$r.AfricanAmer <- recode(ds$race, "2=1; NA=NA; else=0;")
ds$f.AfricanAmer <- factor(ds$r.AfricanAmer, levels=c(0,1), 
                  labels=c("Non AfricanAmer","AfricanAmer")) 
table(ds$f.AfricanAmer, useNA = "always") #  Check the counts
sum(table(ds$f.AfricanAmer, useNA = "always")) #  Check the counts

#  Hispanic - Dummy Variable
#table(ds$f.race, useNA = "always") #  Check the counts
#ds$r.Hispanic <- recode(ds$race, "4=1; NA=NA; else=0;")
#ds$f.Hispanic <- factor(ds$r.Hispanic, levels=c(0,1), 
#                        labels=c("Non Hispanic","Hispanic")) 
#table(ds$f.Hispanic, useNA = "always") #  Check the counts
#sum(table(ds$f.Hispanic, useNA = "always")) #  Check the counts


#  recode age to 6 groups
table(ds$age, useNA = "always") #  Check the counts
sum(table(ds$age, useNA = "always")) #  Check the counts
ds$r.age <- recode(ds$age, "18:30=1; 31:40=2; 41:50=3; 51:60=4; 61:70=5; 71:100=6")

#  At this point you would factor your variable to label it again.
ds$f.age <- factor(ds$r.age, levels=c(1,2,3,4,5,6), 
                labels=c("18-30","31-40","41-50", "51-60", "61-70", "71+")) 
table(ds$f.age, useNA = "always") #  Check the counts
sum(table(ds$f.age, useNA = "always")) #  Check the counts

#  Create 2 level age group - this creates a two level factor group for age.
#  ds$f.var.2 <- cut(ds$var, 2)
ds$f.age.2 <- cut(ds$age, 2)
table(ds$f.age.2, useNA = "always") #  Check the counts

names(ds)
#  recode ideology to 3 levels from 7
table(ds$ideol, useNA = "always") #  Check the counts
sum(table(ds$ideol, useNA = "always")) #  Check the counts
ds$r.ideology <- recode(ds$ideol, "1:2=1; 3:5=2; 6:7=3")  

#  Now let's factor / label the variables
ds$f.ideology <- factor(ds$r.ideology, levels=c(1,2,3), labels=c("Liberal", 
                                                             "Moderate",
                                                             "Conservative"))
table(ds$f.ideology, useNA = "always") #  Check the counts
sum(table(ds$f.ideology, useNA = "always")) #  Check the counts

#  create a factored version of gcc variable - Do you believe human cause GCC?
#  0 = No; 1 = Yes

ds$f.glbwrm_ok <- factor(ds$glbwrm_ok, level = c(0,1), labels=c("No","Yes"))
table(ds$f.glbwrm_ok)

write.csv(ds, "Class Data Set Factored.csv")
