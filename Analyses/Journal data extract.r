# Pull in relevant data from Journal data source files
# Replace with local directory where needed

Journal_data<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Google Scholar journals with WoS data.csv")

GS_rank<-Journal_data[,"GS_Rank"]
h5.index<-Journal_data[,"h5.index"]
Journal_names<-Journal_data[,"Publication"]
Journal_cites<-Journal_data[,"Total_cites"]
JIF_2016<-Journal_data[,"JIF_2016"]
WOS_rank<-Journal_data[,"WOS_rank"]


############# Acta Palaeontologica Polonica

# Note that some lines are still corrupted here, even after parsing. These were eliminated to avoid data errors (file version 2)
APP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Acta Palaeontologica Polonica/ActaPalaeontologicaPolonica_Scopus2.csv")
APP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Acta Palaeontologica Polonica/ActaPalaeontologicaPolonica_Unpaywall.csv")

# Create a new factor for OA status
APP_OA<-APP_unpaywall[,"is_oa"]

APP_DOI<-APP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
APP_cite<-APP_scopus[,"Cited.by"]
APP_cite[is.na(APP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_citefreq.png',
         width=1000,height=600)
APP_hist<-hist(APP_cite,col="red",xlab="Citation count",
               main="Acta Palaeontologica Polonica",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(APP_cite),max(APP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(APP_cite),sd=sd(APP_cite)) 
yfit <- yfit*diff(APP_hist$mids[1:2])*length(APP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_citedensity.png',
         width=1000,height=600)
plot(density(APP_cite),xlab="Citation count",
     main="Acta Palaeontologica Polonica")
polygon((density(APP_cite)),col = "red")
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(APP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(APP_OA)),main="Acta Palaeontologica Polonica, OA proportion")
dev.off()

########### Bulletin of Geosciences

BoG_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Bulletin of Geosciences/BulletinofGeosciences_Scopus.csv")
BoG_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Bulletin of Geosciences/BulletinofGeosciences_Unpaywall.csv")

# Create a new factor for OA status
BoG_OA<-BoG_unpaywall[,"is_oa"]

BoG_DOI<-BoG_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
BoG_cite<-BoG_scopus[,"Cited.by"]
BoG_cite[is.na(BoG_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citefreq.png',
         width=1000,height=600)
BoG_hist<-hist(BoG_cite,col="red",xlab="Citation count",
               main="Bulletin of Geosciences",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(BoG_cite),max(BoG_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(BoG_cite),sd=sd(BoG_cite)) 
yfit <- yfit*diff(BoG_hist$mids[1:2])*length(BoG_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citedensity.png',
         width=1000,height=600)
plot(density(BoG_cite),xlab="Citation count",
     main="Bulletin of Geosciences")
polygon((density(BoG_cite)),col = "red")
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(BoG_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(BoG_OA)),main="Bulletin of Geosciences, OA proportion")
dev.off()


########## Comptes Rendus Palevol

CRP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Comptes Rendus Palevol/ComptesRendusPalevol_Scopus.csv")
CRP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Comptes Rendus Palevol/ComptesRendusPalevol_Unpaywall.csv")

# Create a new factor for OA status
CRP_OA<-CRP_unpaywall[,"is_oa"]

CRP_DOI<-CRP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CRP_cite<-CRP_scopus[,"Cited.by"]
CRP_cite[is.na(CRP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citefreq.png',
         width=1000,height=600)
CRP_hist<-hist(CRP_cite,col="red",xlab="Citation count",
               main="Comptes Rendus Palevol",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(CRP_cite),max(CRP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CRP_cite),sd=sd(CRP_cite)) 
yfit <- yfit*diff(CRP_hist$mids[1:2])*length(CRP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citedensity.png',
         width=1000,height=600)
plot(density(CRP_cite),xlab="Citation count",
     main="Comptes Rendus Palevol")
polygon((density(CRP_cite)),col = "red")
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CRP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CRP_OA)),main="Comptes Rendus Palevol, OA proportion")
dev.off()


########## Cretaceous Research

CR_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Cretaceous Research/CretaceousResearch_Scopus.csv")
CR_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Cretaceous Research/CretaceousResearch_Unpaywall.csv")

# Create a new factor for OA status
CR_OA<-CR_unpaywall[,"is_oa"]

CR_DOI<-CR_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CR_cite<-CR_scopus[,"Cited.by"]
CR_cite[is.na(CR_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citefreq.png',
         width=1000,height=600)
CR_hist<-hist(CR_cite,col="red",xlab="Citation count",
               main="Cretaceous Research",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(CR_cite),max(CR_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CR_cite),sd=sd(CR_cite)) 
yfit <- yfit*diff(CR_hist$mids[1:2])*length(CR_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citedensity.png',
         width=1000,height=600)
plot(density(CR_cite),xlab="Citation count",
     main="Cretaceous Research")
polygon((density(CR_cite)),col = "red")
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CR_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CR_OA)),main="Cretaceous Research, OA proportion")
dev.off()
