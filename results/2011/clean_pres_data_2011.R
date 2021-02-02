## empty memory (!)
rm(list=ls())

pres <- read.csv("2011_Pres_Pstn.csv",colClasses = "character", sep = ";")
pres <- unique(pres)
pres <- pres[-c(26,27),]


### transform into to numeric data
class(pres$REGISTERED.VOTERS)
cols <- 11:22
pres[,cols] <- lapply(pres[,cols],function(pres){as.numeric(gsub("([0-9]+)\\.([0-9])", "\\1\\2", pres))})

### save as CSV file
write.csv(pres, "2011_Pres_Pstn_processed.csv", row.names = FALSE)