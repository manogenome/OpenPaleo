#!/usr/bin/env Rscript

# usage: /usr/local/bin/Rscript csv_vis_dat.R /path/to/file.csv width height resolution
# usage: /usr/local/bin/Rscript csv_vis_dat.R test.csv 7 5 300

options(warn=-1)

list.of.packages <- c("visdat")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/')

suppressPackageStartupMessages(require(visdat))

args <- commandArgs(TRUE)

input.file <- args[1]; plot.width <- as.numeric(args[2])

plot.height <- as.numeric(args[3]); plot.resolution <- as.numeric(args[4])

data <- read.csv(input.file, header=TRUE, na.strings="")

output.file <- sub(".csv", ".csv.png", input.file)

png(output.file, width=plot.width, height=plot.height, units='in', res=plot.resolution)

vis_dat(data, sort_type = FALSE)

dev.off()
