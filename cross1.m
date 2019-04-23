%交叉文件
function [newpop1] = cross1(pop)
global cross_rate
global chro_size
global best_cost_group1
global best_cost
best_cost_group1=[best_cost_group1 best_cost]
[px,py]=size(pop);

newpop1=ones(size(pop));
for i=1:2:py-1
    if rand<cross_rate
        cross_point=randperm(chro_size,1);  %随机产生一个交叉位
        newpop1(:,i)=[pop(1:cross_point,i);pop(cross_point+1:px,i+1)];  %交换相邻两个个体交叉位之后的基因
        newpop1(:,i+1)=[pop(1:cross_point,i+1);pop(cross_point+1:px,i)];
    else
        newpop1(:,i)=pop(:,i);
        newpop1(:,i+1)=pop(:,i+1);
    end
end
end
