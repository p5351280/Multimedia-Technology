% Read File
X = imread ('Koala.bmp');

I = rgb2gray(X);
J = dct2(I);
imshow(log(abs(J)),[]), colormap(jet(64)), colorbar

J(abs(J) < 10) = 0;
K = idct2(J);
figure, imshow(I)
figure, imshow(K,[0 255])



