%% Q14 - Moments, Sheppard's corrections, Bowley skewness, kurtosis (Lecture 14)
clc; clear; close all;

bnd = 0.5:5:30.5;                             % class boundaries
mid = (bnd(1:end-1) + bnd(2:end))/2;          % class marks
f   = [10 25 30 20 10 5];
n   = sum(f);  h = 5;

% Moments about an arbitrary origin A, using u = (x-A)/h
A = 13;  u = (mid - A)/h;
mr = zeros(1,4);
for r = 1:4
    mr(r) = h^r * sum(f .* u.^r) / n;         % raw moments about A
end
m2 = mr(2) - mr(1)^2;
m3 = mr(3) - 3*mr(2)*mr(1) + 2*mr(1)^3;
m4 = mr(4) - 4*mr(3)*mr(1) + 6*mr(2)*mr(1)^2 - 3*mr(1)^4;
mu = A + mr(1);
fprintf('Mean = %.3f\nm2 = %.4f, m3 = %.4f, m4 = %.4f (uncorrected)\n', mu, m2, m3, m4);

% Sheppard's corrections
m2c = m2 - h^2/12;
m3c = m3;
m4c = m4 - (h^2/2)*m2 + (7/240)*h^4;
fprintf('Corrected: m2 = %.4f, m3 = %.4f, m4 = %.4f\n', m2c, m3c, m4c);

% Moment ratios
b1 = m3c^2 / m2c^3;   b2 = m4c / m2c^2;
if b2 > 3, kind = 'leptokurtic'; elseif b2 < 3, kind = 'platykurtic'; else, kind = 'mesokurtic'; end
fprintf('b1 = %.4f (skewness, sign of m3 is %+d)\nb2 = %.4f (%s)\n', b1, sign(m3c), b2, kind);

% Quantiles of grouped data by linear interpolation on the ogive
cf = [0 cumsum(f)];
q  = @(p) interp1(cf, bnd, p*n);
Q1 = q(0.25); Q2 = q(0.5); Q3 = q(0.75); P10 = q(0.10); P90 = q(0.90);

Bowley = (Q3 + Q1 - 2*Q2) / (Q3 - Q1);
kappa  = ((Q3 - Q1)/2) / (P90 - P10);
fprintf('Q1 = %.3f, Q2 = %.3f, Q3 = %.3f, P10 = %.3f, P90 = %.3f\n', Q1, Q2, Q3, P10, P90);
fprintf('Bowley skewness = %.4f\n', Bowley);
if kappa > 0.263, kk = 'platykurtic'; elseif kappa < 0.263, kk = 'leptokurtic'; else, kk = 'mesokurtic'; end
fprintf('Percentile kurtosis = %.4f (mesokurtic = 0.263) -> %s\n', kappa, kk);