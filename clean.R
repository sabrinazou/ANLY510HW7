
# read dirty data
dirty_data = read.csv("dirty_data.csv")
myvars <- names(dirty_data)%in%c("Street", "Strange.HTML")

# clean data 
clean_data = dirty_data[!myvars]
library(stringi)
clean_data$Street.2 = stri_trans_totitle(clean_data$Street.2)

Encoding(clean_data$Street.2) <- "latin1"
clean_data$Street.2 = iconv(clean_data$Street.2, "latin1", "ASCII", sub="")


clean_data$Area = sub("^$", "Unknown", clean_data$Area)
clean_data$Street.2 = trimws(clean_data$Street.2)
clean_data = unique(clean_data)

# write clean data
write.csv(clean_data, file = "clean_data.csv")
