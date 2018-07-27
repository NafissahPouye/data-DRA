library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/data-DRA/data")
data <- read_excel("C:/Users/LENOVO T46OS/Desktop/data-DRA/data.xlsx", 
                   col_types = c("numeric", "numeric", "text", 
                                 "date", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "numeric", "text", 
                                 "text", "text", "numeric", "text", 
                                 "text", "numeric", "numeric", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "text", "numeric", "numeric", "numeric", 
                                 "text", "numeric", "numeric", "numeric", 
                                 "text", "text", "numeric", "numeric", 
                                 "numeric", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "numeric", 
                                 "numeric", "text", "text", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "text", "text", "text", "text", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "text", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "text"))

#Classification of variables
selectedKeyVars <- c('Country',	'PPG',	'Partner',	'Site'
                     ,'SiteOther',	'Village', 'NearbyCamp', 'Age',
                     'Gender',	'LegalStatus',	'CountryOrigin',	'ArrivalYear',
                     'Education',	'MaritalStatus',	'FamilySize'
)

#Convert variables into factors
cols = c('Gender', 'MaritalStatus','LegalStatus')
data[,cols] <- lapply(data[,cols], factor)

# Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)

#Assess the disclosure risk
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)

#Disclosure risk assessment 
print(objSDC, "risk")

#Generating an internal (extensive) report
report(objSDC, filename = "index", internal = TRUE) 

