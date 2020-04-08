function [c,ceq] = nonlcon(x)

%load data
T_data = readtable('data.csv', 'HeaderLines',2); 
T_data = T_data(:,2:end);
T_data = table2array(T_data);
T_req = readtable('req.csv', 'HeaderLines',1); 
T_req = T_req(:,2:end);
T_req = table2array(T_req);

%sum Nutritional values
nk = 9; % num nutreients 
nutrients = zeros(1,nk);
n = size(x);
n = n(2);
for k =1:nk
    for i = 1:n
        nutrients(k) = nutrients(k) + x(i)*T_data(i,k+1);
    end
end

%Enforce constarints 
tol = .05; %upward tolerance
c = zeros(1,2*nk + 1);
for k =1:nk
    i = round(2*k -1);
    
    %upper bound
    c(i) = nutrients(k) - T_req(k,1)*(1+tol);
    
    %lower bound
    c(i+1) = T_req(k,1)*(1-tol) - nutrients(k);
end

%remove some bounds
c(4) = 0; %lower fat
c(6) = 0; %lower sodium
c(8) = 0; %lower carbs
c(9) = 0; %upper fiber
c(11) = 0; %upper VA
c(13) = 0; %upper VC
c(15) = 0; %upper Cal
c(17) = 0; %upper fe


%std constraint
z = get_z(x);
c_std = .5 + 2*std(z) - mean(z); 
c(2*nk + 1) = c_std;

ceq =[];
end

