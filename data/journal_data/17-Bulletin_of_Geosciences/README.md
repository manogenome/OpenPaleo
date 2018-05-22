```

# the original Scopus CSV data renamed with "raw" tag as a block of data were misaligned
# the misalignment can be seen in the BulletinofGeosciences_Scopus.raw.csv.png

mv BulletinofGeosciences_Scopus.csv BulletinofGeosciences_Scopus.raw.csv

# make a copy of the raw scopus data
cp BulletinofGeosciences_Scopus.raw.csv BulletinofGeosciences_Scopus.csv

# open BulletinofGeosciences_Scopus.csv and re-aligned the block in excel
# save the data in CSV format with UTF-8 encoding
# inspect this file with visdat package again to verify the correction
# see BulletinofGeosciences_Scopus.csv.png

# now this csv file is cleaned with Janitor package to produce the following three tsv files
17-Bulletin_of_Geosciences_Combined_Scopus_Unpaywall.tsv
17-Bulletin_of_Geosciences_Scopus.tsv
17-Bulletin_of_Geosciences_Unpaywall.tsv

# again these tsv files are visually inspected with visdat package
17-Bulletin_of_Geosciences_Combined_Scopus_Unpaywall.tsv.png
17-Bulletin_of_Geosciences_Scopus.tsv.png
17-Bulletin_of_Geosciences_Unpaywall.tsv.png

```
