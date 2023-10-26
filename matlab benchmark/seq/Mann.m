function Mann_res = Mann(random_arr)
    % Mann–Whitney U test 两变量检验版本
    arr_num = size(random_arr, 1);
    Mann_res = zeros(arr_num/2);

    fprintf('size of random_arr: %d\n', arr_num);
    disp('start Mann test')

    % tic;
    % for i = 1:arr_num
    %     for j = 1:arr_num
    %         [~, ~, stats] = ranksum(random_arr(i, :), random_arr(j, :));
    %         Mann_res(i, j) = stats.ranksum;
    % %         Mann_res(j, i) = stats.ranksum;
    %     end
    % end
    % toc;

    tic;
    for i = 1:2:arr_num-1
            [~, ~, stats] = signrank(random_arr(i, :), random_arr(i+1, :));
            Mann_res(ceil(i/2)) = stats.signedrank;
    end
    toc;
    
    % 输出结果
    fprintf("size of Mann_res: %d\n", size(Mann_res, 1));
    fprintf('end Mann test\n\n');

    end