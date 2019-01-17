////////////////////////////////////////
// Townsend Arborization ImageJ Macro //
////////////////////////////////////////

// Get file list from the arguments
filelist = getArgument();
file = split(filelist, ',');

// Open all the z positions for this tile
open(file [0]);
open(file [1]);
open(file [2]);
open(file [3]);
open(file [4]);
open(file [5]);
open(file [6]);
open(file [7]);
open(file [8]);
open(file [9]);
open(file [10]);
open(file [11]);
open(file [12]);
open(file [13]);
open(file [14]);
open(file [15]);
open(file [16]);
open(file [17]);
open(file [18]);
open(file [19]);
open(file [20]);

// Create a Stack of all the z positions and generate a Z-Projection, saving it.
run("Images to Stack", "name=Stack title=[] use");
run("Z Project...", "projection=[Max Intensity]");
saveAs("Tiff", file[21]);
close();

// Generate a STDEV Projection
run("Z Project...", "projection=[Standard Deviation]");
selectWindow("Stack");
selectWindow("STD_Stack");

// Convert to 8-bit and subtract background using rolling ball method of 20
run("8-bit");
run("Subtract Background...", "rolling=20");

// Set Threshold value
setAutoThreshold("Default");
run("Threshold...");
setThreshold(0, 74);
setThreshold(0, 74);

// Convert to a mask, invert, and save
setOption("BlackBackground", false);
run("Convert to Mask");
run("Invert");
saveAs("Tiff", file[22]);

// Skeletonize the Mask
run("Skeletonize");
saveAs("Tiff", file[23]);

// Run analysis over the resulting skeleton, saving the results.
run("Properties...", "channels=1 slices=1 frames=1 unit=µm pixel_width=1.3725 pixel_height=1.3725 voxel_depth=10000.0000");
run("Analyze Skeleton (2D/3D)", "prune=none calculate show");
selectWindow("Longest shortest paths");
saveAs("Results", file[24]);
close();

selectWindow("Tagged skeleton");
close();

run("Quit");
