function [success,warpedArbor] = loadWarpedArbor( cached_arbor_name, surfaceMapping, conformalJump )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    cached_nodes_file = char(strcat(cached_arbor_name, '-nodes.txt'));
    cached_edges_file = char(strcat(cached_arbor_name, '-edges.txt'));
    cached_radii_file = char(strcat(cached_arbor_name, '-radii.txt'));
    if exist(cached_nodes_file,'file')~=2 || exist(cached_edges_file, 'file')~=2 || exist(cached_radii_file, 'file')~=2
       success=false;
       warpedArbor=[];
    else
        mappedMinPositions=surfaceMapping.mappedMinPositions; mappedMaxPositions=surfaceMapping.mappedMaxPositions;
        thisVZminmesh=surfaceMapping.thisVZminmesh; thisVZmaxmesh=surfaceMapping.thisVZmaxmesh; thisx=surfaceMapping.thisx; thisy=surfaceMapping.thisy;
        % generate correspondence points for the points on the surfaces
        tmpminmesh = thisVZminmesh(thisx(1):conformalJump:thisx(end),thisy(1):conformalJump:thisy(end));
        tmpmaxmesh = thisVZmaxmesh(thisx(1):conformalJump:thisx(end),thisy(1):conformalJump:thisy(end));
        medVZminmesh = median(tmpminmesh(:)); medVZmaxmesh = median(tmpmaxmesh(:));
        warpedArbor.medVZmin = medVZminmesh;
        warpedArbor.medVZmax = medVZmaxmesh;
        cached_nodes_file = char(strcat(cached_arbor_name, '-nodes.txt'));
        cached_edges_file = char(strcat(cached_arbor_name, '-edges.txt'));
        cached_radii_file = char(strcat(cached_arbor_name, '-radii.txt'));
        warpedArbor.edges = dlmread(cached_edges_file);
        warpedArbor.nodes = dlmread(cached_nodes_file);
        warpedArbor.radii = dlmread(cached_radii_file);
        success=true;
    end
end

