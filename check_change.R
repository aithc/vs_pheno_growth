#====比较不同模型实验下的结果==============================
##  

library(dplyr)
library(tidyr)
library(ggplot2)


##====比较模拟轮宽=============================================================
## 
data_np_output_year$d_nxylem <- data_np_output_year$nxylem - data_raw_output_year$nxylem
data_de_output_year$d_nxylem <- data_de_output_year$nxylem - data_raw_output_year$nxylem

ggplot()+geom_histogram(data = filter(data_np_output_year,year>2000),aes(d_nxylem) ,
                        breaks = -5.5:5.5,fill = 'green', alpha = 0.5)+
  geom_histogram(data = filter(data_de_output_year,year>2000),aes(d_nxylem) ,
                 breaks = -10.5:10.5, fill='blue', alpha = 0.5)

data_raw_year_sitemean <- data_raw_output_year %>% group_by(year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)
data_de_year_sitemean <- data_de_output_year %>% group_by(year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)
data_np_year_sitemean <- data_np_output_year %>% group_by(year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)

data_raw_year_sitemid <- data_raw_output_year %>% group_by(year) %>% summarise_if(is.numeric,median, na.rm=TRUE)
data_de_year_sitemid <- data_de_output_year %>% group_by(year) %>% summarise_if(is.numeric,median, na.rm=TRUE)
data_np_year_sitemid <- data_np_output_year %>% group_by(year) %>% summarise_if(is.numeric,median, na.rm=TRUE)

ggplot() + geom_line(data = data_np_output_year,aes(year,trw,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,trw,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,trw,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemean,aes(year,trw),color = 'green',linewidth = 2)+
  geom_line(data = data_raw_year_sitemean,aes(year,trw),color = 'red',linewidth = 2)+
  geom_line(data = data_de_year_sitemean,aes(year,trw),color = 'blue',linewidth = 2)

ggplot() + geom_line(data = data_np_output_year,aes(year,nxylem,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,nxylem,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,nxylem,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemean,aes(year,nxylem),color = 'green',linewidth = 2)+
  geom_line(data = data_raw_year_sitemean,aes(year,nxylem),color = 'red',linewidth = 2)+
  geom_line(data = data_de_year_sitemean,aes(year,nxylem),color = 'blue',linewidth = 2)

ggplot() + geom_line(data = data_np_output_year,aes(year,d_nxylem,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,d_nxylem,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemean,aes(year,d_nxylem),color = 'green',linewidth = 2)+
  geom_line(data = data_de_year_sitemean,aes(year,d_nxylem),color = 'blue',linewidth = 2)

ggplot() + geom_line(data = data_np_output_year,aes(year,trw,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,trw,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,trw,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemid,aes(year,trw),color = 'green',linewidth = 2)+
  geom_line(data = data_raw_year_sitemid,aes(year,trw),color = 'red',linewidth = 2)+
  geom_line(data = data_de_year_sitemid,aes(year,trw),color = 'blue',linewidth = 2)

ggplot() + geom_line(data = data_np_output_year,aes(year,nxylem,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,nxylem,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,nxylem,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemid,aes(year,nxylem),color = 'green',linewidth = 2)+
  geom_line(data = data_raw_year_sitemid,aes(year,nxylem),color = 'red',linewidth = 2)+
  geom_line(data = data_de_year_sitemid,aes(year,nxylem),color = 'blue',linewidth = 2)



##=====取几个点看看==========================

ggplot() + geom_line(data = filter(data_np_output_year,site=='swit374'),aes(year,nxylem),
                     color = 'green')+
  geom_line(data = filter(data_raw_output_year,site=='swit374'),aes(year,nxylem),
            color = 'red')+
  geom_line(data = filter(data_de_output_year,site=='swit374'),aes(year,nxylem),
            color = 'blue')

ggplot() + geom_line(data = filter(data_np_output_year,site=='swit374'),aes(year,sday),
                     color = 'green')+
  geom_line(data = filter(data_raw_output_year,site=='swit374'),aes(year,sday),
            color = 'red')+
  geom_line(data = filter(data_de_output_year,site=='swit374'),aes(year,sday),
            color = 'blue')

ggplot() + geom_line(data = filter(data_np_output_year,site=='az609'),aes(year,d_nxylem),
                     color = 'green')+
  geom_line(data = filter(data_de_output_year,site=='az609'),aes(year,d_nxylem),
            color = 'blue')

##======算一下每一个点最后十年不同实验间 轮宽 物候的差值=======

diff_last10year <- data_raw_output_year %>% filter(year > 2005) %>% select(-trw)
View(diff_last10year)

np_last10year <- data_np_output_year %>% filter(year > 2005) %>% select(-c(trw))
de_last10year <- data_de_output_year %>% filter(year > 2005) %>% select(-c(trw))

choose_col <- c('nxylem','sday','eday','fday')

## raw - de
for (i in 1:4){
  inter_data <- left_join(diff_last10year[c('year','site')], 
                          de_last10year[c('year','site',choose_col[i])],by = c('year','site'))
  
  diff_last10year[paste(choose_col[i],'rd',sep = '_')] <- diff_last10year[choose_col[i]] - inter_data[choose_col[i]] 
}

head(diff_last10year)

## raw - np
for (i in 1:3){
  inter_data <- left_join(diff_last10year[c('year','site')], 
                          np_last10year[c('year','site',choose_col[i])],by = c('year','site'))
  
  diff_last10year[paste(choose_col[i],'rp',sep = '_')] <- diff_last10year[choose_col[i]] - inter_data[choose_col[i]] 
}

diff_last10year['fday_rp'] <- diff_last10year['fday_rd']
head(diff_last10year)

## np - de
for (i in 1:3){
  inter_data <- left_join(np_last10year[c('year','site')], 
                          de_last10year[c('year','site',choose_col[i])],by = c('year','site'))
  
  diff_last10year[paste(choose_col[i],'pd',sep = '_')] <- np_last10year[choose_col[i]] -inter_data[choose_col[i]] 
}

head(diff_last10year)

boxplot(diff_last10year[,7:14])
boxplot(diff_last10year[,c('nxylem_rd','nxylem_rp','nxylem_pd')])

diff_last10year_mean <- diff_last10year %>% group_by(site) %>% 
  summarise(across(-year, ~ mean(.x, na.rm = TRUE))) %>% 
  left_join(site_infos, by  ='site')
head(diff_last10year_mean)

diff_last10year_mid <- diff_last10year %>% group_by(site) %>% 
  summarise(across(-year, ~ median(.x, na.rm = TRUE))) %>% 
  left_join(site_infos, by  ='site')
head(diff_last10year_mid)

ggplot(data = diff_last10year_mean,aes(longitude,latitude,color=nxylem_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mean,aes(longitude,latitude,color=nxylem_rp))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rp',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mean,aes(longitude,latitude,color=nxylem_pd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_pd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))


ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=nxylem_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=nxylem_rp))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rp',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=nxylem_pd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_pd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

##物候上的差别
ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=fday_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='fday_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=sday_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='sday_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=eday_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='eday_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=sday_rp))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='sday_rp',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=eday_rp))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='eday_rp',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=sday_pd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='sday_pd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_mid,aes(longitude,latitude,color=eday_pd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='eday_pd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

write.csv(diff_last10year_mean,'output_csv/diff_last10year_mean.csv',row.names = FALSE)

## 添加气候信息
diff_last10year_mean <- left_join(diff_last10year_mean,site_clim[c('site','MAT','MAP','biome','dem')], by = 'site')

ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(color = nxylem_rp),size = 5)+
  scale_color_gradient2(name='nxylem_rp',high = 'red',low='blue',mid='white',midpoint = 0)

ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(color = nxylem_rd), size = 5)+
  scale_color_gradient2(name='nxylem_rd',high = 'red',low='blue',mid='white',midpoint = 0)

ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(color = nxylem_pd), size =5)+
  scale_color_gradient2(name='nxylem_pd',high = 'red',low='blue',mid='white',midpoint = 0)

## 相对变化
diff_last10year_nxylem <- diff_last10year[c('year','site','nxylem','nxylem_rd','nxylem_rp','nxylem_pd')]

diff_last10year_nxylem[c('renxylem_rd')] <- diff_last10year_nxylem[c('nxylem_rd')] / diff_last10year_nxylem['nxylem']
diff_last10year_nxylem[c('renxylem_rp')] <- diff_last10year_nxylem[c('nxylem_rp')] / diff_last10year_nxylem['nxylem']
diff_last10year_nxylem[c('renxylem_pd')] <- diff_last10year_nxylem[c('nxylem_pd')] / diff_last10year_nxylem['nxylem']
head(diff_last10year_nxylem)

## 因为有2012年 mo079这个点的 nxylem为0，所以计算相对时出错
diff_last10year_nxylem <- subset(diff_last10year_nxylem,diff_last10year_nxylem$nxylem != 0)


diff_last10year_nxymean <- diff_last10year_nxylem %>% group_by(site) %>% 
  summarise(across(-year, ~ mean(.x, na.rm = TRUE))) %>% 
  left_join(site_infos, by  ='site')
head(diff_last10year_nxymean)

write.csv(diff_last10year_nxymean,'output_csv/diff_last10year_nxymean.csv',row.names = FALSE)

ggplot(data = diff_last10year_nxymean,aes(longitude,latitude,color=renxylem_rd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,75),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_nxymean,aes(longitude,latitude,color=renxylem_rp))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_rp',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

ggplot(data = diff_last10year_nxymean,aes(longitude,latitude,color=renxylem_pd))+
  borders('world',size =1,colour = 'black')+
  scale_color_gradient2(name='nxylem_pd',high = 'red',low='blue',mid='white',midpoint = 0)+
  geom_point(size = 3)+
  coord_map(orientation = c(90, 0, 0),xlim = c(-160,45),ylim = c(25,70))+
  labs(x = 'LON' ,y = 'LAT')+
  theme(text = element_text(family="serif",face='bold',color = 'black'),
        axis.text = element_text(family="serif",size = 12,face = 'bold',color = 'black'))

## 添加
diff_last10year_nxymean <- left_join(diff_last10year_nxymean,site_clim[c('site','MAT','MAP','biome','dem')], by = 'site')
head(diff_last10year_nxymean)

ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_rp),size = 5)+
  scale_color_gradient2(name='nxylem_rp',high = 'red',low='blue',mid='white',midpoint = 0)

ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_rd), size = 5)+
  scale_color_gradient2(name='nxylem_rd',high = 'red',low='blue',mid='white',midpoint = 0)

ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_pd), size =5)+
  scale_color_gradient2(name='nxylem_pd',high = 'red',low='blue',mid='white',midpoint = 0)


##=====比较速率=======
## 按照r-d的正负 划分点，然后看生长速率的差别
## GR 要根据物候把之前的都设为0
site_class <- ifelse(diff_last10year_nxymean$renxylem_rd > 0, 'po','ne')
site_class_df <- data.frame('site' = diff_last10year_nxymean$site, 'site_class' = site_class)
head(site_class_df)
  
raw_last10daily <- data_raw_output_daily %>% filter(year > 2005) %>% left_join(site_class_df,by='site') %>% 
  left_join(data_raw_output_year[c('year','site','fday')], by = c('site','year'))
View(raw_last10daily)

np_last10daily <- data_np_output_daily %>% filter(year > 2005) %>% left_join(site_class_df,by='site') %>% 
  left_join(data_de_output_year[c('year','site','fday')], by = c('site','year'))  ## np 使用的和 de一致的物候
de_last10daily <- data_de_output_daily %>% filter(year > 2005) %>% left_join(site_class_df,by='site') %>% 
  left_join(data_de_output_year[c('year','site','fday')], by = c('site','year'))


raw_last10daily_summ_np <- raw_last10daily %>%select(-c(year,site)) %>% mutate(day = as.numeric(day)) %>% 
  mutate(gruse = if_else(day<fday,0,gr)) %>% 
  group_by(site_class,day) %>% 
  summarise_all(list(mean = mean, mid = median, std = sd)) %>% mutate(exp_class = 'raw')
head(raw_last10daily_summ_np)

summary(raw_last10daily_summ_np)


ggplot(data = raw_last10daily_summ_np, aes(day, gr_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gr_mean - gr_std, 
                   ymax = gr_mean + gr_std,fill = site_class),
               alpha = 0.3,colour = NA)
ggplot(data = raw_last10daily_summ_np, aes(day, gruse_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gruse_mean - gruse_std, 
                   ymax = gruse_mean + gruse_std,fill = site_class),
               alpha = 0.3,colour = NA)

de_last10daily_summ_np <- de_last10daily %>%select(-c(year,site)) %>% mutate(day = as.numeric(day)) %>% 
  mutate(gruse = if_else(day<fday,0,gr)) %>% 
  group_by(site_class,day) %>% 
  summarise_all(list(mean = mean, mid = median, std = sd)) %>% mutate(exp_class = 'de')
head(de_last10daily_summ_np)

summary(de_last10daily_summ_np)


ggplot(data = de_last10daily_summ_np, aes(day, gr_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gr_mean - gr_std, 
                   ymax = gr_mean + gr_std,fill = site_class),
               alpha = 0.3,colour = NA)
ggplot(data = de_last10daily_summ_np, aes(day, gruse_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gruse_mean - gruse_std, 
                   ymax = gruse_mean + gruse_std,fill = site_class),
               alpha = 0.3,colour = NA)

np_last10daily_summ_np <- np_last10daily %>%select(-c(year,site)) %>% mutate(day = as.numeric(day)) %>% 
  mutate(gruse = if_else(day<fday,0,gr)) %>% 
  group_by(site_class,day) %>% 
  summarise_all(list(mean = mean, mid = median, std = sd)) %>% mutate(exp_class = 'np')
head(np_last10daily_summ_np)

summary(np_last10daily_summ_np)


ggplot(data = np_last10daily_summ_np, aes(day, gr_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gr_mean - gr_std, 
                   ymax = gr_mean + gr_std,fill = site_class),
               alpha = 0.3,colour = NA)
ggplot(data = np_last10daily_summ_np, aes(day, gruse_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = gruse_mean - gruse_std, 
                   ymax = gruse_mean + gruse_std,fill = site_class),
               alpha = 0.3,colour = NA)

all_last10daily_summ_np <- rbind(raw_last10daily_summ_np,de_last10daily_summ_np,np_last10daily_summ_np)
head(all_last10daily_summ_np)

ggplot(data = all_last10daily_summ_np, aes(day, gr_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = gr_mean - gr_std, 
                   ymax = gr_mean + gr_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)

ggplot(data = all_last10daily_summ_np, aes(day, gruse_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = gruse_mean - gruse_std, 
                   ymax = gruse_mean + gruse_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)

ggplot(data = all_last10daily_summ_np, aes(day, grt_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = grt_mean - grt_std, 
                   ymax = grt_mean + grt_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)

ggplot(data = all_last10daily_summ_np, aes(day, grw_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = grw_mean - grw_std, 
                   ymax = grw_mean + grw_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)

ggplot(data = all_last10daily_summ_np, aes(day, ncell_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = ncell_mean - ncell_std, 
                   ymax = ncell_mean + ncell_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  xlim(1,365)+
  facet_wrap(.~site_class)

##====计算每一天的生长限制因子=======
raw_last10_torw <- raw_last10daily %>% mutate(day = as.numeric(day)) %>% 
  mutate(grdiff = grt-grw) %>% 
  group_by(site_class,day) %>% 
  summarise(grdiff_mean = mean(grdiff), grdiff_mid = median(grdiff), grdiff_std = sd(grdiff)) %>% 
  mutate(exp_class = 'raw')
head(raw_last10_torw)

ggplot(data = raw_last10_torw, aes(day, grdiff_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = grdiff_mean - grdiff_std, 
                   ymax = grdiff_mean + grdiff_std,fill = site_class),
               alpha = 0.3,colour = NA)

de_last10_torw <- de_last10daily %>% mutate(day = as.numeric(day)) %>% 
  mutate(grdiff = grt-grw) %>% 
  group_by(site_class,day) %>% 
  summarise(grdiff_mean = mean(grdiff), grdiff_mid = median(grdiff), grdiff_std = sd(grdiff)) %>% 
  mutate(exp_class = 'de')
head(de_last10_torw)

ggplot(data = de_last10_torw, aes(day, grdiff_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = grdiff_mean - grdiff_std, 
                   ymax = grdiff_mean + grdiff_std,fill = site_class),
               alpha = 0.3,colour = NA)

np_last10_torw <- np_last10daily %>% mutate(day = as.numeric(day)) %>% 
  mutate(grdiff = grt-grw) %>% 
  group_by(site_class,day) %>% 
  summarise(grdiff_mean = mean(grdiff), grdiff_mid = median(grdiff), grdiff_std = sd(grdiff)) %>% 
  mutate(exp_class = 'np')
head(np_last10_torw)

ggplot(data = np_last10_torw, aes(day, grdiff_mean, color = site_class) )+
  geom_line()+
  geom_ribbon( aes(ymin = grdiff_mean - grdiff_std, 
                   ymax = grdiff_mean + grdiff_std,fill = site_class),
               alpha = 0.3,colour = NA)

all_last10_torw <- rbind(raw_last10_torw,de_last10_torw,np_last10_torw)
head(all_last10_torw)

ggplot(data = all_last10_torw, aes(day, grdiff_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = grdiff_mean - grdiff_std, 
                   ymax = grdiff_mean + grdiff_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)


##=====分析蒸散发和土壤水分的变化=====
head(all_last10daily_summ_np)

ggplot(data = all_last10daily_summ_np, aes(day, trans_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = trans_mean - trans_std, 
                   ymax = trans_mean + trans_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)

ggplot(data = all_last10daily_summ_np, aes(day, sm_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = sm_mean - sm_std, 
                   ymax = sm_mean + sm_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  facet_wrap(.~site_class)


##========拟合一下点之间的分割线========

data_fit_use <- diff_last10year_nxymean[c('site','nxylem_rd','MAT','MAP')]
data_fit_use['po_ne'] <- ifelse(data_fit_use$nxylem_rd>0, 1, 0)

ggplot(data_fit_use, aes(MAT, MAP, color = po_ne)) + geom_point()

model_fit <- glm(po_ne ~ MAT + MAP, data=data_fit_use, family=binomial)
summary(model_fit)

coef(model_fit)

b0 <- coef(model_fit)[1]
b1 <- coef(model_fit)[2]
b2 <- coef(model_fit)[3]

k <- -b1 / b2  ## 59.95572 
b <- -b0 / b2  ## 521.0222

plot(data_fit_use$MAT, data_fit_use$MAP, col=data_fit_use$po_ne+1, pch=19)

x_vals <- seq(min(data_fit_use$MAT)-2, max(data_fit_use$MAT)+2, length=100)
y_vals <- k*x_vals + b

lines(x_vals, y_vals, col="blue", lwd=2)

fitted_line <- data.frame('MAT'=x_vals,'MAP'=y_vals)
fitted_line


