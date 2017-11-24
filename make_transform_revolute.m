function [ trf_B_A ] = make_transform_revolute( axis_B, angle, parent )
% This is a convenience function to create a homogeneous transform of 
% frame-B (left subscript) w.r.t. frame-A (left superscript) given the
% rotation axis in frame-B and the rotation angle in radians.
% parent is the transform or the axes-object which should be the parent of this
% transform.
trf_B_A= hgtransform;

trf= makehgtform; % identity transform
trf(1:3, 1:3)= Rodrigues( axis_B, angle );
trf(1:3, 4)= [0; 0; 0];
set(trf_B_A, 'Matrix', trf);

if (nargin >= 3)
    make_child(parent, trf_B_A);
    % set(trf_B_A, 'Parent', parent);
end

end
