#!/usr/bin/perl -w
###################################################
# Townsend Arborization Qunatification PERL Script#
###################################################

# The purpose of this script is to scan the arborization results for a full tissue and quantify the arborization.

# Keep this section, it helps maintain good PERL code
use strict;
use warnings;

## Reads line of .csv branch information.
## Determines whether the branch length is over 4.
## If so, prints -- if not, moves on.

open OUT,">Branch_Output_B.txt";
my @out_array;
open FILELIST,"/Volumes/Big_Red/HET3_Whole_Depot/Arborization_Results/File_List_B.txt";
while(my $file = <FILELIST>){
	open DATAFILE, "/Volumes/Big_Red/HET3_Whole_Depot/B_10day_8/Arborization_Results/$file";
	my $header = <DATAFILE>;
	chomp $file;
	while(my $data = <DATAFILE>){
		chomp $data;
		my @array = split /,/, $data;
		my $branchlength = $array[6];
		if($branchlength > 4) {
			print OUT "$branchlength\n";
			push @out_array, $branchlength;
		}

	}
}

my $sum = 0;
for ( @out_array ) {
	$sum += $_;
}

# Prints total arbrorization across the tissue
print "Total: $sum";
