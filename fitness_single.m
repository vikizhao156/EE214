function fitval_single = fitness_single (pop_single)
global max_gen
global Q
global T
global V
global chro_size

if or(sum(pop_single)<3,sum(pop_single)>45)       %����ѡ�еĲ��Ե�С�� 3 ����ֱ���ų�        
         Tv = repmat(T,1,max_gen) + 3;            %������ʽΪ����������
     else 
         T0 = T(find(pop_single));                      %ִ�з�������¶�����                               
         V0 = V(find(pop_single),:);                    %ִ�з�����ĵ�ѹ���   
          for k = 1:max_gen             
          Tv(:,k) = spline(V0(:,k),T0,V(:,k));                    
          end 
     end
    
     %�ɱ�����
     delta=abs(Tv-T);
     s = sum((delta(:,1:max_gen) <= 0.5) * 0 + and(delta(:,1:max_gen) > 0.5, delta(:,1:max_gen) <= 1) * 1 + and(delta(:,1:max_gen) > 1, delta(:,1:max_gen) <= 1.5) * 4 + and(delta(:,1:max_gen) > 1.5, delta(:,1:max_gen) <= 2) * 10 + (delta(:,1:max_gen) > 2) * 10000) 
     c = s + Q * sum(pop_single);    %����ÿ���������ܳɱ�     
     cost = sum(c) / max_gen;          %���㷽���ɱ�      
             
    fitval_single = (Q * chro_size / cost).^2;
end
  

