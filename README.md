# blaszkiewicz_et_all-2019
Scripts related to Blaszkiewicz et all 2019 PLOS ONE paper.

There were three software packages used in this analysis.

1. ZStack_FIJI_Automation.pl is a PERL script used to open FIJI on the command line and run a FIJI Macro over all z positions of a tile. The PERL script then cycles through all of the tiles in the tiled z-stack.

2. General_Arborization_Macro.ijm is a FIJI macro that the above PERL script runs over all z positions in a single tile. It creates a ZMAX Projection, Thresholded STDEV Projection, Skeleton, and Arborization Quantification Results per tile.

3. Branching.pl is a PERL script that runs through all of the Arborization Quantification Results for a single tissue and summs the neurite arborization for the entire tissue.
