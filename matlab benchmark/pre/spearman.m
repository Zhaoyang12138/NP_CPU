arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192];
arr_sizes = [256, 512, 1024, 2048, 4096, 8192];
% 
rng(42);
% 
arr_num = arr_nums(3);
arr_size = arr_sizes(5);
% 
min_val = 0;
max_val = 2^16 - 1;
random_arr = randi([min_val, max_val], arr_num, arr_size, 'uint32');
% disp([arr_size, feature]);
% disp(size(random_arr));
tic;
spearmanr_res2 = corr(im2double(random_arr'), 'type', 'Spearman');
toc;
disp(size(spearmanr_res2));