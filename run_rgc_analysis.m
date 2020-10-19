%%File paths must be given relative to the rgc folder.
%%For example, if the file is in rgc/Brain_1/Cell_1, the path should be
%%given as:
%%'Brain_1\Cell_1\arbor_file_name.swc'
%%The path is typed between the two single quote marks.
onFilePath='<file_path_here>';
offFilePath='<file_path_here>';
arborFilePath='<file_path_here>';
%%Voxel resolutions can be obtained from the metadata in imageJ.
xVoxelResolution=0.3140;
yVoxelResolution=0.3140;
zVoxelResolution=1.1;
%%Set the level of interpolation for the Uygar rgcAnalyzer code. Can be 1,
%%2 or 3. Running at level 1 takes significant compute time(>1 day), and 
%%offers little benefit in terms of results. 2 is recommended.
interpolation=2;
rgcAnalyzer(arborFilePath,onFilePath,offFilePath,[xVoxelResolution yVoxelResolution zVoxelResolution], interpolation); 
diameter=estimateDiameter(arborFilePath);
disp(strcat('Cell Diameter estimated is: ',num2str(diameter), ' micrometers'))
diameter_name = strcat(arborFilePath(1:length(arborFilePath)-4),'-diameter.txt');
fid=fopen(diameter_name, 'w');
fprintf(fid, strcat('Cell Diameter estimated is: ',num2str(diameter), ' micrometers'));
fclose(fid);
stratificationPlot(arborFilePath,zVoxelResolution);
beep;
