%交叉文件
function [newpop1] = cross(pop)
global cross_rate1
global cross_rate2
global chro_size
global best_fitval
global mean_fitval
global best_cost_group
global best_cost
global Fitval
best_cost_group=[best_cost_group best_cost]
[px,py]=size(pop);
newpop1=ones(size(pop));
mean_fitval=mean(Fitval);

for i=1:2:py-1
       bigger_fitness=max(fitness_single(pop(:,i)),fitness_single(pop(:,i+1)));
        if(bigger_fitness>=mean_fitval)
           cross_rate=cross_rate1-(cross_rate1-cross_rate2)*(bigger_fitness-mean_fitval)/(best_fitval*mean_fitval)
        else
            cross_rate=cross_rate1;
        end
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
