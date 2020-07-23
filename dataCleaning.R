# Cleaning initial data sets
# Data originally came from Kaggle: https://www.kaggle.com/divyansh22/february-flight-delay-prediction
# Model will have limitations because it only contains data from two months
# Data is stored in AWS S3 bucket: delay-alert-data

Jan2019 <- read.csv("Jan_2019_ontime.csv")
Jan2020 <- read.csv("Jan_2020_ontime.csv")
Feb2019 <- read.csv("Feb_2019_ontime.csv")

str(Jan2019)
str(Feb2019)
str(Jan2020)

data <- rbind(Jan2019, Feb2019, Jan2020)

data["DAY_OF_MONTH"] # Day of the month the flight departs
data["DAY_OF_WEEK"] # Day of the week starting from Monday
data["OP_UNIQUE_CARRIER"] # Unique carrier code (numerical suffix used for repeated codes)
data["OP_CARRIER_AIRLINE_ID"] # An identification number assigned by US DOT to identify a unique airline (carrier)
data["OP_CARRIER"] # Code assigned by IATA and commonly used to identify a carrier
data["TAIL_NUM"] # Tail number
data["OP_CARRIER_FL_NUM"] # Flight number
data["ORIGIN_AIRPORT_ID"] # Origin airport, airport ID
data["ORIGIN_AIRPORT_SEQ_ID"] # Origin airport, airport sequence ID. An ID to identify a unique airport at a given point of time.
data["ORIGIN"] # Origin airport
data["DEST_AIRPORT_ID"] # Destination airport, airport ID
data["DEST_AIRPORT_SEQ_ID"] # Destination airport, airport sequence ID. An ID to identify a unique airport at a given point of time.
data["DEST"] # Destination airport
data["DEP_TIME"] # Actual departure time (local time: hhmm)
data["DEP_DEL15"] # Departure Delay Indicator, 15 minutes or More (1=Yes, 0=No) - REMOVED
data["DEP_TIME_BLK"] # Departure time block, hourly intervals
data["ARR_TIME"] # Actual arrival time (local time: hhmm)
data["ARR_DEL15"] # Arrival delay indicator, 15 minutes or More (1=Yes, 0=No)
data["CANCELLED"] # Cancelled flight indicator (1=Yes, 0=No) - REMOVED
data["DIVERTED"] # Diverted flight indicator (1=Yes, 0=No) - REMOVED
data["DISTANCE"] # Distance between airports (miles)
data[c("X")] # Unknown column - REMOVED

dataClean <- subset(data,
                    select = -c(DEP_DEL15,
                                CANCELLED, 
                                DIVERTED, 
                                X))

str(dataClean)
table(dataClean$ARR_DEL15)

write.csv(dataClean, "data.csv", row.names = TRUE)
