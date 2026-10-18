%% 
%% Q1 - Variables, Scales of Measurement and Error of Measurement (Lecture 1)
clc; clear; close all;

vars  = {'Lines of code (LOC) of a function'; 'Programming language used'; ...
    'Bug severity (Low/Medium/High/Critical)'; 'Number of defects in a module'; ...
    'Page load time (seconds)'; 'Developer ID number'; ...
    'Test case result (Pass/Fail)'; 'CPU temperature (Celsius)'};
kind  = {'Quantitative - Discrete'; 'Qualitative'; 'Qualitative'; 'Quantitative - Discrete'; ...
    'Quantitative - Continuous'; 'Qualitative (label only)'; 'Qualitative'; 'Quantitative - Continuous'};
scale = {'Ratio'; 'Nominal'; 'Ordinal'; 'Ratio'; 'Ratio'; 'Nominal'; 'Nominal'; 'Interval'};
T = table(vars, kind, scale, 'VariableNames', {'Variable','Type','Scale'});
disp(T);

trueTime = 2.50;                              % real page load time (s)
measured = [2.62 2.41 2.55 2.70 2.48];        % five profiler readings (s)

err      = measured - trueTime;               % error
absErr   = abs(err);                          % absolute error
relErr   = absErr / trueTime;                 % relative error
pctErr   = 100 * relErr;                      % percentage error

R = table((1:5)', measured', err', absErr', pctErr', ...
    'VariableNames', {'Run','Measured','Error','AbsError','PercentError'});
disp(R);
fprintf('Mean absolute error      = %.4f s\n', mean(absErr));
fprintf('Mean percentage error    = %.2f %%\n', mean(pctErr));
fprintf('Average (signed) error   = %+.4f s  (positive => profiler over-reports)\n', mean(err));