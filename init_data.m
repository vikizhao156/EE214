%init  ��ʼ���ļ�
init_box=dlmread('dataform20160902.csv')
%T �¶��ļ� 
%V ��ѹ�ļ�
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
global Fitval  %%��¼ÿ����Ӧ��
T=init_box(1,:)';
V=init_box(2:2:end,:)';
Fitval=[];
max_gen=500;      
chro_size=90;     %Ⱦɫ�峤��
gen_size=100;     %��������
cross_rate1=0.9    %�������
cross_rate2=0.6    
%cross_rate=0.9
mutate_rate1=0.1  %�������
mutate_rate2=0.001
%mutate_rate=0.05
scale_of_pop=50;  %��Ⱥ��С
Q=50              %����ⶨ�ɱ�
best_chro=[];     %ȫ�������Ⱦɫ��
best_cost=5000;   %ȫ�������cost
best_cost_group=[best_cost]; %aga����cost�ļ���
%best_cost_group1=[best_cost]; %aga����cost�ļ���