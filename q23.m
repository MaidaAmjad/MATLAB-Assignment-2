%% Q3 - Frequency distribution of a discrete variable (Lecture 3)
clc; clear; close all;

defects = [2 0 1 3 2 4 1 2 0 3 5 2 1 1 2 3 0 2 4 1 ...
    2 3 2 1 0 6 2 3 1 2 4 2 1 3 2 0 1 2 5 3];
n = numel(defects);
fprintf('Number of modules n = %d\n\n', n);

x   = min(defects):max(defects);              % possible values
f   = arrayfun(@(v) sum(defects == v), x);    % frequency (tally count)
rf  = f / n;                                  % relative frequency
pf  = 100 * rf;                               % percentage
cf  = cumsum(f);                              % cumulative frequency

T = table(x', f', rf', pf', cf', ...
    'VariableNames', {'Defects','Frequency','RelFreq','Percent','CumFreq'});
disp(T);

[~, idx] = max(f);
fprintf('Most common value (mode) = %d defects per module\n', x(idx));
fprintf('Modules with at most 2 defects: %d (%.1f %%)\n', cf(x==2), 100*cf(x==2)/n);
fprintf('Modules with 4 or more defects: %d (%.1f %%)\n', sum(f(x>=4)), 100*sum(f(x>=4))/n);

figure; bar(x, f); xlabel('Number of defects'); ylabel('Number of modules');
title('Frequency distribution of defects per module');