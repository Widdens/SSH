clear all
w=1;
v=(0:0.01:3);
N=8;
HA=zeros(2*N);
HB=zeros(2*N);


for v1=1:length(v)
    for i=1:N
        HA(2*i-1,2*i)=v(v1);
    end
    for i=1:N-1
        HB(2*i,2*i+1)=w;
    end
    H_SSH=HA+HA'+HB+HB';
    [V,E] = eig(H_SSH);
    [K,ind] = sort(diag(E));%ind 是重排标记序号，K对应重排后标记的值
    Ee(:,v1)=K;  
    for i=1:2*N
    F(:,i) = V(:,ind(i));%这样F是重排后的特征向量矩阵
    end
     H_PSAI(:,:,v1)=F; %H_PSAI是列阵，维度2N*2N*length(v)
     
end
plot(v,Ee)
figure()
subplot(3,1,1),bar(H_PSAI(:,N,20))
subplot(3,1,2),bar(H_PSAI(:,N+1,20))
subplot(3,1,3),bar(H_PSAI(:,4,20))




 
