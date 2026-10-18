%% Q11 - Mean deviation, variance, standard deviation, CV (Lecture 11)
clc; clear; close all;

A = [102 98 105 100 97 103 99 96];            % runtime (ms) of algorithm A over 8 runs
B = [48 62 40 55 70 45 52 60];                % runtime (ms) of algorithm B

data = {A, B};  names = {'Algorithm A', 'Algorithm B'};
for i = 1:2
    x  = data{i};  n = numel(x);
    mu = sum(x)/n;
    MD = sum(abs(x - mu)) / n;                % mean deviation about the mean
    s2 = sum((x - mu).^2) / n;                % variance (divisor n, as in the course)
    s  = sqrt(s2);                            % standard deviation
    s2_short = sum(x.^2)/n - mu^2;            % short-cut formula check
    CV = 100 * s / mu;                        % coefficient of variation (%)
    fprintf('%s: mean = %.3f | MD = %.3f | variance = %.3f (short-cut %.3f) | SD = %.3f | CV = %.2f %%\n', ...
        names{i}, mu, MD, s2, s2_short, s, CV);
    fprintf('   built-in std(x,1) = %.3f (divisor n);  std(x) = %.3f (divisor n-1)\n', std(x,1), std(x));
end
fprintf('\nAlgorithm B is faster on average but far less consistent (larger CV).\n');