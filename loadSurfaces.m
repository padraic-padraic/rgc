function [ success, thisVZminmesh, thisVZmaxmesh ] = loadSurfaces( cached_on_name, cached_off_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    on_file = strcat(cached_on_name, '.txt');
    off_file = strcat(cached_off_name,'.txt');
    if exist(on_file,'file')~=2 || exist(off_file, 'file')~=2
        success = false;
        thisVZminmesh = [];
        thisVZmaxmesh = [];
    else
        success = true;
        thisVZminmesh = dlmread(on_file);
        thisVZmaxmesh = dlmread(off_file);
    end
end

