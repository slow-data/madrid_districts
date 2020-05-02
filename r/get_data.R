#===========================================
# @Project: Districts of Madrid
# @Name: get_data
# @author: jprimav
# @date: 2020/03
#===========================================

rm(list=ls())

## --- Libraries
library(rgdal) # R's interface to the popular C/C++ spatial data processing library gdal
library(overpass)
library(here)

sessionInfo()

# R version 3.5.3 (2019-03-11)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows >= 8 x64 (build 9200)

# Downlopad shape of M30 highway from OSM
m30_opq <- '[out:xml][timeout:100];
(
  rel(5518772);
);
(._;>;);
out body;'
  
m30 <- overpass_query(m30_opq)
plot(m30)
proj4string(m30) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")
summary(m30)
writeOGR(m30, here("shapes", "M30"), "M30", driver="ESRI Shapefile")

# Downlopad shape of Manzanares highway from OSM
manzanares_opq <- '[out:xml][timeout:100];
(
  relation  ["name:en"="Manzanares"];
);
  (._;>;);
  out body;'

manzanares <- overpass_query(manzanares_opq)
summary(manzanares)
plot(manzanares)
proj4string(manzanares) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")
summary(manzanares)
writeOGR(manzanares, here("shapes", "Manzanares"), "Manzanares", driver="ESRI Shapefile")

  