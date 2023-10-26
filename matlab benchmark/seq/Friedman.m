function p = Friedman(random_arr)

    disp('start Friedman test');
    
    tic;
    [p, ~, ~] = friedman(random_arr', 1, 'off');
    toc;    

    fprintf('end Friedman test\n\n');

    end