%init  初始化文件
init_box=dlmread('dataform20160902.csv')
%T 温度文件 
%V 电压文件
global T
global V
global gen_size
global cross_rate1
global cross_rate2
global mutate_rate1
global mutate_rate2
%global mutate_rate
%global cross_rate
global scale_of_pop
global Q
global chro_size
global max_gen
global best_chro
global best_cost
global best_cost_group
global best_cost_group1
global Fitval  %%记录每代适应度
T=init_box(1,:)';
V=init_box(2:2:end,:)';
Fitval=[];
max_gen=500;      
chro_size=90;     %染色体长度
gen_size=100;     %迭代次数
cross_rate1=0.9    %交叉概率
cross_rate2=0.6    
%cross_rate=0.9
mutate_rate1=0.1  %变异概率
mutate_rate2=0.001
%mutate_rate=0.05
scale_of_pop=50;  %种群大小
Q=50              %单点测定成本
best_chro=[];     %全世代最佳染色体
best_cost=5000;   %全世代最佳cost
best_cost_group=[best_cost]; %aga历代cost的集合
%best_cost_group1=[best_cost]; %aga历代cost的集合