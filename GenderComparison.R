
# Packages

library(QCA)
library(mosaic)
library(venn)

m_RAW <- read.csv("m_RAW.csv")
w_RAW <- read.csv("w_RAW.csv")

row.names(m_RAW) <- LETTERS[1:14]
row.names(w_RAW) <- LETTERS[1:14]

# Descriptives

tally(~Ssuc,data=m_RAW)
tally(~Ssuc,data=m_RAW,format="proportion")
tally(~Ssuc,data=w_RAW)
tally(~Ssuc,data=w_RAW,format="proportion")

tally(~Jsuc,data=m_RAW)
tally(~Jsuc,data=m_RAW,format="proportion")
tally(~Jsuc,data=w_RAW)
tally(~Jsuc,data=w_RAW,format="proportion")


favstats(~CF,data=m_RAW)
favstats(~CF,data=w_RAW)

favstats(~IHWE,data=m_RAW)
favstats(~IHWE,data=w_RAW)

favstats(~OUHWE,data=m_RAW)
favstats(~OUHWE,data=w_RAW)

favstats(~SSk,data=m_RAW)
favstats(~SSk,data=w_RAW)

# Truth table

# male successors
tTm <- truthTable(m_RAW, outcome = "Ssuc", conditions = "Jsuc, IHWE, OUHWE, CF, SSk", 
                  show.cases = TRUE, 
                  incl.cut=0.8,
                  sort.by = "incl, n+")
tTm

# female successors
tTw <- truthTable(w_RAW, outcome = "Ssuc", conditions = "Jsuc, IHWE, OUHWE, CF, SSk", 
                  show.cases = TRUE, 
                  incl.cut=0.8,
                  sort.by = "incl, n+")
tTw



# Complex/ conservative solution

# male successors
solution_m <- minimize(tTm,details=TRUE)
solution_m
venn(solution_m)

# female successors
solution_w <- minimize(tTw,details=TRUE)
solution_w
venn(solution_w)

# Parsimonious solution

# male successors
solution_m <- minimize(tTm,include="?",details = TRUE)
solution_m

# female successors
solution_w <- minimize(tTw,include="?",details = TRUE)
solution_w


