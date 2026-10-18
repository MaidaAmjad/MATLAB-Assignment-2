%% Q13 - Box-and-whisker plot and Pearson's coefficient of skewness (Lecture 13)
clc; clear; close all;

x  = [12 15 18 20 22 25 25 28 30 33 35 40 45 60 400];   % lines changed per commit
n  = numel(x);  xs = sort(x);
qvu = @(p) interp1(1:n, xs, p*(n+1));

Q1 = qvu(0.25);  Q2 = qvu(0.5);  Q3 = qvu(0.75);
IQR = Q3 - Q1;
lowFence  = Q1 - 1.5*IQR;
highFence = Q3 + 1.5*IQR;
outliers  = x(x < lowFence | x > highFence);
adjMax = max(x(x <= highFence));  adjMin = min(x(x >= lowFence));

fprintf('Q1 = %.2f, Median = %.2f, Q3 = %.2f, IQR = %.2f\n', Q1, Q2, Q3, IQR);
fprintf('Fences: [%.2f, %.2f]  -> outliers: %s\n', lowFence, highFence, mat2str(outliers));

% Box plot drawn manually (no toolbox needed)
figure; hold on;
rectangle('Position', [1 Q1 1 IQR]);                       % box
plot([1 2], [Q2 Q2], 'r', 'LineWidth', 2);                 % median
plot([1.5 1.5], [adjMin Q1], 'k'); plot([1.5 1.5], [Q3 adjMax], 'k');   % whiskers
plot([1.25 1.75], [adjMin adjMin], 'k'); plot([1.25 1.75], [adjMax adjMax], 'k');
plot(1.5*ones(size(outliers)), outliers, 'ro');            % outliers
xlim([0 3]); set(gca,'XTick',[]); ylabel('Lines changed per commit');
title('Box-and-whisker plot of commit sizes'); hold off;

mu = mean(x);  s = sqrt(mean((x-mu).^2));
vals = unique(x);  cnt = arrayfun(@(v) sum(x==v), vals);  mo = vals(find(cnt==max(cnt),1));
Sk1 = (mu - mo)/s;
Sk2 = 3*(mu - median(x))/s;
fprintf('Mean = %.2f, Median = %.2f, Mode = %g, SD = %.2f\n', mu, median(x), mo, s);
fprintf('Pearson Sk1 = (mean-mode)/SD    = %.4f\n', Sk1);
fprintf('Pearson Sk2 = 3(mean-median)/SD = %.4f  -> positively skewed\n', Sk2);