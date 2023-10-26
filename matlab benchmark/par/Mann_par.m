function Mann_res = Mann_par(random_arr)
    % Mann–Whitney U test 两变量检验版本
    arr_num = size(random_arr, 1);
    Mann_res = zeros(arr_num, arr_num);
    
    CoreNum = 6; % 设定机器CPU核心数量
    if isempty(gcp('nocreate')) % 如果并行未开启
        parpool(CoreNum); % 开启Corenum个并行工作池
    end
    
    disp('start Mann_par test');
    
    tic;
    parfor i = 1:arr_num
        for j = 1:arr_num
            [p, h, stats] = ranksum(random_arr(i, :), random_arr(j, :)); %#ok<*PFBNS>
            Mann_res(i, j) = stats.ranksum;
    %         Mann_res(j, i) = stats.ranksum;
        end
    end
    toc;
    delete(gcp); % 关闭并行池
    
    
    fprintf('end Mann test\n\n');
    disp(size(Mann_res));
    end