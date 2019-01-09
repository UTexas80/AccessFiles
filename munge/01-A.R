new <- 
  new %>%
  mutate(Name_Suffix2 = gsub("#NA", "", Name_Suffix2)) %>%
  unite(surname, Last_Name2, First_Name2, sep = ", ") %>%
  unite(employee_name, surname, Middle_Name2, Name_Suffix2, sep = " ")