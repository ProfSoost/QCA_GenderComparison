
# Packages

library(QCA)
library(mosaic)
library(venn)
library(readxl)
library(VennDiagram)
library(ggvenn)

Data <- read_excel("IntroductoryExample.xlsx")
Data <- data.frame(Data)

# Truth table

tT <- truthTable(Data, outcome = "StartUp", conditions = "University, EntEducation", 
                 show.cases = TRUE, complete = TRUE)
tT

# Necessity
pof("University <= StartUp", data=Data)
pof("EntEducation <= StartUp", data=Data)

# Sufficiency
pof("University => StartUp", data=Data)
pof("EntEducation => StartUp", data=Data)

# Logical minimization
minimize(tT,details=TRUE,method="QMC")
?minimize

pof("~University*~EntEducation => StartUp", data=Data)
XYplot("~University*~EntEducation => StartUp", relation = "sufficiency",data=Data)


