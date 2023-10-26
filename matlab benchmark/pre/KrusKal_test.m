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

p_values = zeros(arr_num, arr_num);

disp('start kruskalwallis test');
tic;
% 计算Kruskal两变量检验
for i = 1:arr_num
    for j = i+1:arr_num
        [p, tbl, stats] = kruskalwallis([random_arr(i,:); random_arr(j,:)], [], 'off');
        p_values(i,j) = p;
        p_values(j,i) = p;
    end
end
toc;
disp('end kruskalwallis test');

