function spearmanr_res = Spearman(random_arr)
    % 计算矩阵数据的Spearman相关系数
    % arr = im2double(random_arr');
    arr = random_arr';
    % arr = random_arr;
    
    disp('start spearman test');

    tic;
    spearmanr_res = corr(arr, 'type', 'Spearman');
    % spearmanr_res = corrcoef(arr, 'type', 'Spearman');
    toc;
    size(spearmanr_res)
    fprintf('end spearman test\n\n');
    disp(size(spearmanr_res));

    end