% EECS442 Problem 2, Homework 3
% Linear Fit for Perspective Camera Model Calibration
% Code overview: Load in data, extract corners, create correspondences,then
% solve for the missing parameters via least squares
% by Yi Yang
% Date: 10/25/2016

%% Load in images
img1 = imread('homework3/Q2/1.JPG');
img2 = imread('homework3/Q2/2.JPG');
figure, imagesc(img1); colormap(gray);
title('Click a point on this image'); axis image;
a = []

%% Take in corner input - make sure to click in order corresponding to A
%% below.

for i = 1:12
[x y] = ginput(1);
a = [a [x;y]]
img1(round(y),round(x)) = 255;
imagesc(img1); colormap(gray);
title('Click a point on this image'); axis image;
end

figure, imagesc(img2); colormap(gray);
title('Click a point on this image'); axis image;
for i = 1:12
[x y] = ginput(1);
a = [a [x;y]]
img1(round(y),round(x)) = 255;
imagesc(img2); colormap(gray);
title('Click a point on this image'); axis image;
end
save a
%% 3D coordinates
A  = [];
A = [ [ 0 0 0]' [35 0 0]' [70 0 0]' [105 0 0]' [140 0 0]' [175 0 0]' ...
[175 35 0]' [175 70 0]' [175 105 0]' [175 140 0]' [175 175 0]' [192.5 192.5 0]' ];
A = [ A [ 0 0 9.5]' [35 0 9.5]' [70 0 9.5]' [105 0 9.5]' [140 0 9.5]' [175 0 9.5]' ...
[175 35 9.5]' [175 70 9.5]' [175 105 9.5]' [175 140 9.5]' [175 175 9.5]' [192.5 192.5 9.5]' ];
A = [A;ones(1,size(A,2)) ]
aFix = [a; ones(1, size(a,2))]

%Solve for the matrix (least norm)
% P = aFix*A'*inv(A*A')

%Solve using least squares
P = findHMatrixCalibration(A', a');

%RMS Calculation
aCalculated = P * A
RMS = sqrt(mean(sum((aCalculated - aFix).^2,1)))


% RMS =
%
%     2.2931




%--------------------------------------------------------
%returns the H matrix given point (3D) and pointp(image) (transformed coordinates)
%   point is N X 3,   pointp is N X 2


