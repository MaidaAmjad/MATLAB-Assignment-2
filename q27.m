%% Q7 - Arithmetic mean, Weighted mean and Median (Lecture 7)
clc; clear; close all;

coverage = [92 78 85 60 70];                  % % statement coverage of 5 modules
loc      = [1200 3400 2500 4100 800];         % size of each module (weights)

simpleMean   = sum(coverage)/numel(coverage);
weightedMean = sum(loc .* coverage) / sum(loc);
fprintf('(a) Simple mean coverage   = %.2f %%\n', simpleMean);
fprintf('    Weighted mean coverage = %.2f %%  (large, poorly tested modules pull it down)\n\n', weightedMean);

fix = [3 5 2 8 4 12 6 3 7 30];                % bug-fix times (hours)
n   = numel(fix);
xs  = sort(fix);
if mod(n,2) == 1
    med = xs((n+1)/2);
else
    med = (xs(n/2) + xs(n/2+1)) / 2;
end
fprintf('(b) Sorted data : %s\n', mat2str(xs));
fprintf('    Mean   = %.2f h\n', mean(fix));
fprintf('    Median = %.2f h  (built-in median = %.2f)\n', med, median(fix));

xs2 = sort(fix(fix < 30));                    % remove the outlier
fprintf('    Without the 30 h outlier -> mean = %.2f h, median = %.2f h\n', mean(xs2), median(xs2));