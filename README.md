# Tri Vu - BME 848 - PET Lab

## INSTRUCTION:
- Step 1: in the terminal, type:

	matlab -nodesktop -r "bme848_pet_ui"
if this doesn't work, try:

	matlab -nodisplay -nodesktop -r "run bme848_pet_ui.m"
or:

	matlab -nodesktop -r "bme848_pet_ui.m"
After a few minutes (~1 min), if successfully, the UI of the program will pop up.
- Step 2: browse for PET and CT data by pressing "..." buttons respectively. Then press Load
- Step 3: at this step, we should be able to see a preview on the Preview field to the right.
	+ \# of Angles are the number of projection between 0 - 360 degrees. 
	+ Choose your range of slices to be saved in the Slices options. Upon clicking Apply, the white lines will appear in the Preview, indicating the region of chosen slices. 
	+ Angle is the current angle of projection of the Preview. 
	+ Depth weighting use an exponential depth correction similar to Beer's law. Toggle it to turn on depth weighting. 
	+ Update the changes in the Preview by clicking Apply.
After finishing all the modification, click Apply to apply the changes before saving data.
- Step 4: when ready, click Save Data to save the MIP data in real format. The output data will be in the same folder of the code, named "*petfilename*_proj.fl". 
The Message box will let you know if the data is saved successfully, with the size of the output data.
