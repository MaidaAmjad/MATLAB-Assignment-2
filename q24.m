%% Q4 - Frequency distribution of a continuous variable (Lecture 4)
clc; clear; close all;

rt = [245 272 222 179 209 173 250 391 206 197 290 277 254 177 242 312 153 208 126 156 ...
    128 225 157 269 258 229 101 203 241 255 143 207 174 184 355 184 242 333 199 235 ...
    254 250 159 251 394 142 331 255 195 493];
n = numel(rt);

R  = max(rt) - min(rt);                       % range
k  = ceil(1 + 3.322*log10(n));                % Sturges' rule
h  = ceil(R / k / 10) * 10;                   % class width rounded up to nearest 10
lo = floor(min(rt)/10)*10;                    % lower limit of first class
fprintf('Range = %d, classes k = %d, class width h = %d\n\n', R, k, h);

lower = lo + (0:k-1)*h;                       % lower class limits (inclusive)
upper = lower + h;                            % upper boundary (exclusive)
mid   = (lower + upper) / 2;                  % class marks
f     = zeros(1,k);
for i = 1:k
    f(i) = sum(rt >= lower(i) & rt < upper(i));
end
rf = f/n; cf = cumsum(f);

T = table(lower', upper', mid', f', rf', cf', ...
    'VariableNames', {'Lower','Upper','ClassMark','Freq','RelFreq','CumFreq'});
disp(T);
fprintf('Check: sum of frequencies = %d (should be %d)\n', sum(f), n);

figure; bar(mid, f, 1); xlabel('Response time (ms)'); ylabel('Frequency');
title('Histogram of API response times'); hold on; plot(mid, f, 'r-o'); hold off;