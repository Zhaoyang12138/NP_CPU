arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192];
arr_sizes = [256, 512, 1024, 2048, 4096, 8192];
% 
rng(42);
% 
arr_num = arr_nums(3);
arr_size = arr_sizes(5);
min_val = 0;
max_val = 2^32 - 1;

% 生成随机整数矩阵
random_arr = randi([min_val, max_val], arr_num, arr_size);
fprintf('arr_size: %d, feature: %d\n', arr_num, arr_size);
% Friedman's test
disp('Friedman''s test');
tic;
[p, table, stats] = friedman(random_arr, 1, 'off');
toc;
fprintf('p-value: %f\n', p);
