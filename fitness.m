function fitval = fitness (pop)
global max_gen
global Q
global T
global V
global chro_size
global best_chro
global best_cost
global best_fitval

[px,py]=size(pop)
 best_fitval=0;
for i = 1 : py
    %%遍历个体 记录选择方案
    scheme=pop(:,i);
     if or(sum(scheme)<3,sum(scheme)>45)       %方案选中的测试点小于 3 个，直接排除        
         Tv = repmat(T,1,max_gen) + 3;            %舍弃方式为保障最大误差
     else 
         T0 = T(find(scheme));                      %执行方案后的温度输入                               
         V0 = V(find(scheme),:);                    %执行方案后的电压输出   
          for k = 1:max_gen             
          Tv(:,k) = spline(V0(:,k),T0,V(:,k));                    
          end 
     end
    
     %成本计算
     delta=abs(Tv-T);
     s = sum((delta(:,1:max_gen) <= 0.5) * 0 + and(delta(:,1:max_gen) > 0.5, delta(:,1:max_gen) <= 1) * 1 + and(delta(:,1:max_gen) > 1, delta(:,1:max_gen) <= 1.5) * 4 + and(delta(:,1:max_gen) > 1.5, delta(:,1:max_gen) <= 2) * 10 + (delta(:,1:max_gen) > 2) * 10000) 
     c = s + Q * sum(scheme);    %计算每个样本的总成本     
     cost = sum(c) / max_gen;          %计算方案成本      
             
    fitval(i) = (Q * chro_size / cost).^2;
    if(best_fitval<fitval(i)) 
       best_fitval=fitval(i);
    end
    if cost<best_cost           %记录全方案最佳
        best_chro=scheme;
        best_cost=cost;
    end
end
end
  

