%% Q2 - Data collection and Sampling (Lecture 2)
clc; clear; close all;
rng(1);                                       % reproducible randomness

N_h   = [3000 4500 1500 1000];                % bug reports per module (strata)
names = {'Frontend','Backend','Database','Mobile'};
N     = sum(N_h);                             % population size = 10000
n     = 200;                                  % total sample size

% (a) Simple random sampling (without replacement)
srs = sort(randperm(N, n));
fprintf('(a) SRS: first 10 selected report IDs: %s\n', mat2str(srs(1:10)));

% (b) Systematic sampling
k     = N / n;                                % sampling interval = 50
start = randi(k);                             % random start between 1 and k
sys   = start:k:N;
fprintf('(b) Systematic: k = %d, random start = %d, sample size = %d\n', k, start, numel(sys));
fprintf('    first 6 IDs: %s\n', mat2str(sys(1:6)));

% (c) Proportional stratified random sampling
n_h = round(n * N_h / N);                     % proportional allocation
fprintf('(c) Proportional allocation (n_h = n * N_h / N):\n');
edges = [0 cumsum(N_h)];
strat = [];
for i = 1:numel(N_h)
    ids   = edges(i) + randperm(N_h(i), n_h(i));
    strat = [strat ids];                      %#ok<AGROW>
    fprintf('    %-9s N_h = %4d  ->  n_h = %3d\n', names{i}, N_h(i), n_h(i));
end
fprintf('    total stratified sample = %d\n', numel(strat));

bar([N_h/N*100; n_h/n*100]');
set(gca, 'XTickLabel', names); legend('Population %','Sample %');
ylabel('Percentage'); title('Proportional stratified sample mirrors the population');