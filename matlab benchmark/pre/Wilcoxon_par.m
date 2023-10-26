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

% Wilcoxon signed-rank test 两变量检验版本
wilcoxon_res = zeros(arr_num, arr_num);

% delete(gcp);
parpool('Processes',6); %开启6个并行工作池

CoreNum=6; %设定机器CPU核心数量
if isempty(gcp('nocreate')) %如果并行未开启
    parpool(CoreNum); %开启Corenum个并行工作池
end

tic;
parfor i = 1:arr_num
    for j = 1:arr_num
        [p, h, stats] = signrank(random_arr(i, :), random_arr(j, :));
        wilcoxon_res(i, j) = stats.signedrank;
    end
end
toc;
% 输出结果
delete(gcp);
disp('Wilcoxon res');
disp(size(wilcoxon_res));

