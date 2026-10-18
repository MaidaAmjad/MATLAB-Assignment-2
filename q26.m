%% Q6 - Stem-and-Leaf display and Mode (Lecture 6)
clc; clear; close all;

loc = [12 15 21 23 23 25 28 31 34 34 34 37 41 42 45 45 48 52 55 56 ...
    63 67 72 74 85 98 34 29 47 61];
loc = sort(loc);

stems = floor(loc/10);                        % tens digit
leaves = mod(loc, 10);                        % units digit
fprintf('Stem | Leaves      (Key: 3|4 means 34 LOC)\n');
fprintf('-----+-----------------------------\n');
for s = min(stems):max(stems)
    L = leaves(stems == s);
    fprintf('%4d | %s\n', s, sprintf('%d ', L));
end

vals = unique(loc);
cnt  = arrayfun(@(v) sum(loc == v), vals);
m    = vals(cnt == max(cnt));
fprintf('\nMode = %s LOC (occurs %d times)\n', mat2str(m), max(cnt));
fprintf('Check with built-in mode(): %d\n', mode(loc));