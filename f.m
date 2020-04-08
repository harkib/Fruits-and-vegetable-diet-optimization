function [p] = f(x)

%load data
T_data = readtable('data.csv', 'HeaderLines',2); 
T_data = T_data(:,2:end);
T_data = table2array(T_data);

%sum protien
p = 0;
n = size(x);
n = n(2);
z = get_z(x);
nz = size(z);
nz = nz(2);
for i = 1:nz
    p = p + z(i)*T_data(i,1);
end

%invert
p = -p;
end

