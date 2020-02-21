# I built this script to see which SRAs that were to be downloaded to a directory were missign from the list of desired SRAs.
# I took the list of files from a directory, and removed the file extensions and _1 and _2 information for paired-end reads 
# so that only the SRA ID remained, then compared this to the list of SRAs in filteredDT$run
# x = list of filenames
# y = datatable where the SRA ids are located in the "run" column.
# i.e., 
# out <- srasToGet(sraFqs, filteredDT)
srasToGet <- function(x,y){
  i <- gsub(".fastq.gz|.fastq", "", x)
  i <- gsub("_1|_2", "", i)
  out <- y[which(!y$run %in% i)]
}