library(data.tree)
library(networkD3)
setwd("D:/ravina_ucsc_project")
filename2='crimeAgaiswomen2001 -2010M.csv'

df_crime=read.csv(filename2,stringsAsFactors = FALSE)
#filename3='Year_count.csv'
filename4='Year_Crime_count.csv'
Maharashtra<-read.csv(filename4, stringsAsFactors = FALSE)
 
#define the hierarchy (Session/Room/Speaker)
Maharashtra$pathString <- paste("MAH", Maharashtra$YEAR, Maharashtra$variable, Maharashtra$Crimes,  sep="|")
#useRdf$pathString <- paste("useR", useRdf$session, useRdf$room, useRdf$speaker, sep="|")
#convert to Node
useRtree <- as.Node(Maharashtra, pathDelimiter = "|")
#colnames(Maharashtra)[3]="Crimes"
#plot with networkD3
useRtreeList <- ToListExplicit(useRtree, unname = TRUE)
library(htmlwidgets) 
 
fn=radialNetwork(useRtreeList,margin=45,linkColour = 'yellow',nodeColour = 'red',height = 700)
onRender(fn, "function(el,x) { d3.selectAll('.node').on('mouseover', 3); }")
library("collapsibleTree")
colnames(India)[1]="STATE.UT"
MAH<-Maharashtra
India<-df_crime
colnames(India)[1]="STATE.UT"
dendo2  <- collapsibleTree(
  India,
  hierarchy = c( "STATE.UT","DISTRICT" ,  "YEAR", "DOWRY.DEATHS" ),fill = "orange",
  width = 900,
  zoomable = TRUE,
  #fill = brewer.pal(1153, "RdBu"),
  fillByLevel = TRUE,
  tooltip = TRUE,
  attribute = "DOWRY.DEATHS"
   )
dendo2


 
