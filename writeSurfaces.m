function success = writeSurfaces( cached_on_name, cached_off_name, thisVZminmesh, thisVZmaxmesh )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    on_file = strcat(cached_on_name, '.txt');
    off_file = strcat(cached_off_name,'.txt');
    dlmwrite(on_file, thisVZminmesh);
    dlmwrite(off_file, thisVZmaxmesh);
    success = true;
end

