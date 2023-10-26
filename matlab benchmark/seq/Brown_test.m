function p_values = Brown_test(random_arr)
    arr_num = size(random_arr, 1);
    p_values = zeros(arr_num/2);

    disp('start Brown_test test');
    
    tic;
    % [p,~] = vartestn(random_arr','TestType','BrownForsythe','Display','off')
    
    for i = 1:2:arr_num-1
       [~] = vartestn([random_arr(i,:); random_arr(i+1,:)], 'TestType', 'BrownForsythe', 'Display', 'off');
%        p_values(ceil(i/2)) = 0;
    end
    toc;    
    % fprintf('p-value = %f\n', p);
    fprintf('end Brown_test test\n\n');

    end