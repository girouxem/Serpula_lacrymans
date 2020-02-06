# This function edits the maker_opts.ctl file. I'm using it to replace the genome= path in each file
# with the path to a specific genome assembly. I'm using this the same way to add the respective 
# protein files I want as well. 

# For example, I have a list of maker_opts.ctl filepaths in my metadata table, and for each file, I 
# want to add the path to the specific genome assembly that is unique for each file:

# pattern <- "genome= " # This is the pattern in the maker_opts.crl file that I want to replace.
# replacePatterns       # I want to replace the patterns with this, i.e., 
                        # I want to replace "genome= " with "genome=/actual/path/to/genome/assembly "
                        # Note that I did place this in it's own new list, instead of using a paste of the pattern with the 
                        # value of a row in the metadata table to avoid complications.

# So:
# pattern <- "genome= "
# genomePathsPatterns <- paste("genome=", metadataAssemblies$FixedNewAssemName, sep = "")
# for(i in 1:nrow(metadataAssemblies)){
#     makerOptsGenRepl(metadataAssemblies$makerRnd1_CTL_optsPath[i], pattern, genomePathsPatterns[i])
# }


makerOptsGenRepl <- function(files, patterns, replacePatterns){
    x <- readLines(files)
    y <- gsub(patterns, replacePatterns, x)
    cat(y, file=files, sep = "\n")
}