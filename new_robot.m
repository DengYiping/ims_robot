clear all
close all
clf
handle_axes= axes('XLim', [-0.4,0.4], 'YLim', [-0.2,0.4], 'ZLim', [0,0.4]);
% the root axis that everything is linked to
xlabel('e_1'); 
ylabel('e_2');
zlabel('e_3');
% the basis e

view(-130, 26);
grid on;
axis equal
camlight
axis_length= 0.05;

%% Base Frame
trf_E_axes= hgtransform('Parent', handle_axes); 
% The root-link transform should be created as a child of the axes from the
% beginning to avoid the error "Cannot set property to a deleted object".
% E is synonymous with the axes, so there is no need for plot_axes(trf_E_axes, 'E');

%% Link-0: Base-link       a box

trf_link0_E= make_transform([0, 0, 0], 0, 0, pi/2, trf_E_axes); % Do not specify parent yet: It will be done in the joint
plot_axes(trf_link0_E, 'L_0', false, axis_length); 

trf_viz_link0= make_transform([0, 0, 0.1], 0, 0, 0, trf_link0_E);
h(1)= link_box([0.1, 0.1, 0.05], trf_link0_E, [0, 0, 1]); 

%% Link-1:    another box

trf_viz_link1= make_transform([0, 0, 0], 0, 0, 0); % Do not specify parent yet: It will be done in the joint
h(2)= link_box([0.07, 0.07, 0.03], trf_viz_link1, [0, 0, 1]);

%% Link-2:    another box
%% Joint 1

trf_joint1_link0= make_transform([0, 0, 0.0375], 0, 0, 0, trf_link0_E); 
plot_axes(trf_joint1_link0, 'L_1', false, axis_length); 
make_child(trf_joint1_link0, trf_viz_link1);