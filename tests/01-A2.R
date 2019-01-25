new<-data.table(new)
new[new == '#NA'] <- ""                                                         # replace multiple values

new[, c(1, 8, 10:13, 15) := ""]                                                 # replace by ref    https://tinyurl.com/y8chogc8
# new<-new[, -15]



# rename columns                                                                                    https://tinyurl.com/ybw8dgqn
setnames(new, old = c("Emplid2", "New_Job_Action_Code", "New_Job_Action_Reason_Code", "Job_Indicator2", "Employee_Record2", "Position_No_Descr1", "Dept_ID_Descr", "X"), 
              new = c("position_title", "emp_status", "status_change", "recomm_action", "dept_number", "assgn_beg_date", "assgn_end_date", "position_dept"))
new[,`:=`(HAS.FIN= "NO", HAS.STU = "NO", RACF_ID = "NO", ended_position = "NO", position_title = "", has_curr_assn = "", has_futr_assn = "")] # add new columns
# new[,`:=`(new1 = "a", new2 = "b", new3 = "c", new4 = "d", HAS.FIN= "NO", HAS.STU = "NO", RACF_ID = "NO", ended_position = "NO")]            # add new columns
# setnames(new, "Employee_Record2", "dept_number")                              # rename columns    https://tinyurl.com/ybent33e

new <- 
  new %>%
  filter(grepl("^8", Badge_No2)) %>%
  mutate_all(funs(ifelse(. == "#NA", "", .))) %>%                               # changing multiple column values given a condition in dplyr https://tinyurl.com/ybucr674
  # mutate(Middle_Name2 = gsub("#NA", "", Middle_Name2)) %>%
  # mutate(Name_Suffix2 = gsub("#NA", "", Name_Suffix2)) %>%                    # concatenate col   https://tinyurl.com/ydgrmk7o
  unite(surname, Last_Name2, First_Name2, sep = ", ") %>%                       # concatenate col   https://tinyurl.com/y8nrqd4s
  unite(employee_name, surname, Middle_Name2, Name_Suffix2, sep = " ") %>%
  rename(c("Badge_No2" = "UGAID")) %>%                                          # rename column     https://tinyurl.com/y7avsm3s
  rename(c("New_Eff_Date2" = "term_date")) %>%                                  # rename column     https://tinyurl.com/y7avsm3s
# mutate(HAS.FIN = "NO") %>%                                                    # add column        https://tinyurl.com/y9peejyf
# mutate(HAS.STU = "NO") %>%
# mutate(RACF_ID = "NO") %>%
# mutate(ended_position = "NO") %>%
# rowwise() %>%
  mutate_all(funs(str_squish(.)))                                               # remove whitespace
  # data.table(new)
  # select(HAS.FIN., everything())                                              # reorder columns   https://tinyurl.com/yckafdwr
  # new <- new[, c(13:14, 1:11)]                                                # reorder columns   https://tinyurl.com/c3s3fl5
  # new[, ('HAS.FIN.') :="NO"]                                                  # add column        https://tinyurl.com/h8tm6t8

new[new == '#NA - #NA'] <- ""
new[is.na(new)] <- ""
new<-data.table(new[, c(13:14, 2:3, 15, 4:5, 7, 6, 8:9, 16, 1, 10:12, 17:18)])

# strsplit(as.character(new[,14]), "- ")
# new <- new[,names(new)="X"]

write.xlsx(new, "reports/access_new.xlsx", row.names=F, sheetName="accessNew", append=FALSE)