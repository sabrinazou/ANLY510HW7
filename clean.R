dirty_data = read.csv("dirty_data.csv")
myvars <- names(dirty_data)%in%c("Street", "Strange.HTML")
clean_data = dirty_data[!myvars]
library(stringi)
clean_data$Area = sub("^$", "Unknown", clean_data$Area)
clean_data = unique(clean_data)
write.csv(clean_data, file = "clean_data.csv")