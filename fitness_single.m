function fitval_single = fitness_single (pop_single)
global max_gen
global Q
global T
global V
global chro_size

if or(sum(pop_single)<3,sum(pop_single)>45)       %方案选中的测试点小于 3 个，直接排除        
         Tv = repmat(T,1,max_gen) + 3;            %舍弃方式为保障最大误差
     else 
         T0 = T(find(pop_single));                      %执行方案后的温度输入                               
         V0 = V(find(pop_single),:);                    %执行方案后的电压输出   
          for k = 1:max_gen             
          Tv(:,k) = spline(V0(:,k),T0,V(:,k));                    
          end 
     end
    
     %成本计算
     delta=abs(Tv-T);
     s = sum((delta(:,1:max_gen) <= 0.5) * 0 + and(delta(:,1:max_gen) > 0.5, delta(:,1:max_gen) <= 1) * 1 + and(delta(:,1:max_gen) > 1, delta(:,1:max_gen) <= 1.5) * 4 + and(delta(:,1:max_gen) > 1.5, delta(:,1:max_gen) <= 2) * 10 + (delta(:,1:max_gen) > 2) * 10000) 
     c = s + Q * sum(pop_single);    %计算每个样本的总成本     
     cost = sum(c) / max_gen;          %计算方案成本      
             
    fitval_single = (Q * chro_size / cost).^2;
end
  

