%% Q9 - Geometric mean, Harmonic mean and their relation to AM (Lecture 9)
clc; clear; close all;

factor = [1.10 1.25 0.95 1.40];               % speed multiplier of each release
GMg = prod(factor)^(1/numel(factor));
AMg = mean(factor);
fprintf('(a) Release speed factors : %s\n', mat2str(factor));
fprintf('    Geometric mean = %.4f  (true average growth per release = %.2f %%)\n', GMg, 100*(GMg-1));
fprintf('    Arithmetic mean = %.4f (overstates the growth)\n', AMg);
fprintf('    Total speed-up over 4 releases = %.4f = GM^4 = %.4f\n\n', prod(factor), GMg^4);

speed = [50 80 120];                          % records processed per ms
AM = mean(speed);
GM = prod(speed)^(1/numel(speed));
HM = numel(speed) / sum(1./speed);
fprintf('(b) Server speeds (rec/ms): %s\n', mat2str(speed));
fprintf('    AM = %.3f, GM = %.3f, HM = %.3f\n', AM, GM, HM);
fprintf('    Relation AM >= GM >= HM holds: %d\n', AM >= GM && GM >= HM);
fprintf('    GM^2 = %.3f vs AM*HM = %.3f (equal only for two values)\n', GM^2, AM*HM);

totalTime = sum(1e6 ./ speed);                % each server handles 1 million records
trueRate  = numel(speed)*1e6 / totalTime;
fprintf('    True overall rate = %.3f rec/ms = HM\n', trueRate);