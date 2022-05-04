#title: "CFA for scale developed in study 1"
###Goal: Confirm factor structure from study 1 EFA
###Product: Confirmatory factor analysis
###Data: Study 2 data
###Interpretation: All items loaded appropriately and 3 factor structure was found.

install.packages("psych")
library(psych)

install.packages("lavaan")
library(lavaan)

install.packages("GPArotation")
library(GPArotation)

#setwd("/Volumes/labshare/Experiments/DEAR /Dialectical Beliefs Studies/Thesis big study")
#setwd("C:/Users/marqschieber/Library/Mobile Documents/com~apple~CloudDocs/Wake Forest Psychology/Waugh Research/DEAR Data /Dialectical Emotions Scale Validation Data/DES validation data.sav")

## read indata from 447 subjects for CFA

dit <- read.csv("Data.csv")

##get descriptives on all the items

describe(dit)

##exclude items with poor descriptives

des2 <-data.frame(dit$DES_1NPS, dit$DES_2NPS, dit$DES_3NPS, dit$DES_4CPN, dit$DES_5PNS, dit$DES_6CPN, dit$DES_7CPN, dit$DES_8PNS,
                  dit$DES_9PNS, dit$DES_10CPN, dit$DES_11PNS)
## determine number of factors using parallel and VSS (velicer MAP, BIC, etc.) nusing maximum likelihood

fa.parallel(des2, fm="mle", fa="fa")

VSS(des2, n=3, rotate="promax", fm="ml")

## factor analysis using ML, rotate = promax

cfa3factorPromaxML <- fa(des2, nfactors=3, rotate="promax", fm="mle")

