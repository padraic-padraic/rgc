function [ diameter ] = rawDiameterEstimate( arborFileName, xVoxelRes, yVoxelRes, zVoxelRes )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[nodes,edges,~,~,~] = readArborTrace(arborFileName,[-1 0 1 2 3 4 5]);
nodes = nodes + 1;
x=nodes(:,1)*xVoxelRes;
y=nodes(:,2)*yVoxelRes;
z=nodes(:,3)*zVoxelRes;
nodes =[x y z];
degree_count = zeros(max(edges(:)), 1);
for i=(1:size(edges,1))
    a=edges(i,1); b=edges(i,2);
    degree_count(a) = degree_count(a)+1;
    degree_count(b) = degree_count(b)+1;
end
points = nodes(degree_count==1,:); % All end nodes have degree one in the graph.
dists = pdist(points, 'euclidean');
diameter = max(dists);
end

