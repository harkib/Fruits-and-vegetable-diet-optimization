function [z] = get_z(x)
n = size(x);
n = n(2);
z = [];
for i = 1:n
    if x(i) > .01
        z = [z,x(i)];
    end
end
end

