function success = writeWarpedArbor( warpedArbor, cached_arbor_name )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    cached_nodes_file = char(strcat(cached_arbor_name, '-nodes.txt'));
    cached_edges_file = char(strcat(cached_arbor_name, '-edges.txt'));
    cached_radii_file = char(strcat(cached_arbor_name, '-radii.txt'));
    dlmwrite(cached_radii_file, warpedArbor.radii);
    dlmwrite(cached_edges_file, warpedArbor.edges);
    dlmwrite(cached_nodes_file, warpedArbor.nodes);
    success = true;
end

