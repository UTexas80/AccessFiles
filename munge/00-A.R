# how-to-import-most-recent-csv-file-into-rstudio
# https://tinyurl.com/ydgy9pfs

data_files <- file.info(Sys.glob("O:/IT/Access Files/*.csv"))                                                                     
access_file_old <-read.csv(row.names(data_files)[which.max(data_files[["ctime"]])])   