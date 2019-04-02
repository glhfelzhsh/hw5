img1=im2double(imread('test3_corrupt.pgm'));
img2=im2double(imread('test4 copy.bmp'));
y=lpHighpass('t3test3',img1,0.00001);
y=unmask('t3test3',img1,25,1,1);
y=lpHighpass('t3test4',img2,0.00001);
y=unmask('t3test4',img2,25,1,1);

