#===========================================
# @Project: Districts of Madrid
# @Name: viz
# @author: jprimav
# @date: 2020/02
#===========================================

# ------------------------
# Setup R
# ------------------------

rm(list=ls())

# Libraries
library(here) # 0.1
library(rgdal) # 1.2.18
library(rgeos) # 0.5.2
library(ggplot2) # 3.3.0.9000

sessionInfo()

# R version 3.5.3 (2019-03-11)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows >= 8 x64 (build 9200)

# ------------------------
# Prepare Geometries
# ------------------------

# Let's pick a CRS (Coordinate Reference System) to standardize all geometries and decide how to plot them in 2D 
# Let's use EPSG:32630 (WGS 84 / UTM zone 30N)
# This is the Universal Transverse Mercator (UTM) for the zone between 6?W and 0?W, 
# northern hemisphere between equator and 84?N, onshore and offshore, including Spain.
# The transverse Mercator projection is the transverse aspect of the standard (or Normal) Mercator projection. 
# They share the same underlying mathematical construction and consequently many of the properites, including the conformal one.  
# A conformal projection distorts the shapes of moderately small areas only slightly and 
# it is the most widely applied of all projections for accurate large-scale maps, like this one.

# Read Madrid Districts
distritos <- readOGR(dsn = here("shapes", "DISTRITOS_ETRS89"), layer = "DISTRITOS")
distritos <- spTransform(distritos, CRS=CRS("+init=epsg:32630"))

# Read M30 Lines, previously downloaded from OSM and stored in /shapes/M30
m30 <- readOGR(dsn = here("shapes", "M30"), layer = "M30")
m30 <- spTransform(m30, CRS=CRS("+init=epsg:32630"))

# Visually check geometries are on the same CRS
plot(distritos, col = "lightblue")
plot(m30, col="red", add = T)

# Create a point for Puerta del Sol
sol_df <- data.frame(lon=-3.703475, lat=40.416982)
sol <- SpatialPoints(sol_df, proj4string = CRS("+init=epsg:4326"))
sol <- spTransform(sol, CRS=CRS("+init=epsg:32630"))
points(sol, col = "green", cex=2, pch=16)

# Create a point for Complutense University
complutense_df <- data.frame(lon=-3.729925, lat=40.445618)
complutense <- SpatialPoints(complutense_df, proj4string = CRS("+init=epsg:4326"))
complutense <- spTransform(complutense, CRS=CRS("+init=epsg:32630"))
points(complutense, col = "green", cex=2, pch=16)

# Create a point for Bernabeu
bernabeu_df <- data.frame(lon=-3.688341, lat=40.453078)
bernabeu <- SpatialPoints(bernabeu_df, proj4string = CRS("+init=epsg:4326"))
bernabeu <- spTransform(bernabeu, CRS=CRS("+init=epsg:32630"))
points(bernabeu, col = "green", cex=2, pch=16)

# Create a point for Nuevos Ministerios
nuevosmin_df <- data.frame(lon=-3.692030, lat=40.445163)
nuevosmin <- SpatialPoints(nuevosmin_df, proj4string = CRS("+init=epsg:4326"))
nuevosmin <- spTransform(nuevosmin, CRS=CRS("+init=epsg:32630"))
points(nuevosmin, col = "green", cex=2, pch=16)

# Create a point for Plaza de Olavide
olavide_df <- data.frame(lon=-3.701023, lat=40.432955)
olavide <- SpatialPoints(olavide_df, proj4string = CRS("+init=epsg:4326"))
olavide <- spTransform(olavide, CRS=CRS("+init=epsg:32630"))
points(olavide, col = "green", cex=2, pch=16)

# Create a point for Retiro Park
retiropark_df <- data.frame(lon=-3.683974, lat=40.417319)
retiropark <- SpatialPoints(retiropark_df, proj4string = CRS("+init=epsg:4326"))
retiropark <- spTransform(retiropark, CRS=CRS("+init=epsg:32630"))
points(retiropark, col = "green", cex=2, pch=16)

# Create a point for plaza de toros
toros_df <- data.frame(lon=-3.662968, lat=40.431942)
toros <- SpatialPoints(toros_df, proj4string = CRS("+init=epsg:4326"))
toros <- spTransform(toros, CRS=CRS("+init=epsg:32630"))
points(toros, col = "green", cex=2, pch=16)

# Create a point for plaza de matadero
matadero_df <- data.frame(lon=-3.697399, lat=40.391600)
matadero <- SpatialPoints(matadero_df, proj4string = CRS("+init=epsg:4326"))
matadero <- spTransform(matadero, CRS=CRS("+init=epsg:32630"))
points(matadero, col = "green", cex=2, pch=16)

# Create a point for Tribunal metro
tribunal_df <- data.frame(lon=-3.700824, lat=40.426499)
tribunal <- SpatialPoints(tribunal_df, proj4string = CRS("+init=epsg:4326"))
tribunal <- spTransform(tribunal, CRS=CRS("+init=epsg:32630"))
points(tribunal, col = "green", cex=2, pch=16)

# Create a point for Lavapies
lavapies_df <- data.frame(lon=-3.701237, lat=40.409024)
lavapies <- SpatialPoints(lavapies_df, proj4string = CRS("+init=epsg:4326"))
lavapies <- spTransform(lavapies, CRS=CRS("+init=epsg:32630"))
points(lavapies, col = "green", cex=2, pch=16)

# Create a point for Cibeles
cibeles_df <- data.frame(lon=-3.693274, lat=40.419637)
cibeles <- SpatialPoints(cibeles_df, proj4string = CRS("+init=epsg:4326"))
cibeles <- spTransform(cibeles, CRS=CRS("+init=epsg:32630"))
points(cibeles, col = "green", cex=2, pch=16)

# Create a point for Atocha
atocha_df <- data.frame(lon=-3.690406, lat=40.406630)
atocha <- SpatialPoints(atocha_df, proj4string = CRS("+init=epsg:4326"))
atocha <- spTransform(atocha, CRS=CRS("+init=epsg:32630"))
points(atocha, col = "green", cex=2, pch=16)

# Create a point for Chamartin station
stchamartin_df <- data.frame(lon=-3.682384, lat=40.472555)
stchamartin <- SpatialPoints(stchamartin_df, proj4string = CRS("+init=epsg:4326"))
stchamartin <- spTransform(stchamartin, CRS=CRS("+init=epsg:32630"))
points(stchamartin, col = "green", cex=2, pch=16)

# Create a point for Manuel Becerra
mbecerra_df <- data.frame(lon=-3.668501, lat=40.428410)
mbecerra <- SpatialPoints(mbecerra_df, proj4string = CRS("+init=epsg:4326"))
mbecerra <- spTransform(mbecerra, CRS=CRS("+init=epsg:32630"))
points(mbecerra, col = "green", cex=2, pch=16)

# Create a point for Plaza Mayor
mayor_df <- data.frame(lon=-3.707068, lat=40.415384)
mayor <- SpatialPoints(mayor_df, proj4string = CRS("+init=epsg:4326"))
mayor <- spTransform(mayor, CRS=CRS("+init=epsg:32630"))
points(mayor, col = "green", cex=2, pch=16)

# Create a point for Emabajadores
embajadores_df <- data.frame(lon=-3.702563, lat=40.405110)
embajadores <- SpatialPoints(embajadores_df, proj4string = CRS("+init=epsg:4326"))
embajadores <- spTransform(embajadores, CRS=CRS("+init=epsg:32630"))
points(embajadores, col = "green", cex=2, pch=16)

# Create a point for maravillas
maravillas_df <- data.frame(lon=-3.703356, lat=40.449035)
maravillas <- SpatialPoints(maravillas_df, proj4string = CRS("+init=epsg:4326"))
maravillas <- spTransform(maravillas, CRS=CRS("+init=epsg:32630"))
points(maravillas, col = "green", cex=2, pch=16)

# Create a point for Vaguada
vaguada_df <- data.frame(lon=-3.706941, lat=40.479129)
vaguada <- SpatialPoints(vaguada_df, proj4string = CRS("+init=epsg:4326"))
vaguada <- spTransform(vaguada, CRS=CRS("+init=epsg:32630"))
points(vaguada, col = "green", cex=2, pch=16)

# Create a point for C. Caminos
ccaminos_df <- data.frame(lon=-3.703843, lat=40.446860)
ccaminos <- SpatialPoints(ccaminos_df, proj4string = CRS("+init=epsg:4326"))
ccaminos <- spTransform(ccaminos, CRS=CRS("+init=epsg:32630"))
points(ccaminos, col = "green", cex=2, pch=16)

# Create a point for Colon
colon_df <- data.frame(lon=-3.689052, lat=40.425007)
colon <- SpatialPoints(colon_df, proj4string = CRS("+init=epsg:4326"))
colon <- spTransform(colon, CRS=CRS("+init=epsg:32630"))
points(colon, col = "green", cex=2, pch=16)

# Create a point for Pl. Espana
pespana_df <- data.frame(lon=-3.712519, lat=40.423240)
pespana <- SpatialPoints(pespana_df, proj4string = CRS("+init=epsg:4326"))
pespana <- spTransform(pespana, CRS=CRS("+init=epsg:32630"))
points(pespana, col = "green", cex=2, pch=16)

# Create a point for Puerta de Alcala
palcala_df <- data.frame(lon=-3.688928, lat=40.419895)
palcala <- SpatialPoints(palcala_df, proj4string = CRS("+init=epsg:4326"))
palcala <- spTransform(palcala, CRS=CRS("+init=epsg:32630"))
points(palcala, col = "green", cex=2, pch=16)

# Create a point for Castillo de Vinuealas
vinuelas_df <- data.frame(lon=-3.646538, lat=40.609359)
vinuelas <- SpatialPoints(vinuelas_df, proj4string = CRS("+init=epsg:4326"))
vinuelas <- spTransform(vinuelas, CRS=CRS("+init=epsg:32630"))
points(vinuelas, col = "green", cex=2, pch=16)

# Save Work In Progress 1
dev.copy(png, here("out", "wip1.png"))
dev.off()

# Use m30 to split Moncloa district
moncloa <- distritos[which(distritos@data[,"CODDISTRIT"]=="9"),]
lpi <- gIntersection(moncloa, m30) # intersect your line with the polygon
blpi <- gBuffer(lpi, width = 0.00001)  # create a very thin polygon buffer of the intersected line
dpi <- gDifference(moncloa, blpi) # split using gDifference
moncloa_west <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[1]]), "west")))
moncloa_east <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[3]]), "east")))
moncloa_split <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[2]]), "split")))
proj4string(moncloa_east) <- CRS("+init=epsg:32630")
proj4string(moncloa_west) <- CRS("+init=epsg:32630")
proj4string(moncloa_split) <- CRS("+init=epsg:32630")
plot(moncloa)
plot(moncloa_east, col="lightgreen", add=T)
plot(moncloa_west, col="lightgrey", add=T)
plot(m30, add=T, col="red")

# Save Work In Progress 3
dev.copy(png, here("out", "wip2.png"))
dev.off()

# Use m30 to split Fuencarral district
fuencarral <- distritos[which(distritos@data[,"CODDISTRIT"]=="8"),]
lpi <- gIntersection(fuencarral, m30)
blpi <- gBuffer(lpi, width = 0.00001)
dpi <- gDifference(fuencarral, blpi)
fuencarral_north <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[1]]), "north")))
fuencarral_south <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[4]]), "south")))
proj4string(fuencarral_north) <- CRS("+init=epsg:32630")
proj4string(fuencarral_south) <- CRS("+init=epsg:32630")
plot(fuencarral)
plot(fuencarral_north, col="lightgreen", add=T)
plot(fuencarral_south, col="lightgrey", add=T)
plot(m30, add=T, col="red")

# Save Work In Progress 3
dev.copy(png, here("out", "wip3.png"))
dev.off()

# Extract distritos fully within M30 (Almendra Central)
almendra <- distritos[which(distritos@data[,"CODDISTRIT"] %in% c("1", "2", "3", "4", "5", "6", "7")),]
centro <- distritos[which(distritos@data[,"CODDISTRIT"]=="1"),]
arganzuela <- distritos[which(distritos@data[,"CODDISTRIT"]=="2"),]
retiro <- distritos[which(distritos@data[,"CODDISTRIT"]=="3"),]
salamanca <- distritos[which(distritos@data[,"CODDISTRIT"]=="4"),]
chamartin <- distritos[which(distritos@data[,"CODDISTRIT"]=="5"),]
tetuan <- distritos[which(distritos@data[,"CODDISTRIT"]=="6"),]
chamberi <- distritos[which(distritos@data[,"CODDISTRIT"]=="7"),]

# Union together subgeometries of Almendra SpatialPolygons
uAlmendra <- gUnaryUnion(almendra) 

# Union together subgeometries of Districts SpatialPolygons
uDistritos <- gUnaryUnion(distritos) 

# Extract distritos fully outside M30
latina <- distritos[which(distritos@data[,"CODDISTRIT"]=="10"),]
carabanchel <- distritos[which(distritos@data[,"CODDISTRIT"]=="11"),]
usera <- distritos[which(distritos@data[,"CODDISTRIT"]=="12"),]
puente_de_vallecas <- distritos[which(distritos@data[,"CODDISTRIT"]=="13"),]
moratalaz <- distritos[which(distritos@data[,"CODDISTRIT"]=="14"),]
ciudad_lineal <- distritos[which(distritos@data[,"CODDISTRIT"]=="15"),]
hortaleza <- distritos[which(distritos@data[,"CODDISTRIT"]=="16"),]

# Use m30 to split Madrid unified district polygon between inner and outer M30
lpi <- gIntersection(uDistritos, m30)
blpi <- gBuffer(lpi, width = 0.00001)
dpi <- gDifference(uDistritos, blpi)
uDistritos_inner <- SpatialPolygons(list(Polygons(list(dpi@polygons[[1]]@Polygons[[2]]), "2"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[3]]), "3"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[4]]), "4"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[5]]), "5"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[6]]), "6"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[7]]), "7"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[8]]), "8"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[9]]), "9"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[10]]), "10"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[11]]), "11"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[12]]), "12"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[13]]), "13"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[14]]), "14"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[15]]), "15"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[16]]), "16"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[17]]), "17"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[18]]), "18"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[19]]), "19"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[20]]), "20"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[21]]), "21"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[22]]), "22"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[23]]), "23"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[24]]), "24"),
                                         Polygons(list(dpi@polygons[[1]]@Polygons[[25]]), "25")
                                         ))

proj4string(uDistritos_inner) <- CRS("+init=epsg:32630")
plot(m30, col="red")
plot(uDistritos_inner, col="lightgreen", add=T)

# Union together subgeometries of uDistritos_inner SpatialPolygons
uDistritos_inner <- gUnaryUnion(uDistritos_inner) 

# Save Work In Progress 4
dev.copy(png, here("out", "wip4.png"))
dev.off()

# Get outer madrid
uDistritos_outer <- gDifference(uDistritos, uDistritos_inner)
proj4string(uDistritos_outer) <- CRS("+init=epsg:32630")
plot(uDistritos_outer, col = "red")

# Save Work In Progress 5
dev.copy(png, here("out", "wip5.png"))
dev.off()

# Read Shape file with Madrid VIALES_SHP
ogrInfo(here("shapes", "VIALES_SHP"), "VIALES")
viales <- readOGR(dsn = here("shapes", "VIALES_SHP"), layer = "VIALES")
viales <- spTransform(viales, CRS=CRS("+init=epsg:32630"))
summary(viales)
plot(uDistritos_inner, col="lightgreen")
plot(viales, col="red", add=T)

# Save Work In Progress 6
dev.copy(png, here("out", "wip6.png"))
dev.off()

# Create polygon of m30
bm30 <- gBuffer(m30, width = 50)
proj4string(bm30) <- CRS("+init=epsg:32630")

# Read Shape file with Manzanares river 
manzanares <- readOGR(dsn = here("shapes", "Manzanares"), layer = "Manzanares")
manzanares <- spTransform(manzanares, CRS=CRS("+init=epsg:32630"))
plot(manzanares, col="blue")


# ---------------------------------
# Prepare plot style and annotations
# ---------------------------------

# set fonts
windowsFonts(
  Impact=windowsFont("Impact"),
  Times=windowsFont("TT Times New Roman"),
  ArialBlack=windowsFont("Arial Black"),
  BookmanOldStyle=windowsFont("Bookman Old Style"),
  ComicSansMS=windowsFont("Comic Sans MS"),
  Symbol=windowsFont("Symbol")
)

# Colors
col_antiquewhite <- "#faebd7"
col_offwhite <- "#f8f8ff"
col_highlighter <- "#f35029"
col_antiquemap <- "#d9d1ba"


# ----------------------------------------------------------
# Plot - Central Madrid as delimited by M-30 Ring Road
# ----------------------------------------------------------

p <- ggplot() +
  coord_equal(xlim = c(uDistritos_inner@bbox[1,1]-600, uDistritos_inner@bbox[1,2]+1240), 
              ylim = c(uDistritos_inner@bbox[2,1], uDistritos_inner@bbox[2,2]+475),
              expand = FALSE) + 
  # inner madrid
  geom_polygon(data = centro, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = arganzuela, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = retiro, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = salamanca, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = chamartin, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = tetuan, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = chamberi, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = moncloa_east, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  geom_polygon(data = fuencarral_south, aes(long, lat, group=group), col = NA, fill=col_highlighter) +
  # outer madrid
  geom_polygon(data = latina, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = carabanchel, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = usera, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = puente_de_vallecas, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = moratalaz, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = ciudad_lineal, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = hortaleza, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = fuencarral_north, aes(long, lat, group=group), col = NA, fill="#008b45") +
  geom_polygon(data = moncloa_west, aes(long, lat, group=group), col = NA, fill="#008b45") +
  # river
  geom_path(data=manzanares, aes(x=long, y=lat, group=group), col="RoyalBlue3", alpha = 1, size = 2) +
  # roads
  geom_polygon(data=viales, aes(x=long, y=lat, group=group), fill="gray88", alpha = 0.4) + #gray76
  # District Borders
  geom_path(data = centro, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = arganzuela, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = retiro, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = salamanca, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = chamartin, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = tetuan, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = chamberi, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = moncloa_east, aes(long, lat, group=group), col = "black", size = .7) +
  geom_path(data = fuencarral_south, aes(long, lat, group=group), col = "black", size = .7) +
  # District names
  geom_text(data = as.data.frame(gCentroid(centro)@coords), aes(x = x, y = y), 
                  label = "Centro", size = 7, family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(arganzuela)@coords), aes(x = x, y = y), 
                  label = "Arganzuela", size = 7, family = "BookmanOldStyle", nudge_x = 0, nudge_y = 0) +
  geom_text(data = as.data.frame(gCentroid(retiro)@coords), aes(x = x, y = y), 
                  label = "Retiro", size = 7, family = "BookmanOldStyle", nudge_y = 0) +
  geom_text(data = as.data.frame(gCentroid(salamanca)@coords), aes(x = x, y = y), 
                  label = "Salamanca", size = 7, family = "BookmanOldStyle", nudge_y = 0) +
  geom_text(data = as.data.frame(gCentroid(chamartin)@coords), aes(x = x, y = y), 
                  label = "Chamart\u00edn", size = 7, family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(tetuan)@coords), aes(x = x, y = y), 
                  label = "Tetu\u00e1n", size = 7, family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(chamberi)@coords), aes(x = x, y = y), 
                  label = "Chamber\u00ed", size = 7, family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(moncloa_east)@coords), aes(x = x, y = y), 
                  label = "Moncloa", size = 7, family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(fuencarral_south)@coords), aes(x = x, y = y), 
                  label = "Fuencarral", size = 7, family = "BookmanOldStyle", nudge_y = 0) +
  # PoI
  geom_point(data = as.data.frame(mayor@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = mayor@coords[1], lat = mayor@coords[2]), 
                  aes(x = lon, y = lat), label = "Pl. Mayor",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120) +
  geom_point(data = as.data.frame(bernabeu@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = bernabeu@coords[1], lat = bernabeu@coords[2]), 
                  aes(x = lon, y = lat), label = "S. Bernab\u00e9u",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120, nudge_x = 150) +
  geom_point(data = as.data.frame(mbecerra@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = mbecerra@coords[1], lat = mbecerra@coords[2]), 
                  aes(x = lon, y = lat), label = "M. Becerra",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120) +
  geom_point(data = as.data.frame(complutense@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = complutense@coords[1], lat = complutense@coords[2]), 
                  aes(x = lon, y = lat), label = "Complutense",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120) +
  geom_point(data = as.data.frame(maravillas@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = maravillas@coords[1], lat = maravillas@coords[2]), 
                  aes(x = lon, y = lat), label = "M. Maravillas",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = 120) +
  geom_point(data = as.data.frame(retiropark@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = retiropark@coords[1], lat = retiropark@coords[2]), 
                  aes(x = lon, y = lat), label = "El Retiro",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120) +
  geom_point(data = as.data.frame(matadero@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = matadero@coords[1], lat = matadero@coords[2]), 
                  aes(x = lon, y = lat), label = "Matadero",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_x = 100, nudge_y = 120) +
  geom_point(data = as.data.frame(olavide@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = olavide@coords[1], lat = olavide@coords[2]), 
                  aes(x = lon, y = lat), label = "Pl. Olavide",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = -120) +
  geom_point(data = as.data.frame(vaguada@coords), aes(x = lon, y = lat), shape = 21, size = 2, fill = "black") +
  geom_text(data = data.frame(lon = vaguada@coords[1], lat = vaguada@coords[2]), 
                  aes(x = lon, y = lat), label = "La Vaguada",
                  size = 4, family = "BookmanOldStyle", fontface = "italic", nudge_y = 120, nudge_x = 100) +
  # Margins
  geom_rect(aes(xmin = -Inf, xmax = uDistritos_inner@bbox[1,1]-600+100, ymin = -Inf, ymax = Inf), fill = "black") + 
  geom_rect(aes(xmin = uDistritos_inner@bbox[1,2]+1240-100, xmax = Inf, ymin = -Inf, ymax = Inf), fill = "black") + 
  # Title
  geom_rect(aes(xmin = -Inf, xmax = +Inf, ymin = uDistritos_inner@bbox[2,2], ymax = Inf), fill = "black") + 
  geom_text(data = as.data.frame(list(
    x = (uDistritos_inner@bbox[1,1]-600)+((uDistritos_inner@bbox[1,2]+1240)-(uDistritos_inner@bbox[1,1]-600))/2,
    y = (uDistritos_inner@bbox[2,2])+((uDistritos_inner@bbox[2,2]+475)-(uDistritos_inner@bbox[2,2]))/2
    )),
    aes(x = x, y = y),
    label = "Central Madrid as delimited by M-30 Ring Road",
    family = "BookmanOldStyle", size=8, fontface = "bold", col = "white") +
  # Notes
  geom_rect(aes(xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = uDistritos_inner@bbox[2,1]+200), fill = "black") + 
  geom_text(data = as.data.frame(list(
    x = (uDistritos_inner@bbox[1,1]-600)+((uDistritos_inner@bbox[1,2]+1240)-(uDistritos_inner@bbox[1,1]-600))/2,
    y = (uDistritos_inner@bbox[2,1])+((uDistritos_inner@bbox[2,1]+200)-(uDistritos_inner@bbox[2,1]))/2)),
    aes(x = x, y = y),
    label = "Sources: Inst. Estadistica Com. de Madrid, GeoPortal Ay.to Madrid | EPSG:32630 | Created with R/ggplot2 | Twitter: @slow_data | IG: @jprimav",
    family = "BookmanOldStyle", size=2, col = "white") +
  # Theme
  theme(
    axis.title = element_blank(),
    axis.text =  element_blank(), 
    axis.ticks= element_blank(),
    axis.ticks.length = unit(0, "pt"),
    axis.line = element_blank(),
    panel.grid = element_blank(),
    plot.margin=grid::unit(c(0, 0, 0, 0), "in"),
    plot.background = element_rect(fill="blue"), # to check that plot ir removed
    panel.background = element_rect(fill=NULL),
    panel.border = element_rect(colour = NA, fill=NA)
  )

p

# Get the approximated aspect ratio of plot from coord_quickmap
coord <- coord_equal(xlim = c(uDistritos_inner@bbox[1,1]-600, uDistritos_inner@bbox[1,2]+1240), 
                     ylim = c(uDistritos_inner@bbox[2,1], uDistritos_inner@bbox[2,2]+475),
                     expand = FALSE)
asp <- coord$aspect(list(x.range = range(c(uDistritos_inner@bbox[1,1]-600, uDistritos_inner@bbox[1,2]+1240)), 
                         y.range = range(c(uDistritos_inner@bbox[2,1], uDistritos_inner@bbox[2,2]+475))))

asp

# Save plot in PNG
w <- 2000
r <- 230
png(here("out", "madrid_districts1.png"), bg = "black", width = w, height = w*asp, res = r, units = "px") 
print(p)
dev.off()


# ----------------------------------------------------------
# Plot - Central Madrid Districts in a Nutshell
# ----------------------------------------------------------

mxmin <- centro@bbox[1,1]-700
mxmax <- chamartin@bbox[1,2]-300
mymin <- centro@bbox[2,1]-800
mymax <- chamberi@bbox[2,2]+1000+600

# Is aspect ratio ok? (e.g. in IG maximum height/width is 1.25)
coord <- coord_equal(xlim = c(mxmin, mxmax), ylim = c(mymin, mymax), expand = FALSE)
asp <- coord$aspect(list(x.range = range(c(mxmin, mxmax)), y.range = range(c(mymin, mymax))))
asp

p <- ggplot() +
  coord_equal(xlim = c(mxmin, mxmax), 
              ylim = c(mymin, mymax),
              expand = FALSE) + 
  # inner madrid
  geom_polygon(data = centro, aes(long, lat, group=group), col = NA, fill="#8DD3C7") +
  geom_polygon(data = arganzuela, aes(long, lat, group=group), col = NA, fill="#FFFFB3") +
  geom_polygon(data = retiro, aes(long, lat, group=group), col = NA, fill="#B3DE69") +
  geom_polygon(data = salamanca, aes(long, lat, group=group), col = NA, fill="#FB8072") +
  geom_polygon(data = chamartin, aes(long, lat, group=group), col = NA, fill="#80B1D3") +
  geom_polygon(data = tetuan, aes(long, lat, group=group), col = NA, fill="#BEBADA") +
  geom_polygon(data = chamberi, aes(long, lat, group=group), col = NA, fill="#FDB462") +
  geom_polygon(data = moncloa_east, aes(long, lat, group=group), col = NA, fill="#FCCDE5") +
  # outer madrid
  geom_polygon(data = latina, aes(long, lat, group=group), col = NA, fill="grey") +
  geom_polygon(data = carabanchel, aes(long, lat, group=group), col = NA, fill="grey") +
  geom_polygon(data = puente_de_vallecas, aes(long, lat, group=group), col = NA, fill="grey") +
  geom_polygon(data = moncloa_west, aes(long, lat, group=group), col = NA, fill="grey") +
  geom_polygon(data = moncloa_split, aes(long, lat, group=group), col = NA, fill="grey") +
  # river
  geom_path(data=manzanares, aes(x=long, y=lat, group=group), col="RoyalBlue3", alpha = 1, size = 2) +
  # roads
  geom_polygon(data=viales, aes(x=long, y=lat, group=group), fill="gray88", alpha = .5) + #gray76
  # district description
  geom_text(data = as.data.frame(gCentroid(centro)@coords), aes(x = x, y = y), 
            label = "Energy, passion,\nbeating heart...", size = 6, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = as.data.frame(gCentroid(centro)@coords), aes(x = x, y = y), 
            label = "Genuine, eclectic downhill...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_x = 80, nudge_y = -1650) +
  geom_text(data = as.data.frame(gCentroid(retiro)@coords), aes(x = x, y = y), 
            label = "Classy,\nrefined,\nquiet oasis...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_x = -100) +
  geom_text(data = as.data.frame(gCentroid(salamanca)@coords), aes(x = x, y = y), 
            label = "Charm,\nelegance,\nold money...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_x = -100) +
  geom_text(data = as.data.frame(gCentroid(chamartin)@coords), aes(x = x, y = y), 
            label = "Dynamic,\nfar-flung,\nproud engine...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_y = -800) +
  geom_text(data = as.data.frame(gCentroid(tetuan)@coords), aes(x = x, y = y), 
            label = "No-frills,\ngritty\npulsating life...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_y = -900) +
  geom_text(data = as.data.frame(gCentroid(chamberi)@coords), aes(x = x, y = y), 
            label = "Agreeable,\n30-something\nlocal escape...", size = 6, fontface = "italic", family = "BookmanOldStyle") +
  geom_text(data = as.data.frame(gCentroid(moncloa_east)@coords), aes(x = x, y = y), 
            label = "Students...", size = 6, family = "BookmanOldStyle", fontface = "italic", nudge_y = -2800, nudge_x = 700) +
  # PoI
  geom_text(data = data.frame(lon = tribunal@coords[1], lat = tribunal@coords[2]), 
            aes(x = lon, y = lat), label = "Tribunal",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = bernabeu@coords[1], lat = bernabeu@coords[2]), 
            aes(x = lon, y = lat), label = "S. Bernab\u00e9u",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = palcala@coords[1], lat = palcala@coords[2]), 
            aes(x = lon, y = lat), label = "P.ta Alcala",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = pespana@coords[1], lat = pespana@coords[2]), 
            aes(x = lon, y = lat), label = "Pl. Espana",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = ccaminos@coords[1], lat = ccaminos@coords[2]), 
            aes(x = lon, y = lat), label = "C. Caminos",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = colon@coords[1], lat = colon@coords[2]), 
            aes(x = lon, y = lat), label = "Colon",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = embajadores@coords[1], lat = embajadores@coords[2]), 
            aes(x = lon, y = lat), label = "Embajadores",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = olavide@coords[1], lat = olavide@coords[2]), 
            aes(x = lon, y = lat), label = "Pl. Olavide",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  geom_text(data = data.frame(lon = vaguada@coords[1], lat = vaguada@coords[2]), 
            aes(x = lon, y = lat), label = "La Vaguada",
            size = 4, family = "BookmanOldStyle", fontface = "italic") +
  # Margins
  geom_rect(aes(xmin = mxmin-9999, xmax = mxmin+100, ymin = mymin-9999, ymax = mymax+9999), fill = "black") + 
  geom_rect(aes(xmin = mxmax-100, xmax = mxmax+9999, ymin = mymin-9999, ymax = mymax+9999), fill = "black") + 
  # Title
  geom_rect(aes(xmin = mxmin-9999, xmax = mxmax+9999, ymin = mymax-600, ymax = mymax+9999), fill = "black") + 
  geom_text(data = as.data.frame(list(x = mxmin+(mxmax-mxmin)/2, y = (mymax-600)+(mymax-(mymax-600))/2)),
  aes(x = x, y = y),
  label = "Central Madrid Districts in a Nutshell", #  Districts in a Nutshell
  family = "BookmanOldStyle", size=8, fontface = "bold", col = "white") +
  # Notes
  geom_rect(aes(xmin = mxmin-9999, xmax = mxmax+9999, ymin = mymin-9999, ymax = mymin+300), fill = "black") + 
  geom_text(data = as.data.frame(list(x = mxmin+(mxmax-mxmin)/2, y = mymin+(mymin+300-mymin)/2)),
    aes(x = x, y = y),
    label = "Sources: Open Data of Comunidad/Ayuntamiento Madrid | Created with R/ggplot2 | Twitter: @slow_data | IG: @jprimav", # 
    family = "BookmanOldStyle", size=3, col = "white") +
  # Theme
  theme(
    axis.title = element_blank(),
    axis.text =  element_blank(), 
    axis.ticks= element_blank(),
    axis.ticks.length = unit(0, "pt"),
    legend.box.spacing = unit(0, "mm"),
    axis.line = element_blank(),
    panel.grid = element_blank(),
    plot.margin=grid::unit(c(0, 0, 0, 0), "mm"),
    plot.background = element_rect(fill="black"),
    panel.background = element_blank(),
    panel.border = element_blank()
  )

p

# Save plot in PNG
w <- 2000
r <- 230
png(here("out", "madrid_districts_nutshell.png"), bg = "black", width = w, height = w*asp, res = r, units = "px") 
print(p)
dev.off()


# ---------------------------------------------
# Skeleton Map
# ---------------------------------------------

mxmin <- viales@bbox[1,1]-1165
mxmax <- viales@bbox[1,2]+1165
mymin <- viales@bbox[2,1]
mymax <- viales@bbox[2,2]

# Is aspect ratio ok?
coord <- coord_equal(xlim = c(mxmin, mxmax), ylim = c(mymin, mymax), expand = FALSE)
asp <- coord$aspect(list(x.range = range(c(mxmin, mxmax)), y.range = range(c(mymin, mymax))))
asp

p <- ggplot() +
  coord_equal(xlim = c(mxmin, mxmax), 
              ylim = c(mymin, mymax),
              expand = FALSE) + 
  # river
  geom_path(data=manzanares, aes(x=long, y=lat, group=group), col="RoyalBlue3", alpha = .5, size = 2) +
  # roads
  geom_polygon(data=viales, aes(x=long, y=lat, group=group), fill="white") +
  # PoI
  geom_text(data = data.frame(lon = sol@coords[1], lat = sol@coords[2]), 
            aes(x = lon, y = lat), label = "\u2605", 
            size = 6, family = "BookmanOldStyle", fontface = "bold", col = col_highlighter) +
  geom_text(data = data.frame(lon = vinuelas@coords[1], lat = vinuelas@coords[2]), 
            aes(x = lon, y = lat), label = "\u26eb",
            size = 5, family = "BookmanOldStyle", fontface = "bold", col = col_highlighter) +
  # Margins
  geom_rect(aes(xmin = mxmin-9999, xmax = mxmin+10, ymin = mymin-9999, ymax = mymax+9999), fill = "black") + 
  geom_rect(aes(xmin = mxmax-10, xmax = mxmax+9999, ymin = mymin-9999, ymax = mymax+9999), fill = "black") + 
  geom_rect(aes(xmin = mxmin-9999, xmax = mxmax+9999, ymin = mymin-9999, ymax = mymin+10), fill = "black") + 
  # Title
  #geom_rect(aes(xmin = mxmin-9999, xmax = mxmin+(mxmax-mxmin)/2, ymin = mymax-1800, ymax = mymax+9999), fill = "black", col = "white") + 
  geom_text(data = as.data.frame(list(x = mxmin+((mxmin+(mxmax-mxmin)/2)-mxmin)/2, y = (mymax-1800)+(mymax-(mymax-1800))/2)),
           aes(x = x, y = y),
           label = "Municipio de Madrid",
           family = "BookmanOldStyle", size=10, fontface = "bold", col = "white") +
  # Legend
  #geom_rect(aes(xmin = mxmin-9999, xmax = 431000, ymin = mymax-5000, ymax = mymax-3000), fill = "black", col = "white") + 
  geom_text(data = as.data.frame(list(x = 431000, y = (mymax-5000)+((mymax-3000)-(mymax-5000))/2)),
            aes(x = x, y = y),
            label = "\u2605\n\u26eb",
            family = "BookmanOldStyle", size=5, fontface = "bold", col = col_highlighter, hjust="right") +
  #geom_rect(aes(xmin = 431000+100, xmax = 431000+5000, ymin = mymax-5000, ymax = mymax-3000), fill = "black", col = "white") + 
  geom_text(data = as.data.frame(list(x = 431000+200, y = (mymax-5000)+((mymax-3000)-(mymax-5000))/2)),
            aes(x = x, y = y),
            label = "Puerta del Sol\nCastillo de Vi\u00f1uela",
            family = "BookmanOldStyle", size=4, fontface = "italic", col = "white", hjust="left") +
  
  
  # Notes
  geom_text(data = as.data.frame(list(x = mxmin+700, y = mymin+700)),
            aes(x = x, y = y),
            label = "Sources: Geoportal del Ayuntamiento de Madrid, OSM\nMap created with R/ggplot2 | Twitter: @slow_data | IG: @jprimav", 
            family = "BookmanOldStyle", size=3, col = "white", hjust="left") +
  # Theme
  theme(
    axis.title = element_blank(),
    axis.text =  element_blank(), 
    axis.ticks= element_blank(),
    axis.ticks.length = unit(0, "pt"),
    legend.box.spacing = unit(0, "mm"),
    axis.line = element_blank(),
    panel.grid = element_blank(),
    plot.margin=grid::unit(c(0, 0, 0, 0), "mm"),
    plot.background = element_rect(fill="green"),
    panel.background = element_rect(fill="black"),
    panel.border = element_blank()
  )

p

# Save plot in PNG
w <- 2000
r <- 230
png(here("out", "madrid_skeleton.png"), bg = "black", width = w, height = w*asp, res = r, units = "px") 
print(p)
dev.off()
