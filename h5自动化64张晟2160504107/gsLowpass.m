function y = gsLowpass(imgname,f,d0)
F = fftshift(fft2(f));
[W,H]=size(F);
D0=d0;
for u=1:W
    for v=1:H
        D(u,v)=sqrt((u-fix(W/2))^2+(v-fix(H/2))^2);
        FF(u,v)=exp(-D(u,v)^2/(2*D0^2));
        G(u,v)=FF(u,v)*F(u,v);
    end
end
g=ifftshift(G);
g=ifft2(g);
y=sum(sum(abs(G).^2))/sum(sum(abs(F).^2));
subplot(2,2,1)
imshow(f)
title('原始图像')
subplot(2,2,2)
imshow(255*F/(max(max(F))))
title('原始图像频谱')
subplot(2,2,3)
imshow(g)
title(['gsL D=' num2str(d0) '滤波后'])
subplot(2,2,4)
imshow(255*G/max(max(G)));
title(['滤波后频谱功率谱比:',num2str(y)])
saveas(gcf,[imgname 'gsL D=' num2str(d0) '.jpg'])
end

