# Use this script after running RepeatMasker to make custom repeat libraries for novel species.
# The infile is the repeat fasta file you are putting in. Some of the repeats are known and given
# names, while some are described as "Unknown". So with this script, you can split the knowns and
# unkowns into separate fasta files. You can also split it based on any other pattern you want that
# is present in the header of the fasta entries.

# The command is run as the following:
# splitFasta(infile, outfile, identity)
# infile : The name of the fasta file being read in and parsed
# outfile : The name you want to give the output parsed fasta file
# identity : The pattern in the header that you want to use to parse the entries, either Known = 1 Unknown = 2

# Note, the script will be written to the directory where the repeat databases are being made
# for all species,
# allSppRepeatDBpath <- paste(projRepeatDB, speciesRepeatDBname, "/", sep = "")

parseFastaByHeaderPattern <- function(infile, identity, node = 1){
    outpath <- allSppRepeatDBpath
    if(identity==1){
        cat(paste("#!/usr/bin/perl -w
              use strict;
              use diagnostics;
              use warnings;
              use Bio::SeqIO;
              
              my $seqIOin  = Bio::SeqIO->new(-format => 'fasta', -file => \"<",infile,"\");
              my $seqIOout = Bio::SeqIO->new(-format => 'fasta', -file => \">Known_consensi.fa.classified","\");
              
              while (my $seq = $seqIOin->next_seq){
                    $seqIOout->write_seq($seq) if !($seq->id =~ /Unknown/);
              }", sep = ""),
        file=paste(outpath, "Known.pl", sep="/"))
    cat(c("\n"," *** SUBMIT FOLLOWING TWO COMMANDS FROM HEADNODE ***","\n",
          "    1- Ensure working directory given for outputs:", "\n",
          paste("cd", outpath), "\n",
          "    2- Run the bash from within this working directory:", "\n",
          paste("perl ", "Known.pl", sep="")))
    } else {
        cat(paste("#!/usr/bin/perl -w
              use strict;
              use diagnostics;
              use warnings;
              use Bio::SeqIO;
              
              my $seqIOin  = Bio::SeqIO->new(-format => 'fasta', -file => \"<",infile,"\");
              my $seqIOout = Bio::SeqIO->new(-format => 'fasta', -file => \">Unknown_consensi.fa.classified","\");
              
              while (my $seq = $seqIOin->next_seq){
                    $seqIOout->write_seq($seq) if ($seq->id =~ /Unknown/);
              }", sep = ""),
            file=paste(outpath, "Unknown.pl", sep="/"))
        cat(c("\n"," *** SUBMIT FOLLOWING TWO COMMANDS FROM HEADNODE ***","\n",
              "    1- Ensure working directory given for outputs:", "\n",
              paste("cd", outpath), "\n",
              "    2- Run the bash from within this working directory:", "\n",
              paste("perl ", "Unknown.pl", sep="")))
    }
}
# EOF