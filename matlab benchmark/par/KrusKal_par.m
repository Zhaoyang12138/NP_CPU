function p_values = KrusKal_par(random_arr)
    % 计算Kruskal两变量检验
    arr_num = size(random_arr, 1);
    p_values = zeros(arr_num, arr_num);
    
    % delete(gcp);
    parpool('Processes',6); %开启6个并行工作池

    CoreNum=6; %设定机器CPU核心数量
    if isempty(gcp('nocreate')) %如果并行未开启
        parpool(CoreNum); %开启Corenum个并行工作池
    end

    disp('start kruskalwallis_par test');
    tic;
    parfor i = 1:arr_num
        for j = 1:arr_num
            [p, ~, ~] = kruskalwallis([random_arr(i,:); random_arr(j,:)], [], 'off'); %#ok<PFBNS>
            p_values(i,j) = p;
        end
    end
    toc;
    
    disp('end kruskalwallis_par test');
    end