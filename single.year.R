"single.year" <-
function(yr, with.infill=FALSE,dir="",type){

fnames<-paste( type,".complete.Y",  
   substring( format( 1001:1103), 2,4), sep="")
fnames<- paste( dir, fnames, sep="")

yr.index<- yr-1894

temp<- scan( fnames[yr.index],what=list( "a", 
1,2,3,4,5,6,7,8,9,10,11,12,"a"))

# extract the missing value logical from last 12 ones and zeroes

missing.ind<- 
unlist(strsplit( temp[[14]],NULL))
missing.ind<- matrix( missing.ind, ncol=12, byrow=T)

# this is complete data with infilled values where real data is missing
temp<- matrix( unlist( temp[2:13]), ncol=12)

# over write with NA's if infills not wanted. 

if( !with.infill) {
temp[missing.ind==1] <- NA
}
# the big matrix
temp
}
