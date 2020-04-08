function print(x)
%load data
T_data = readtable('data.csv', 'HeaderLines',2); 
T_data = T_data(:,2:end);
T_data = table2array(T_data);
T_req = readtable('req.csv', 'HeaderLines',1); 
T_req = T_req(:,2:end);
T_req = table2array(T_req);
T_names = readtable('data.csv', 'HeaderLines',2); 
T_names = T_names(:,1);
T_names = table2array(T_names);

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

%protien
disp(["Pro:",-f(x)]);

%requirements
disp(["Cal:",nutrients(1), "Goal:", T_req(1,1)]);
disp(["Fat:",nutrients(2), "Goal:", T_req(2,1)]);
disp(["Sod:",nutrients(3), "Goal:", T_req(3,1)]);
disp(["Car:",nutrients(4), "Goal:", T_req(4,1)]);
disp(["Fib:",nutrients(5), "Goal:", T_req(5,1)]);
disp(["V A:",nutrients(6), "Goal:", T_req(6,1)]);
disp(["V B:",nutrients(7), "Goal:", T_req(7,1)]);
disp(["Cal:",nutrients(8), "Goal:", T_req(8,1)]);
disp(["Iro:",nutrients(9), "Goal:", T_req(9,1)]);

%results
% z = get_z(x);
% z_names= [];
% 
% for i = 1:n
%     if x(i) > .01
%         disp([T_names(i),x(i)]);
%         z_names = [z_names, T_names(i)];
%     end
% end
% 
% T = table(transpose(z_names),transpose(z));
% writetable(T,'T_res.csv');
% nuets = ["Calories","Fat","Sodium","Carbohydrates","Fiber","Vitamin A", "Vitamin B","Calcium","Iron"]; 
% T = table(transpose(nuets),transpose(nutrients),T_req);
% writetable(T,'T_req.csv');
end

