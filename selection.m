function newpop= selection(pop)
%选择文件 
global scale_of_pop;

global Fitval
alive_poss=Fitval/sum(Fitval);  
%轮盘构建
alive_circle(1)=0
for i = 1:scale_of_pop
    alive_circle(i+1)=sum(alive_poss(1:i));
end
newpop=[]
 for j = 1: scale_of_pop
      ran=rand
     for i = 1: scale_of_pop
        if(ran>=alive_circle(i))&(ran<alive_circle(i+1))
            newpop=[newpop,pop(:,i)]
            tmpFitval(j)=Fitval(i);
        else continue;
        end
    end
 end
Fitval=tmpFitval;
 
 
end
