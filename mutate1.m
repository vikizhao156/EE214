%�����ļ�
function [newpop2] = mutate(pop)
global mutate_rate
[px,py] = size(pop);
newpop2 = pop;
for j = 1:py  %ÿһλ���Ը���mutate_rate��������
        ix = randi([1 90]);
        if(rand<mutate_rate)
            newpop2(ix,j) = ~newpop2(ix,j);
        end
end 
end
