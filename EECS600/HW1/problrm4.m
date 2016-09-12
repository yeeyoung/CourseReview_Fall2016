A = [ 8, 4, 2, 1; 4, 8, 4, 2; 2, 4, 8, 4; 1, 2, 4, 8];
N=10; v = [.5; .5; .5; .5]; eig(A)
lambda1 = zeros(N,1);
for k = 1:N
    w = A*v; v = w/norm(w,2);
    lambda1(k) = v'*A*v;
end
mu = 0; v = [.5; .5; .5; .5]; lambda2 = zeros(N,1);
for k = 1:N
    w = (A-mu*eye(4))\v; v = w/norm(w,2);
    lambda2(k) = v'*A*v;
end
v = [.5; .5; .5; .5]; lambda3 = zeros(N+1,1);
lambda3(1) = v'*A*v;
for k = 2:N+1
    w = (A-lambda3(k-1)*eye(4))\v; v = w/norm(w,2);
    lambda3(k) = v'*A*v;
end
disp([(1:N)', lambda1, lambda2, lambda3(2:N+1)])
for k = 1:N
    [Q, R] = qr(A); A = R*Q;
    E = max(max(abs(A-diag(diag(A)))));
    disp(E);
end