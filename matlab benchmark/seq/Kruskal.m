function p_values = Kruskal(random_arr)
    % 计算Kruskal两变量检验
    arr_num = size(random_arr, 1);
    fprintf("size of random_arr: %d\n", arr_num);
    % p_values = zeros(arr_num, arr_num);
    p_values = zeros(arr_num/2);

    disp('start kruskalwallis test');
    
    tic
    for i = 1:2:arr_num-1
            [p, ~, ~] = kruskalwallis([random_arr(i,:); random_arr(i+1,:)], [], 'off');
            p_values(ceil(i/2)) = p;
    end
    toc;

    fprintf("size of p_values: %d\n", size(p_values, 1));
    fprintf('end kruskalwallis test\n\n');

    end