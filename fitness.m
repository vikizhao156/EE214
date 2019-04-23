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
    %%�������� ��¼ѡ�񷽰�
    scheme=pop(:,i);
     if or(sum(scheme)<3,sum(scheme)>45)       %����ѡ�еĲ��Ե�С�� 3 ����ֱ���ų�        
         Tv = repmat(T,1,max_gen) + 3;            %������ʽΪ����������
     else 
         T0 = T(find(scheme));                      %ִ�з�������¶�����                               
         V0 = V(find(scheme),:);                    %ִ�з�����ĵ�ѹ���   
          for k = 1:max_gen             
          Tv(:,k) = spline(V0(:,k),T0,V(:,k));                    
          end 
     end
    
     %�ɱ�����
     delta=abs(Tv-T);
     s = sum((delta(:,1:max_gen) <= 0.5) * 0 + and(delta(:,1:max_gen) > 0.5, delta(:,1:max_gen) <= 1) * 1 + and(delta(:,1:max_gen) > 1, delta(:,1:max_gen) <= 1.5) * 4 + and(delta(:,1:max_gen) > 1.5, delta(:,1:max_gen) <= 2) * 10 + (delta(:,1:max_gen) > 2) * 10000) 
     c = s + Q * sum(scheme);    %����ÿ���������ܳɱ�     
     cost = sum(c) / max_gen;          %���㷽���ɱ�      
             
    fitval(i) = (Q * chro_size / cost).^2;
    if(best_fitval<fitval(i)) 
       best_fitval=fitval(i);
    end
    if cost<best_cost           %��¼ȫ�������
        best_chro=scheme;
        best_cost=cost;
    end
end
end
  

