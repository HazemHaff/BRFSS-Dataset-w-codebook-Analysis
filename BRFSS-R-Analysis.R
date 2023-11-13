library('dplyr')
library('foreign')

# You can download the dataset on BRFSS website:
# https://www.cdc.gov/brfss/annual_data/annual_2020.html
data <- read.xport('C:/Users/hhaff/Downloads/LLCP2020.XPT', fill=NA)


# Count respondents contacted by cell phone
cell=data|>filter(CCLGHOUS==1) |> nrow()

# Count respondents contacted by landline
land=data|>filter(COLGHOUS==1) |> nrow()

# Calculate the ratio of respondents contacted by cell phone versus landline
cell/land


# Count the number of respondents contacted in either September or October
data |> filter(IMONTH=="09" | IMONTH=="10") |> nrow()


# Filter respondents who reported 1-30 days of poor mental health
# Count the number of respondents in this set
# Print the mean number of days and the count of respondents
data |> filter(CCLGHOUS==1 | COLGHOUS==1) |> filter(POORHLTH<=30 & POORHLTH >=1 & !is.na(POORHLTH)) |> select(POORHLTH) |> unlist() |> mean()
