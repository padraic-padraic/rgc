function success = writeWarpedSurfaces( surfaceMapping, cached_on_name, cached_off_name, cached_arbor_name, conformalJump )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    cached_warped_on=strcat(cached_on_name(1:length(cached_on_name)-2), strip_path(cached_arbor_name), '-', num2str(conformalJump));
    cached_warped_off=strcat(cached_off_name(1:length(cached_off_name)-2), strip_path(cached_arbor_name), '-', num2str(conformalJump));
    bound_name = strcat(cached_on_name(1:length(cached_on_name)-4), strip_path(cached_arbor_name), num2str(conformalJump));
    s_extension='-surface.txt';
    m_extension='-mapped.txt';
    vzminfile = char(strcat(cached_warped_on, s_extension));
    vzmaxfile = char(strcat(cached_warped_off, s_extension));
    xfile = char(strcat(bound_name, '-x.txt'));
    yfile = char(strcat(bound_name, '-y.txt'));
    mappedminfile = char(strcat(cached_warped_on, m_extension));
    mappedmaxfile = char(strcat(cached_warped_off, m_extension));
    dlmwrite(vzminfile, surfaceMapping.thisVZminmesh);
    dlmwrite(vzmaxfile, surfaceMapping.thisVZmaxmesh);
    dlmwrite(xfile, surfaceMapping.thisx);
    dlmwrite(yfile, surfaceMapping.thisy);
    dlmwrite(mappedmaxfile, surfaceMapping.mappedMaxPositions);
    dlmwrite(mappedminfile, surfaceMapping.mappedMinPositions);
    success = true;
end

