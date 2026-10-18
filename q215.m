%% Q15 - Simple linear regression, standard error of estimate, correlation (Lecture 15)
clc; clear; close all;

X = [10 15 20 25 30 40 50 60];                % project size (KLOC)
Y = [24 33 50 58 75 92 128 150];              % effort (person-months)
n = numel(X);

% Least-squares line  Y = a + bX  from the normal equations
b = (n*sum(X.*Y) - sum(X)*sum(Y)) / (n*sum(X.^2) - sum(X)^2);
a = (sum(Y) - b*sum(X)) / n;
fprintf('Regression line: Effort = %.4f + %.4f * KLOC\n', a, b);

% Standard error of estimate  s_y.x = sqrt( sum (Y - Yhat)^2 / (n-2) )
Yhat = a + b*X;
sse  = sum((Y - Yhat).^2);
syx  = sqrt(sse/(n-2));
sy   = sqrt(mean((Y - mean(Y)).^2));
fprintf('Standard error of estimate = %.4f person-months (SD of Y = %.4f)\n', syx, sy);

syx2 = sqrt((sum(Y.^2) - a*sum(Y) - b*sum(X.*Y))/(n-2));   % alternative formula
fprintf('Alternative formula        = %.4f\n', syx2);

r = (n*sum(X.*Y) - sum(X)*sum(Y)) / sqrt((n*sum(X.^2)-sum(X)^2)*(n*sum(Y.^2)-sum(Y)^2));
fprintf('Correlation r = %.4f, r^2 = %.4f (%.1f %% of effort variation explained by size)\n', r, r^2, 100*r^2);

newKLOC = 35;
fprintf('Predicted effort for %d KLOC = %.2f person-months\n', newKLOC, a + b*newKLOC);

figure; plot(X, Y, 'bo', 'MarkerFaceColor', 'b'); hold on;
xx = linspace(5, 65, 100); plot(xx, a + b*xx, 'r-', 'LineWidth', 1.5); hold off;
xlabel('Project size (KLOC)'); ylabel('Effort (person-months)');
title('Effort vs size with least-squares line'); grid on;