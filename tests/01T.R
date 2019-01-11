# Example Unit Testing Script
context("Example tests")
expect_equal(1, 1)

\B#\w*[n-nA-A]+\w*

new %>%
  mutate(Name_Suffix2 = gsub("\xe1", "XXX", Name_Suffix2))

my_data %>% 
  mutate(sepal_by_petal_l = Sepal.Length/Petal.Length)


dt <- data.table(mtcars)[,.(mpg, cyl)]
dt[,`:=`(avg=mean(mpg), med=median(mpg), min=min(mpg)), by=cyl]
head(dt)

dt[, `:=`(HAS.FIN.=1)]
HAS.FIN. 



# Step 1: set the working directory (where files are saved)
setwd("O:/IT/Access Files/*.csv")

# Step 2: Get List of Files in Directory
file_names = list.files(getwd())
file_names = file_names[grepl(".csv",file_names)]
 
# print file_names vector
file_names

# Step 3: Import the data
# read the WY.TXT file, just for testing
file = read.csv("/Users/johnt/namesbystate/WY.TXT", header=F, stringsAsFactors=F)
 
# see the data structure
str(file)

Step 4: Combine the data
# run read.csv on all values of file_names
files = lapply(file_names, read.csv, header=F, stringsAsFactors = F)
files = do.call(rbind,files)


lapply(tfiles, function(x) tail("names<-"(x, x[1, ]), -1))


filter(grepl("^8", UGAID))                                                      # regex             https://tinyurl.com/yazzrnu3