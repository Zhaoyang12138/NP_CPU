arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192];
arr_sizes = [256, 512, 1024, 2048, 4096, 8192];
% 
rng(42);
% 
arr_num = arr_nums(3);
arr_size = arr_sizes(1);
min_val = 0;
max_val = 2^32 - 1;
random_arr = randi([min_val, max_val], arr_num, arr_size);

% % Kendall相关系数
% p_kendall = Kendall(random_arr);

% % Spearman相关系数
% p_spearman = Spearman(random_arr);

% Mann-Whitney U检验
% p_mannwhitneyu = Mann_par(random_arr);

% Wilcoxon符号秩检验
p_wilcoxon = Wilcoxon_par(random_arr);

% % Friedman检验
% p_friedman = Friedman(random_arr);

% % Kruskal算法
% p_kruskal = KrusKal_par(random_arr);
