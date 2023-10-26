function wilcoxon_res = Wilcoxon(random_arr)
    % Wilcoxon signed-rank test 两变量检验版本
    arr_num = size(random_arr, 1);
    wilcoxon_res = zeros(arr_num/2);

    fprintf('size of random_arr: %d\n', size(random_arr, 1));
    disp("Start Wilcoxon signed-rank test");

    % n^2
    % tic;
    % for i = 1:arr_num
    %     for j = i+1:arr_num
    %         [~, ~, stats] = signrank(random_arr(i, :), random_arr(j, :));
    %         wilcoxon_res(i, j) = stats.signedrank;
    %         wilcoxon_res(j, i) = stats.signedrank;
    %     end
    % end
    % toc;

    % n/2
    tic;
    for i = 1:2:arr_num-1
            [~, ~, stats] = signrank(random_arr(i, :), random_arr(i+1, :));
            wilcoxon_res(ceil(i/2)) = stats.signedrank;
    end
    toc;

    fprintf('size of wilcoxon_res: %d\n', size(wilcoxon_res, 1));
    fprintf('end Wilcoxon test\n\n');
    end