library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)
library(R.matlab)

##==========================================

mat_try <- readMat('/final_fitted/result_deak187.mat')
View(mat_try)
print(length(mat_try[[1]]))

mat_try <- readMat('/final_fitted/result_rawak187.mat')
View(mat_try)
print(length(mat_try[[1]]))

mat_try <- readMat('/final_fitted/result_npak187.mat')
View(mat_try)
print(length(mat_try[[1]]))

data_try <- data.frame(trw = t(mat_try$output.de[[6]]),
                       nxylem = t(mat_try$output.de[[8]]),
                       fday = t(mat_try$output.de[[19]]),
                       sday = t(mat_try$output.de[[20]]),
                       eday = t(mat_try$output.de[[21]])
                       )

data_daily_try <- data.frame(t(mat_try$output.de[[10]]))
colnames( data_daily_try) <- 1:366
data_daily_try$year <- 1960:2015

data_daily_try <- data_daily_try %>% pivot_longer(1:366, names_to = "day", values_to = "value")

##============================================================================
site_infos <- read.csv('/tr_info_use_sig_matlab.csv')
head(site_infos)
View(site_infos)

read_from_mat_year <- function(mat_path){
  mat_data <- readMat(mat_path)
  data_output <- data.frame(year = 1960:2015,
                            trw = t(mat_data[[1]][[6]]),
                         nxylem = t(mat_data[[1]][[8]]),
                         fday = t(mat_data[[1]][[19]]),
                         sday = t(mat_data[[1]][[20]]),
                         eday = t(mat_data[[1]][[21]])
  )
  
  return(data_output)
}


read_from_mat_daily <- function(mat_path, daily_ins = c(10,11,12,14,15,23) ){
  mat_data <- readMat(mat_path)
  daily_index <- daily_ins
  daily_col_name <- c('gr','grt', 'grw', 'trans', 'sm','ncell')
  
  data_daily_output <- data.frame()
  for (j in 1:6){
    if (j != 6){
      data_daily <- data.frame(t(mat_data[[1]][[daily_index[j]]]))
    }else{
      data_daily_ncell <- sweep(mat_data[[1]][[daily_index[j]]], 2, mat_data[[1]][[daily_index[j]]][1,], FUN = "-")
      data_daily <- data.frame(t(data_daily_ncell))
    }
    
    colnames( data_daily) <- 1:366
    data_daily$year <- 1960:2015
    
    data_daily <- data_daily %>% pivot_longer(1:366, names_to = 'day', values_to = daily_col_name[j])
    if (j == 1){
      data_daily_output <- data_daily
    }else{
      data_daily_output <- left_join(data_daily_output,data_daily,by=c('year','day'))
    }
  }
  
  return(data_daily_output)
}



read_from_mat_year_np <- function(mat_path){
  mat_data <- readMat(mat_path)
  data_output <- data.frame(year = 1960:2015,
                            trw = t(mat_data[[1]][[6]]),
                            nxylem = t(mat_data[[1]][[8]]),
                            sday = t(mat_data[[1]][[19]]),
                            eday = t(mat_data[[1]][[20]])
  )
  
  return(data_output)
}


data_raw_output_year <- data.frame()
data_de_output_year <- data.frame()
data_np_output_year <- data.frame()
data_raw_output_daily <- data.frame()
data_de_output_daily <- data.frame()
data_np_output_daily <- data.frame()

for ( i in 1:nrow(site_infos)){
  print(site_infos$site[i])
  
  file_path_raw <- paste('/final_fitted/result_raw',
                         site_infos$site[i],'.mat', sep = '')
  file_path_de <- paste('/final_fitted/result_de',
                        site_infos$site[i],'.mat', sep = '')
  file_path_np <- paste('/final_fitted/result_np',
                        site_infos$site[i],'.mat', sep = '')
  
  data_raw_out_year <- read_from_mat_year(file_path_raw)
  data_de_out_year <- read_from_mat_year(file_path_de)
  data_np_out_year <- read_from_mat_year_np(file_path_np)
  print('year over')
  
  data_raw_out_daily <- read_from_mat_daily(file_path_raw)
  data_de_out_daily <- read_from_mat_daily(file_path_de)
  data_np_out_daily <- read_from_mat_daily(file_path_np,
                                           daily_ins = c(10,11,12,14,15,22))
  print('daily over')
  
  data_raw_out_year$site <- site_infos$site[i]
  data_de_out_year$site <- site_infos$site[i]
  data_np_out_year$site <- site_infos$site[i]
  
  data_raw_out_daily$site <- site_infos$site[i]
  data_de_out_daily$site <- site_infos$site[i]
  data_np_out_daily$site <- site_infos$site[i]
  
  
  data_raw_output_year <- rbind.data.frame(data_raw_output_year,data_raw_out_year)
  data_de_output_year <- rbind.data.frame(data_de_output_year,data_de_out_year)
  data_np_output_year <- rbind.data.frame(data_np_output_year,data_np_out_year)
  data_raw_output_daily <- rbind.data.frame(data_raw_output_daily,data_raw_out_daily)
  data_de_output_daily <- rbind.data.frame(data_de_output_daily,data_de_out_daily)
  data_np_output_daily <- rbind.data.frame(data_np_output_daily,data_np_out_daily)
  
}


write.csv(data_raw_output_year, 'output_csv/result_raw_year.csv' , row.names = FALSE)
write.csv(data_de_output_year, 'output_csv/result_de_year.csv', row.names = FALSE)
write.csv(data_np_output_year, 'output_csv/result_np_year.csv', row.names = FALSE)

write.csv(data_raw_output_daily, 'output_csv/result_raw_daily.csv', row.names = FALSE)
write.csv(data_de_output_daily, 'output_csv/result_de_daily.csv', row.names = FALSE)
write.csv(data_np_output_daily, 'output_csv/result_np_daily.csv', row.names = FALSE)



