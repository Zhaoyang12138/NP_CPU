arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192];
arr_sizes = [256, 512, 1024, 2048, 4096, 8192];
% 
rng(42);
% 
arr_num = arr_nums(7);
% arr_num = 16;
% arr_num = 4096;
arr_size = arr_sizes(5);
% arr_size = 2048;

min_val = 0;
max_val = 2^32 - 1;
random_arr = randi([min_val, max_val], arr_num, arr_size, "single");
fprintf("size of random_arr: %d * %d\n", size(random_arr, 1), size(random_arr, 2));

% Kendall相关系数
% p_kendall = Kendall_(random_arr);

% Spearman相关系数
p_spearman = Spearman(random_arr);

% Wilcoxon符号秩检验 double
p_wilcoxon = Wilcoxon(random_arr);

% Friedman检验 all
p_friedman = Friedman(random_arr);

% Mann-Whitney U检验 double
p_mannwhitneyu = Mann(random_arr);

% Kruskal算法 double
p_kruskal = Kruskal(random_arr);

% Brown-Forsythe 检验
% brown_res = Brown_test(random_arr);

% Kendall'W 检验
kendallw_res = KendallCoef(random_arr);

% % Levene 检验
% levene_res = Levene(random_arr);
