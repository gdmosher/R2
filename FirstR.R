#!/usr/bin/env FirstR
myentries <- c("MKWVTFISLLFLFSSAYS", "MWVTFISLL", "MFISLLFLFSSAYS")                                                                                                                                        
myresult <- NULL                                                                                                                                                                                              
for(i in myentries) {                                                                                                                                                                                         
  myurl <- paste("http://ca.expasy.org/cgi-bin/pi_tool?protein=", i, "&resolution=monoisotopic", sep="")                   
  x <- url(myurl)                                                                                                                                                                                       
  res <- readLines(x)                                                                                                                                                                                   
  close(x)                                                                                                                                                                                              
  mylines <- res[grep("Theoretical pI/Mw:", res)]                                                                                                                                                        
  myresult <- c(myresult, as.numeric(gsub(".*/ ", "", mylines)))                                                                                                                                         
  print(myresult)                                                                                                                                                                                       
  Sys.sleep(1) # halts process for one sec to give web service a break                                                                                                                                     
}                                                                                                                                                                                                             
final <- data.frame(Pep=myentries, MW=myresult)                                                                                                                                                               
cat("\n The MW values for my peptides are:\n")                                                                                                                                                                
final
