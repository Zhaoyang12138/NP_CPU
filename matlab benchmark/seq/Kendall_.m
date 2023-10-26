function Kendall_res = Kendall_(random_arr)
    arr = random_arr';
    
    disp('start Kendall test');

    tic;
    Kendall_res = corr(arr, 'type', 'Kendall');
    toc;

    fprintf('end Kendall test\n\n');
    disp(size(Kendall_res));
    
    end