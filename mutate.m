%变异文件
function [newpop2] = mutate(pop)
global mutate_rate1
global mutate_rate2
global mean_fitval
global best_fitval
[px,py] = size(pop);
newpop2 = pop;
for j = 1:py  %每一位都以概率mutate_rate产生变异
        ix = randi([1 90]);
        fitval=fitness_single(newpop2(:,j))
       if(fitval>mean_fitval)
           mutate_rate=mutate_rate1-(mutate_rate1-mutate_rate2)*(fitval-best_fitval)/(best_fitval-mean_fitval)
       else 
           mutate_rate=mutate_rate1
       end
         if(rand<mutate_rate)
            newpop2(ix,j) = ~newpop2(ix,j);
         end
end 
end
