function filename = strip_path( path )
% STRIP_PATH Get the filename given a file path
%   Checks if path is unix or windows like, and strips the preceding path 
%   to get the filename alone.
if isempty(findstr(path, '/'))
    %%Windows style
    occurences = findstr(path,'\');
    
else
    %%Unix style
    occurences = findstr(path, '/');
filename = path(occurences(end)+1:length(path));
end

