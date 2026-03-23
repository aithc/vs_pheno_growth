#========== 提取一下每个点的气候=========================

library(raster)


##=========bioclimate=============
bio_path <- c('D:/data/bioclimate/wc2.1_30s_bio_1.tif','D:/data/bioclimate/wc2.1_30s_bio_12.tif')

bio_data <- stack(bio_path)
bio_data

bio_ex <- raster::extract(bio_data, site_infos[c('longitude','latitude')])
View(bio_ex)
colnames(bio_ex) <- c('MAT','MAP')

bio_ex <- as.data.frame(bio_ex)
site_clim <- cbind(site_infos[c('site','longitude','latitude','elevation')], bio_ex)
head(site_clim)

rm(bio_data)
##=======biomes=================
biome <- raster('D:/data/official_teow/biome.tif')
biome
plot(biome)

biome_ex <- raster::extract(biome, site_infos[c('longitude','latitude')])
View(biome_ex)

site_clim['biome'] <- biome_ex
head(site_clim)
table(site_clim$biome)

rm(biome)
##======dem=================
dem <- raster('D:/data/dem_30s_elev/wc2.1_30s_elev.tif')
dem
dem_ex <- raster::extract(dem, site_infos[c('longitude','latitude')])

site_clim['dem'] <- dem_ex
head(site_clim)

rm(dem)
