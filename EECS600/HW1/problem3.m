%Problem 3
A = [8 4 2 1; 4 8 4 2; 2 4 8 4; 1 2 4 8];
m = 4;
%A = rand(m); AA = A'*A;
A1 = A;
t = cputime;
for k = 1:m-2
    x = A1(k+1:m,k);
    v = x;
    v(1) = v(1) + sign(x(1))*norm(x,2);
    v = v/norm(v,2);
    A1(k+1:m,k:m) = A1(k+1:m,k:m) - 2*v*(v'*A1(k+1:m,k:m));
    A1(1:m,k+1:m) = A1(1:m,k+1:m) - 2*(A1(1:m,k+1:m)*v)*v';
end
dt = cputime - t;
A2 = A;
t1 = cputime;
for k = 1:m-2
    x = A2(k+1:m, k);
    v = x;
    v(1) = v(1) + sign(x(1))*norm(x,2);
    v = v/norm(v,2);
    A2(k+1,k) = -sign(x(1))*norm(x,2);
    A2(k,k+1) = -sign(x(1))*norm(x,2);
    A2(k+2:m,k) = 0; A2(k,k+2:m) = 0;
    B = 2*(A2(k+1:m,k+1:m)*v - (v'*A2(k+1:m,k+1:m)*v)*v)*v';
    for j = 1:m-k
        A2(k+j,k+1:k+j) = A2(k+j,k+1:k+j) - B(j,1:j) - B(1:j,j)';
        A2(k+1:k+j,k+j) = A2(k+j,k+1:k+j);
    end
    %A2(k+1:m,k+1:m) = A2(k+1:m,k+1:m) - B - B';
end
dt1 = cputime - t1;

  