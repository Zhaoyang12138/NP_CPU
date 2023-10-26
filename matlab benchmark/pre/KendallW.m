function KendallW_res = KendallW(random_arr)
    % Mann–Whitney U test 两变量检验版本
    arr_num = size(random_arr, 1);
    KendallW_res = zeros(arr_num/2);

    fprintf('size of random_arr: %d\n', arr_num);
    disp('start kendallW test')

    