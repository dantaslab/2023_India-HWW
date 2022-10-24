
#---Global options for Markdown-------------------------------------------------

options(digits = 3)

knitr::opts_chunk$set(
  comment = "#>",
  #collapse = TRUE,
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  cache = FALSE,
  #out.width = "80%",
  rows.print = 10,
  max.print = 1000,
  fig.align = "center",
  fig.width = 8,
  fig.asp = 0.7,
  fig.show = "hold"
)

rootdir <- dirname(dirname(getwd()))

knitr::opts_knit$set(root.dir = rootdir)
knitr::opts_knit$set(width=75)

options(DT.options = list(
  pageLength = 5,
  dom = 'itlp', 
  scrollX=TRUE, 
  scrollY=TRUE, 
  font_size=10
))

options(dplyr.print_min = 6, dplyr.print_max = 6)

#---Packages Used---------------------------------------------------------------

library(knitr)
library(readxl)
library(cowplot)
library(purrr)
library(readr)
library(ggplot2)
library(gridExtra)
library(reshape)
library(scales)
library(gtools)
library(reshape2)
library(pheatmap)
library(tidyr)
library(scales)
library(dplyr)
library(reshape2)
library(gtools)
library(vegan)
library(ape)
library(lme4)
library(optparse)
library(ggpubr)
library(RColorBrewer)
library(readr)
library(broom)
library(ggsci)
library(ggrepel)
library(extrafont)
  #font_import()
library(MetBrewer)
library(viridis)
library(textshape)
  
library(devtools)
library(ggmap)
library(maps)
library(tmap)
library(sf)
library(rnaturalearth)
library(rnaturalearthhires) #devtools::install_github("ropensci/rnaturalearthhires")
library(rnaturalearthdata)
library(ggspatial)
library(rgeos)
library(labdsv)


###---Source code and input files-----------------------------------------------

source("src/s0_utilities_KB.R")
source("src/s1_resistome_KB.R")


###---Load data-----------------------------------------------------------------

# Load excel data summary sheet
sewage.file <- file.path("data/india-sewage_metagenome_KB.xlsx")

e00.sewage.map.df <- read_excel(sewage.file, sheet="Tab_01-map", skip=1, na="NA")
e00.sewage.MAG_AMR.df <- read_excel(sewage.file, sheet="Tab_02-MAG_AMR", skip=1, na="NA")
e00.sewage.MAG_SUM.df <- read_excel(sewage.file, sheet="Tab_03-MAG_SUMMARY", skip=1, na="NA")

# ShortBRED files
shortbred.marker.file <- read_delim("data/shortbred/e01_200608_shortbred_marker_mappingfile.txt", "\t", escape_double = FALSE, trim_ws = TRUE)

shortbred.S1 <- read_delim("data/shortbred/Sample-1_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
shortbred.S2 <- read_delim("data/shortbred/Sample-2_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
shortbred.S3 <- read_delim("data/shortbred/Sample-3_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
shortbred.S4 <- read_delim("data/shortbred/Sample-4_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
shortbred.S5 <- read_delim("data/shortbred/Sample-5_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
shortbred.S6 <- read_delim("data/shortbred/Sample-6_out.txt", "\t", escape_double = FALSE, trim_ws = TRUE)


#---Directory structure---------------------------------------------------------

# ## Create directory structure for output files and figures - commented-out by default
# cur.date <- format(Sys.Date(), "%y%m%d")
# 
# fln.prfx <- stringr::str_interp("${cur.date}")
# 
# main.dir <- file.path(getwd(), "reports")
# 
# ## Provide the dir name to create under main dir:
# out.path <- file.path(main.dir, fln.prfx)
# fig.path <- file.path(out.path,"figures")
# dat.path <- file.path(out.path, "data")
# 
# if (!dir.exists(out.path)){
#   dir.create(out.path)
# } else {
#   print("output dir already exists!")
# }
# 
# if (!dir.exists(fig.path)){
#   dir.create(fig.path)
# } else {
#   print("figure dir already exists!")
# }
# 
# if (!dir.exists(dat.path)){
#   dir.create(dat.path)
# } else {
#   print("data dir already exists!")
# }
