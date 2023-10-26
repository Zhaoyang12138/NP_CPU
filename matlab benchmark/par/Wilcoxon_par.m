function wilcoxon_res = Wilcoxon_par(random_arr)
    % Wilcoxon signed-rank test 两变量检验版本
    arr_num = size(random_arr, 1);
    wilcoxon_res = zeros(arr_num, arr_num);

    % delete(gcp);
    parpool('Processes',6); %开启6个并行工作池

    CoreNum=6; %设定机器CPU核心数量
    if isempty(gcp('nocreate')) %如果并行未开启
        parpool(CoreNum); %开启Corenum个并行工作池
    end

    disp('start wilcoxon test');

    tic;
    parfor i = 1:arr_num
        for j = 1:arr_num
            [~, ~, stats] = signrank(random_arr(i, :), random_arr(j, :)); %#ok<*PFBNS>
            wilcoxon_res(i, j) = stats.signedrank;
        end
    end
    toc;
    % 输出结果
    delete(gcp);
    
    fprintf('end wilcoxon test\n\n');

    disp(size(wilcoxon_res));