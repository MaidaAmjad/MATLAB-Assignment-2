%% Q8 - Grouped median, quartiles, deciles, percentiles, open-ended class (Lecture 8)
clc; clear; close all;

lowerB = [0 4 8 12 16 24];                    % lower boundaries
upperB = [4 8 12 16 24 Inf];                  % Inf marks the open-ended class
f      = [18 32 25 12 8 5];
n      = sum(f);
cf     = cumsum(f);
C      = [0 cf(1:end-1)];                     % cumulative freq before each class

% General grouped quantile:  Q = l + (h/f) * (p*n - C)
cls   = @(p) find(C + f >= p*n, 1, 'first');   % class containing the quantile
quant = @(p) lowerB(cls(p)) + (upperB(cls(p)) - lowerB(cls(p))) / f(cls(p)) * (p*n - C(cls(p)));

fprintf('n = %d\n', n);
fprintf('Median (Q2) = %.3f h\n', quant(0.50));
fprintf('Q1          = %.3f h\n', quant(0.25));
fprintf('Q3          = %.3f h\n', quant(0.75));
fprintf('D7          = %.3f h\n', quant(0.70));
fprintf('P90         = %.3f h  -> 10%% of bugs take longer than this\n', quant(0.90));

mid  = [2 6 10 14 20 28];                     % open class midpoint assumed = 28
meanE = sum(f.*mid)/n;
modeE = 3*quant(0.5) - 2*meanE;
fprintf('Approx. mean = %.3f h (assumes open class midpoint = 28)\n', meanE);
fprintf('Mode (empirical relation 3*Median - 2*Mean) = %.3f h\n', modeE);