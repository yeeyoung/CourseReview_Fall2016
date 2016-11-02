%% EECS 442 - Midterm - Q2 Computing H 
%  Date: 2016 / 11 / 02
%  by Yi Yang
%  DLT algorithm estimating Homographical transformation

%% Initialization

clear; close all; clc

%readPoints
[p1, p2] = readPoints('4points.txt');
p1 = [p1, ones(size(p1,1),1)];
p2 = [p2, ones(size(p2,1),1)];

H = Homography(p1, p2)