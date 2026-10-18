%% Q10 - Range, coefficient of dispersion, quartile deviation (Lecture 10)
clc; clear; close all;

A = [45 48 52 50 47 49 51 46 53];             % latency (ms), region A
B = [30 35 28 90 32 31 150 34 29 33 36];      % latency (ms), region B (11 requests)

% Quartile by the course method: p-th quartile at position p*(n+1) with interpolation
qvu = @(x,p) interp1(1:numel(x), sort(x), p*(numel(x)+1));

data  = {A, B};  names = {'Region A', 'Region B'};
for i = 1:2
    x  = data{i};
    R  = max(x) - min(x);
    CD = (max(x) - min(x)) / (max(x) + min(x));
    Q1 = qvu(x, 0.25);  Q3 = qvu(x, 0.75);
    QD = (Q3 - Q1) / 2;
    CQD = (Q3 - Q1) / (Q3 + Q1);
    fprintf('%s: Range = %g | Coeff. of dispersion = %.4f | Q1 = %.2f, Q3 = %.2f | QD = %.3f | CQD = %.4f\n', ...
        names{i}, R, CD, Q1, Q3, QD, CQD);
end
fprintf('\nThe range of B is dominated by two spikes (90 and 150 ms);\n');
fprintf('the quartile deviation (based on the middle 50%% of values) stays small and describes typical behaviour.\n');