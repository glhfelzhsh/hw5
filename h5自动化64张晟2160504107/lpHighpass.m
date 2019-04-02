function y = lpHighpass(imgname,f,c)
F = fftshift(fft2(f));
[W,H]=size(F);
for u=1:W
    for v=1:H
        D(u,v)=sqrt((u-fix(W/2))^2+(v-fix(H/2))^2);
        FF(u,v)=1+c*4*pi^2*D(u,v)^2;
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
title(['lpH c=' num2str(c) '�˲���'])
subplot(2,2,4)
imshow(255*G/max(max(G)));
title(['�˲���Ƶ�׹����ױ�:',num2str(y)])
saveas(gcf,[imgname 'lpH c=' num2str(c) '.jpg'])
end