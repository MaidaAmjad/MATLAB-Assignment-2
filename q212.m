%% Q12 - Chebychev, Empirical Rule, Five-Number Summary (Lecture 12)
clc; clear; close all;

mu = 200;  sd = 40;                           % API response time (ms)
for k = [1.5 2 3]
    fprintf('(a) k = %.1f : at least %.2f %% of requests lie in [%g, %g] ms\n', ...
        k, 100*(1 - 1/k^2), mu - k*sd, mu + k*sd);
end

x = [219 170 202 214 195 217 198 217 236 183 205 188 203 170 186 195 222 229 167 180 216 150 188 198];
n = numel(x);  m = mean(x);  s = sqrt(mean((x-m).^2));
fprintf('\n(b) mean = %.2f, SD = %.2f\n', m, s);
expected = [68 95 99.7];
for k = 1:3
    inside = sum(abs(x - m) <= k*s);
    fprintf('    within %d SD: %2d of %d = %.1f %%   (empirical rule says about %.1f %%)\n', ...
        k, inside, n, 100*inside/n, expected(k));
end

xs  = sort(x);
qvu = @(p) interp1(1:n, xs, p*(n+1));
five = [xs(1) qvu(0.25) qvu(0.5) qvu(0.75) xs(end)];
fprintf('\n(c) Five-number summary: Min = %g, Q1 = %.2f, Median = %.2f, Q3 = %.2f, Max = %g\n', five);