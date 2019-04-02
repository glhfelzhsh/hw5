function y = btLowpass(imgname,f,n,d0)
F = fftshift(fft2(f));
[W,H]=size(F);
D0=d0;
for u=1:W
    for v=1:H
        D(u,v)=sqrt((u-fix(W/2))^2+(v-fix(H/2))^2);
        FF(u,v)=1/(1+(D(u,v)/D0)^(2*n));
        G(u,v)=FF(u,v)*F(u,v);
    end
end
g=ifftshift(G);
g=ifft2(g);
y=sum(sum(abs(G).^2))/sum(sum(abs(F).^2));
subplot(2,2,1)
imshow(f)
title('ԭʼͼ��')
subplot(2,2,2)
imshow(255*F/(max(max(F))))
title('ԭʼͼ��Ƶ��')
subplot(2,2,3)
imshow(g)
title(['btL N=' num2str(n) ' D=' num2str(d0) '�˲���'])
subplot(2,2,4)
imshow(255*G/max(max(G)));
title(['�˲���Ƶ�׹����ױ�:',num2str(y)])
saveas(gcf,[imgname 'btL N=' num2str(n) ' D=' num2str(d0) '.jpg'])
end

