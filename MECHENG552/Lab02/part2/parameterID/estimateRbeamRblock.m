function [estRbeam estRblock] = estimateRbeamRblock()
% a bit of non-linear least squares to choose rbeam that best explains the
% data that we've seen

% initial estimate for R = [rbeam, rblock];
r = [2.3250; 6.35];

dRtol = 1e-9;
maxiter = 1000;

dR = Inf;
iter = 0;

% our observed data
displacement = [3.64; 4.23; 4.77; 5.07; 5.29; 5.40; 5.59; 6.09; 6.43; 7.39; 8.52];
VoltageFraction = [0.201; 0.301; 0.404; 0.493; 0.597; 0.696; 0.783; 0.849; 0.924; 0.965; 0.985];

while ((max(abs(dR)) >= dRtol) && (iter < maxiter))
    z = zeros(length(displacement),1);
    for i = 1:length(z)
        z(i) = computeI(r,displacement(i));
    end
    
    e = VoltageFraction - z;
    
    J = jacobianS(@computeI,r,displacement);
    
    dR = J \ e;
    
    r = r + dR;
    
    iter = iter + 1;
    
end

if (iter > maxiter)
        disp('Reached max iterations!');
end

z = zeros(length(displacement),1);
for i = 1:length(z)
    z(i) = computeI(r,displacement(i));
end

e = VoltageFraction - z;
disp('magnitude of error = ');
error = norm(e)


estRbeam = r(1);
estRblock = r(2);
end

% computes the jacobian of the vector valued function at x0
function [J] = jacobianS(f, x0, D)

dx = 1e-7;

J = zeros(length(D),length(x0));

for j = 1:length(D)
    f0 = f(x0,D(j));
    for i = 1:length(x0)
        x = x0;
        % Perturb just the i'th value of x
        x(i) = x(i) + dx;
        
        J(j,i) = (f(x,D(j)) - f0) / dx; 
    end
end

end

function [I] = computeI(R, d)
    
    I = irradianceEstimate(R(1), R(2), d);
end

