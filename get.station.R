"get.station" <-
function(id, with.infill=FALSE,dir="",type){

cmd<-paste( "grep -h ", id," ", dir,
type,".complete* > tmp.data",sep="")

system( cmd)
temp<- scan( "tmp.data",what=list( "a", 
1,2,3,4,5,6,7,8,9,10,11,12,"a"))
#rm temp file
#system( " rm tmp.data")
# extract the missing value logical from last 12 ones and zeroes
missing.ind<- 
unlist(strsplit( temp[[14]],NULL))
missing.ind<- matrix( missing.ind, ncol=12, byrow=T)
# complete precip data with infilled values where they were missing
temp<- matrix( unlist( temp[2:13]), ncol=12)
 if( !with.infill) {
temp[missing.ind==1] <- NA
}
# temp is a 103X12 matrix each column is the monthly value rows are the 
#years. To unroll as a times series: c( t( temp))
temp
}
