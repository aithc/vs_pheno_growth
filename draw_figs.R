library(dplyr)
library(tidyr)
library(ggplot2)
library(patchwork)

###=========figure1=======================

fig1_1 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = nxylem_rd),size = 5,shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        limits = c(-5, 6), oob = scales::squish,
                        breaks = seq(-4,6,2))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

fig1_2 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = nxylem_rp), size = 5,shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        limits = c(-5, 6), oob = scales::squish,
                        breaks = seq(-4,6,2))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

fig1_3 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = nxylem_pd), size =5,shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        limits = c(-5, 6), oob = scales::squish,
                        breaks = seq(-4,6,2))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

tiff(file="figure/nxylem_on_climate_same_fill_limit_addline.tiff", width = 7, height = 12, units = 'in', res = 300, compression = 'lzw')
fig1_1/fig1_2/fig1_3+plot_annotation(tag_levels = 'a')+ plot_layout(axis_titles = "collect_x")

dev.off()


fig1_1 <- ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(fill = nxylem_rd),size = 5)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks = seq(-4,6,2))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

fig1_2 <- ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(color = nxylem_rp), size = 5)+
  scale_color_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks = seq(-0.5,1.5,0.5),labels = c('-0.5','0','0.5','1','1.5'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

fig1_3 <- ggplot(data = diff_last10year_mean, aes(MAT,MAP))+
  geom_point(aes(color = nxylem_pd), size =5)+
  scale_color_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks = seq(-5,5,2.5),,labels = c('-5','-2.5','0','2.5','5'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

tiff(file="figure/nxylem_on_climate_1row.tiff", width = 15, height = 5, units = 'in', res = 300, compression = 'lzw')
fig1_1+fig1_2+fig1_3+plot_annotation(tag_levels = 'a')+ plot_layout(axis_titles = "collect_y")

dev.off()

###=====figure2=======

fig2_1 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = renxylem_rd),size = 5, shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        limits = c(-0.16, 0.5), oob = scales::squish,
                        breaks =seq(-0.15,0.45,0.15),labels = c('-0.15','0.00','0.15','0.30','0.45'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

fig2_2 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = renxylem_rp), size = 5, shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        limits = c(-0.16, 0.5), oob = scales::squish,
                        breaks =seq(-0.15,0.45,0.15),labels = c('-0.15','0.00','0.15','0.30','0.45'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

fig2_3 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_line(data=fitted_line, aes(MAT,MAP), linewidth = 1.5, alpha = 0.6, color = '#7A8B8B') +
  geom_point(aes(fill = renxylem_pd), size =5, shape = 21,color = 'gray50',stroke = 0.2)+
  scale_fill_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                       limits = c(-0.16, 0.5), oob = scales::squish,
                       breaks =seq(-0.15,0.45,0.15),labels = c('-0.15','0.00','0.15','0.30','0.45'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

tiff(file="figure/nxylem_on_climate_re_same_fill_limit_addline.tiff", width = 7, height = 12, units = 'in', res = 300, compression = 'lzw')
fig2_1/fig2_2/fig2_3+plot_annotation(tag_levels = 'a')+ plot_layout(axis_titles = "collect_x")

dev.off()

fig2_1 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_rd),size = 5)+
  scale_color_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks =seq(-0.15,0.45,0.15),labels = c('-0.15','0','.15','.3','.45'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

fig2_2 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_rp), size = 5)+
  scale_color_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks =c(0,0.05,0.1),labels = c('0','.05','.1'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

fig2_3 <- ggplot(data = diff_last10year_nxymean, aes(MAT,MAP))+
  geom_point(aes(color = renxylem_pd), size =5)+
  scale_color_gradient2(name='Nxylem',high = 'red',low='blue',mid='white',midpoint = 0,
                        breaks =seq(-0.15,0.45,0.15),labels = c('-0.15','0','.15','.3','.45'))+
  scale_x_continuous(limits = c(-8,23),breaks = seq(-5,20,5))+
  theme_bw()+
  lims(y=c(0,2100))+
  labs(x='Mean annual temperature / ℃',y='Mean annual precipitation / mm')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'top')

tiff(file="figure/nxylem_on_climate_re_1row.tiff", width = 15, height = 5, units = 'in', res = 300, compression = 'lzw')
fig2_1+fig2_2+fig2_3+plot_annotation(tag_levels = 'a')+ plot_layout(axis_titles = "collect_y")

dev.off()


###=========figure3============================
gruse_last10daily_draw <- all_last10daily_summ_np[c('site_class','day','gruse_mean','gruse_std','exp_class')]
colnames(gruse_last10daily_draw) <- c('site_class','day','g_mean','g_std','exp_class')
gruse_last10daily_draw['type'] <- 'GR'
head(gruse_last10daily_draw)

grt_last10daily_draw <- all_last10daily_summ_np[c('site_class','day','grt_mean','grt_std','exp_class')]
colnames(grt_last10daily_draw) <- c('site_class','day','g_mean','g_std','exp_class')
grt_last10daily_draw['type'] <- 'GR_T'
head(grt_last10daily_draw)

grw_last10daily_draw <- all_last10daily_summ_np[c('site_class','day','grw_mean','grw_std','exp_class')]
colnames(grw_last10daily_draw) <- c('site_class','day','g_mean','g_std','exp_class')
grw_last10daily_draw['type'] <- 'GR_W'
head(grw_last10daily_draw)

all_last10daily_gr_draw <- rbind(gruse_last10daily_draw,grt_last10daily_draw,grw_last10daily_draw)
summary(all_last10daily_gr_draw)  

all_last10daily_gr_draw$exp_class <- factor(all_last10daily_gr_draw$exp_class, 
                                            levels = c("raw", "np", "de"), ordered = TRUE)

label_site <- c(ne = "HOT-DRY", po = "COLD-WET")

tiff(file="figure/gr_wt_com.tiff", width = 10, height = 6, units = 'in', res = 300, compression = 'lzw')
ggplot(data = all_last10daily_gr_draw, aes(day, g_mean, color = exp_class) )+
  geom_line(linewidth = 0.6)+
  geom_ribbon( aes(ymin = g_mean - g_std, 
                   ymax = g_mean + g_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  scale_color_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  scale_fill_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  facet_grid(rows=vars(site_class),cols = vars(type),labeller = labeller(site_class = label_site))+
  scale_x_continuous(limits = c(0,365),breaks = seq(0,300,100))+
  theme_bw()+
  labs(x='DOY',y='Growth rates')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'bottom')

dev.off()

###===========figure4=====================

all_last10daily_summ_np$exp_class <- factor(all_last10daily_summ_np$exp_class, 
                                            levels = c("raw", "np", "de"), ordered = TRUE)

fig4_1 <- ggplot(data = all_last10daily_summ_np, aes(day, trans_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = trans_mean - trans_std, 
                   ymax = trans_mean + trans_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 0.6)+
  scale_color_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  scale_fill_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site) )+
  scale_x_continuous(limits = c(0,365),breaks = seq(0,300,100))+
  theme_bw()+
  labs(x='',y='Transpiration / mm/d')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

fig4_2 <- ggplot(data = all_last10daily_summ_np, aes(day, sm_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = sm_mean - sm_std, 
                   ymax = sm_mean + sm_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 0.6)+
  scale_color_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  scale_fill_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site) )+
  scale_x_continuous(limits = c(0,365),breaks = seq(0,300,100))+
  theme_bw()+
  labs(x='DOY',y='Soil moisture / v/v')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

tiff(file="figure/trans_sm_com.tiff", width = 10, height = 7, units = 'in', res = 300, compression = 'lzw')
fig4_1/fig4_2+plot_annotation(tag_levels = 'a')+ plot_layout(axis_titles = "collect_x",guides = 'collect')

dev.off()

###=======figure5==============
all_last10_torw$exp_class <- factor(all_last10_torw$exp_class, 
                                            levels = c("raw", "np", "de"), ordered = TRUE)
tiff(file="figure/temp_water_lim.tiff", width = 8, height = 5, units = 'in', res = 300, compression = 'lzw')
ggplot(data = all_last10_torw, aes(day, grdiff_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = grdiff_mean - grdiff_std, 
                   ymax = grdiff_mean + grdiff_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 0.6)+
  geom_hline(yintercept = 0, color = "gray", linetype = "dashed", size = 0.8)+
  scale_color_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  scale_fill_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site) )+
  scale_x_continuous(limits = c(0,365),breaks = seq(0,300,100))+
  theme_bw()+
  labs(x='DOY',y='GR_T - GR_W')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')
dev.off()

###=====figure6================

all_last10daily_summ_np$exp_class <- factor(all_last10daily_summ_np$exp_class, 
                                    levels = c("raw", "np", "de"), ordered = TRUE)

tiff(file="figure/ncell_com.tiff", width = 8, height = 5, units = 'in', res = 300, compression = 'lzw')
ggplot(data = all_last10daily_summ_np, aes(day, ncell_mean, color = exp_class) )+
  geom_ribbon( aes(ymin = ncell_mean - ncell_std, 
                   ymax = ncell_mean + ncell_std,fill = exp_class),
               alpha = 0.3,colour = NA)+
  geom_line(linewidth = 1)+
  scale_color_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  scale_fill_manual(name='EXP',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site) )+
  scale_x_continuous(limits = c(0,365),breaks = seq(0,300,100))+
  theme_bw()+
  labs(x='DOY',y='Nxylem')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')
dev.off()

###======figure7==========
data_np_output_year <-data_np_output_year %>%  left_join(site_class_df,by='site')
data_de_output_year <-data_de_output_year %>%  left_join(site_class_df,by='site')
data_raw_output_year <-data_raw_output_year %>%  left_join(site_class_df,by='site')

data_raw_year_sitemean <- data_raw_output_year %>% group_by(site_class,year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)
data_de_year_sitemean <- data_de_output_year %>% group_by(site_class,year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)
data_np_year_sitemean <- data_np_output_year %>% group_by(site_class,year) %>% summarise_if(is.numeric,mean, na.rm=TRUE)

fig7_1 <- ggplot() + geom_line(data = data_np_output_year,aes(year,nxylem,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,nxylem,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,nxylem,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemean,aes(year,nxylem),color = 'green',linewidth = 1.5)+
  geom_line(data = data_raw_year_sitemean,aes(year,nxylem),color = 'red',linewidth = 1.5)+
  geom_line(data = data_de_year_sitemean,aes(year,nxylem),color = 'blue',linewidth = 1.5)+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site))+
  scale_x_continuous(limits = c(1960,2015),breaks = seq(1960,2015,15))+
  theme_bw()+
  labs(x='Year',y='Nxylem')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

try_legend <- data.frame(x = c(3,4,5),y=c(1,1,1),
                         le = c(2.8,3.8,4.8),
                         ri = c(3.2,4.2,5.2),
                         co = c('1','2','3'),
                         te = c('EXP_raw','EXP_np','EXP_de'))
fig7_2 <- ggplot(try_legend,aes(x,y)) + geom_linerange(aes(xmin =le ,xmax=ri,color =co), linewidth = 1)+
  geom_text(aes(label = te), vjust = 1.5, hjust = 0.5,size = 4,family = "serif")+
  annotate("text", x = 2.2, y = 1, label = "EXP", color = "black", size = 5,family = "serif")+
  scale_color_manual(guide = 'none',values = c('red','green','blue'),labels = c('EXP_raw','EXP_np','EXP_de'))+
  theme_void()

layout_try <- "
#BBBB#
AAAAAA
AAAAAA
AAAAAA
AAAAAA
AAAAAA
AAAAAA
"

tiff(file="figure/nxylem_year.tiff", width = 8, height = 5, units = 'in', res = 300, compression = 'lzw')
fig7_1 /fig7_2 + plot_layout(design = layout_try)
dev.off()

###==============figure8=============
fig8_1 <- ggplot() + geom_line(data = data_np_output_year,aes(year,sday,group = site),color = 'green',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_raw_output_year,aes(year,sday,group = site),color = 'red',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_de_output_year,aes(year,sday,group = site),color = 'blue',alpha = 0.2,linewidth = 0.5)+
  geom_line(data = data_np_year_sitemean,aes(year,sday),color = 'green',linewidth = 1.5)+
  geom_line(data = data_raw_year_sitemean,aes(year,sday),color = 'red',linewidth = 1.5)+
  geom_line(data = data_de_year_sitemean,aes(year,sday),color = 'blue',linewidth = 1.5)+
  facet_wrap(.~site_class,labeller = labeller(site_class = label_site))+
  scale_x_continuous(limits = c(1960,2015),breaks = seq(1960,2015,15))+
  theme_bw()+
  labs(x='Year',y='Sday')+
  theme(text = element_text(family = "serif",face='bold',size = 15),
        legend.position = 'right')

tiff(file="figure/sday_year.tiff", width = 8, height = 5, units = 'in', res = 300, compression = 'lzw')
fig8_1 /fig7_2 + plot_layout(design = layout_try)
dev.off()

