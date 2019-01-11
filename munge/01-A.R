new[new == '#NA'] <- ""                                                         # replace multiple values
new[,`:=`(new1 = "a", new2 = "b", new3 = "c", new4 = "d", HAS.FIN= "NO", HAS.STU = "NO", RACF_ID = "NO", ended_position = "NO")]            # add new columns
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