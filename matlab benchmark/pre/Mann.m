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

% Mann–Whitney U test 两变量检验版本
Mann_res = zeros(arr_num, arr_num);
disp('Mann test start')
tic;
for i = 1:arr_num
    for j = 1:arr_num
        [p, h, stats] = ranksum(random_arr(i, :), random_arr(j, :));
        Mann_res(i, j) = stats.ranksum;
%         Mann_res(j, i) = stats.ranksum;
    end
end
toc;

% 输出结果
disp('Mann res');
disp(size(Mann_res));