tic;
clc;
clear all;
global gen_size
init_data;
pop=round(rand(chro_size,scale_of_pop)-0.3);

%%-0.3�������������ʵ����������Ⱥ��ѡȡ����������  

for i = 1:gen_size
Fitval=fitness(pop);
pop=selection(pop);
pop=cross(pop);  
pop=mutate(pop);
end
disp('best_chro=');
disp(best_chro');


disp('best_cost=');
disp(best_cost);
x=[1:1:gen_size+1]
plot(x,best_cost_group)
hold on;
toc;



