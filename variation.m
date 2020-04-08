function [v] = variation(x)
    n = size(x);
    n = n(2);
    
    z = zeros(1,nnz(x));
    zi = 1;
    
    for i = 1:n
        if x(i) ~= 0
            z(zi) = x(i);
            zi= zi + 1;
        end
    end
    
    z
    %csvwrite('z.csv',z);
    v = std(x);   
    
end

