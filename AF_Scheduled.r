if(!require(data.table)) {install.packages("data.table"); require(data.table)}
if(!require(tidyverse)) {install.packages("tidyverse"); require(tidyverse)}
if(!require(xlsx)) {install.packages("xlxs"); require(xlxs)}

new <-data.table(read.csv('O:/IT/Access Files/Project/New File Example.csv'))
new <- funion(new[!Dept_ID_Descr %like% "-"],new[Dept_ID_Descr %like% "-"])
new <-new[, c("Dept_ID_Descr") := tstrsplit(Dept_ID_Descr, "-", fixed = TRUE, keep = 2L)]
new <- new[, lapply(.SD, as.character)][, c(1, 8, 10:13, 15) := ""]  
setnames(new, old = c("Emplid2", "New_Job_Action_Code", "New_Job_Action_Reason_Code", "Job_Indicator2", "Employee_Record2", "Position_No_Descr1", "X", "Badge_No2", "New_Eff_Date2"), 
              new = c("position_title", "emp_status", "status_change", "recomm_action", "dept_number", "assgn_beg_date", "position_dept", "UGAID", "term_date"))
new[,`:=`(HAS.FIN= "NO", HAS.STU = "NO", RACF_ID = "NO", ended_position = "NO", position_title = "", has_curr_assn = "", has_futr_assn = "", assgn_end_date = "")]

new <- 
  new %>%
  filter(grepl("^8", UGAID)) %>%
  mutate_all(funs(ifelse(. == "#NA", "", .))) %>%                               
  unite(surname, Last_Name2, First_Name2, sep = ", ") %>%                       
  unite(employee_name, surname, Middle_Name2, Name_Suffix2, sep = " ") %>%
  mutate_all(funs(str_squish(.)))      

new<-data.table(new[, c(13:14, 2:3, 15, 4:5, 7, 6, 8:9, 16, 1, 10, 19, 11:12, 17:18)])              # reorder columns
new[new == '#NA' | is.na(new) | new == '#NA - #NA'] <- ""                                           # replace na's
write.xlsx(new, "O:/IT/Access Files/Reports/access_new2.xlsx", row.names=F, sheetName="accessNew", append=FALSE)      