```

# the original Scopus CSV data renamed with "raw" tag as there is a misaligned row in the data
# the misalignment can be seen in the ReviewofPalaeobotanyandPalynology_Scopus.raw.csv.png

mv ReviewofPalaeobotanyandPalynology_Scopus.csv ReviewofPalaeobotanyandPalynology_Scopus.raw.csv

# make a copy of the raw scopus data
cp ReviewofPalaeobotanyandPalynology_Scopus.raw.csv ReviewofPalaeobotanyandPalynology_Scopus.csv

# open ReviewofPalaeobotanyandPalynology_Scopus.csv and edit the misaligned row in excel
# save the data in CSV format with UTF-8 encoding
# inspect this file with visdat package again to verify the correction
# see ReviewofPalaeobotanyandPalynology_Scopus.csv.png

# now this csv file is cleaned with Janitor package to produce the following three tsv files
05-Review_of_Palaeobotany_and_Palynology_Combined_Scopus_Unpaywall.tsv
05-Review_of_Palaeobotany_and_Palynology_Scopus.tsv
05-Review_of_Palaeobotany_and_Palynology_Unpaywall.tsv

# again these tsv files are visually inspected with visdat package
05-Review_of_Palaeobotany_and_Palynology_Combined_Scopus_Unpaywall.tsv.png
05-Review_of_Palaeobotany_and_Palynology_Scopus.tsv.png
05-Review_of_Palaeobotany_and_Palynology_Unpaywall.tsv.png


```
