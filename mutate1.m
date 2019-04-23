%变异文件
function [newpop2] = mutate(pop)
global mutate_rate
[px,py] = size(pop);
newpop2 = pop;
for j = 1:py  %每一位都以概率mutate_rate产生变异
        ix = randi([1 90]);
        if(rand<mutate_rate)
            newpop2(ix,j) = ~newpop2(ix,j);
        end
end 
end
