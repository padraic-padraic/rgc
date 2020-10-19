function [ x, y, z ] = readAnnotationsFile( fName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if exist(fName, 'file')~=2
    msgID='estimateDiameter:FileNotFound';
    msg=strcat('Could not find annotations file: ',fName);
    baseException = MException(msgID, msg);
    throw(baseException);
end
data = fileread(fName);
data = strsplit(data, '\n');
delims = {'\t',' '};
headings = strsplit(data{1,1},delims);
headings = string(headings);
% assignin('base','headings',headings)
% assignin('base','data',data)
x_index = find(headings=='X');
y_index = find(headings=='Slice');
z_index = find(headings=='Y');
n_lines = size(data,2)-2;
x = zeros(n_lines,1); y=zeros(n_lines,1);z=zeros(n_lines,1);
for i=(1:n_lines)
    line = strsplit(data{1,i+1},delims);
    x_cell = line(x_index);
    y_cell = line(y_index);
    z_cell = line(z_index);
    x(i)=str2num(x_cell{1}); y(i)=str2num(y_cell{1}); z(i)=str2num(z_cell{1});
end

