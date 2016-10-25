function out = findHMatrixCalibration (point, pointp)

%shows  the general form of A matrix...
% x1 = point1(1);
% x2 = point2(1);
% x3 = point3(1);
% x4 = point4(1);
% y1 = point1(2);
% y2 = point2(2);
% y3 = point3(2);
% y4 = point4(2);
%
% x1p = point1p(1);
% x2p = point2p(1);
% x3p = point3p(1);
% x4p = point4p(1);
% y1p = point1p(2);
% y2p = point2p(2);
% y3p = point3p(2);
% y4p = point4p(2);
%
% A = [x1 y1 z1 1 0  0  0  0;
%      0  0  0 0 x1 y1 z1 1;
%      x2 y2 z2 1 0  0  0  0;
%      0  0  0 0 x2 y2 z2 1 ;
%      x3 y3 z3 1 0  0  0  0;
%      0  0  0 0 x3 y3 z3 1;
%      x4 y4 z4 1 0  0  0  0;
%      0  0  0 0 x4 y4 z4 1  ;
%      ];
%  ...
% b = [x1p y1p x2p y2p x3p y3p x4p y4p ... ]';
%
A = [];
b = [];
for index = 1:size(point,1)
    xCurrent = point(index,1);
    xpCurrent = pointp(index,1);
    yCurrent = point(index,2);
    ypCurrent = pointp(index,2);
    zCurrent =point(index, 3);


    %calculates A matrix and B vector
    A = [A;
         xCurrent yCurrent zCurrent 1 0 0 0 0;
         0 0 0 0 xCurrent yCurrent zCurrent 1];
     b = [b; xpCurrent; ypCurrent];
end

%least squares solution
 x = (A'*A)^-1 * A'*b;
%  x = A\B;  This is an alternative way to obtain the solution.

 a = x(1);
 b = x(2);
 c = x(3);
 d = x(4);
 e = x(5);
 f = x(6);
 g = x(7);
 h = x(8);

 H = [a b c d;
      e f g h;
      0 0 0 1];
 out = H;

end
