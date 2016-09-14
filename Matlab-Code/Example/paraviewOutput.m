clear all; close all; clc

load('vol01.mat');
load('resultsFIDVC.mat');


% Compute normal strains e_N = dx/dX - 1 with central differencing

dm = 8; % Output mesh descritization size

u1 = u{1,1}{1,1};
u2 = u{1,1}{1,2};
u3 = u{1,1}{1,3};
du1 = zeros(size(u1,1)-2,size(u1,2)-2,size(u1,3)-2);
du2 = zeros(size(u2,1)-2,size(u2,2)-2,size(u2,3)-2);
du3 = zeros(size(u3,1)-2,size(u3,2)-2,size(u3,3)-2);

for ii = 2:size(u1,1)-1
    for jj = 2:size(u2,2)-1
        for kk = 2:size(u3,3)-1
            x(ii,jj,kk) = ii;
            y(ii,jj,kk) = jj;
            z(ii,jj,kk) = kk;
            du1(ii,jj,kk) = (u1(ii+1,jj,kk) - u1(ii-1,jj,kk))/(2*dm);
            du2(ii,jj,kk) = (u2(ii,jj+1,kk) - u2(ii,jj-1,kk))/(2*dm);
            du3(ii,jj,kk) = (u3(ii,jj,kk+1) - u3(ii,jj,kk-1))/(2*dm);
        end
    end
end
 
e1 = du1(2:size(u1,1)-1,2:size(u1,2)-1,2:size(u1,3)-1) - 1;
e2 = du2(2:size(u2,1)-1,2:size(u2,2)-1,2:size(u2,3)-1) - 1;
e3 = du3(2:size(u3,1)-1,2:size(u3,2)-1,2:size(u3,3)-1) - 1;
% Output displacements to vtk format for paraview
vtkwrite('resultsFIDVC_u1.vtk','structured_grid',x,y,z,'scalars','u1',u1);
vtkwrite('resultsFIDVC_u2.vtk','structured_grid',x,y,z,'scalars','u2',u2);
vtkwrite('resultsFIDVC_u3.vtk','structured_grid',x,y,z,'scalars','u3',u3);

% Output strains to vtk for ParaView visualization
vtkwrite('resultsFIDVC_e1.vtk','structured_grid',x,y,z,'scalars','e1-strain',e1);
vtkwrite('resultsFIDVC_e2.vtk','structured_grid',x,y,z,'scalars','e2-strain',e2);
vtkwrite('resultsFIDVC_e3.vtk','structured_grid',x,y,z,'scalars','e3-strain',e3);
