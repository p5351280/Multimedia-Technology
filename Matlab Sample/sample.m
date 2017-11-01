% �H�U���}�Ҥ@�� RGB �� Bitmap �ϡA�Q�Ψ� RGB Chenal �� Pixel Value �ର YIQ Chenal ���d��
% �Q�� Matlab �Ӽg�v�����{���ܮe���A�����U�C���B�J
% 1.�}�Ҥ@�ӱm��v���ɡ].bmp�^�]24 bit�^
% 2.Ū��v���� Pixel value
% 3.�v���B�z  
% 4.�s��G�����


clear

% Set Transfer Matrix
RGB2YIQ = [ 0.299 0.587 0.114 ; 0.596 -0.274 -0.322 ; 0.212 -0.523 0.311];

% Read File
X = imread ('Koala.bmp');
[H W B] = size(X);

if (B~=3)
   fprintf('Not RGB FIle!');
   return;
end

% Image Preocessing (RGB -> YIQ)
% �H�o�̪��Ҥl�O�n�� RGB -> YIQ �̫�� Y �]Gray Level�^����ܥX��
fprintf('wait ......\n');
for i = 1:H
   for j = 1:W
      OldPixel(1:B) = X(i,j,1:B);
      NewPixel = RGB2YIQ*double(OldPixel');
      Y(i,j,1:B) = uint8(round(NewPixel'));
   end
end
% ���L�b Matlab �� for �j�骺�B�z�t�׶W�źC

% Eliminate I&Q Chanel �u�� Gray Level
Z(:,:,1) = Y(:,:,1);
Z(:,:,2) = Y(:,:,1);
Z(:,:,3) = Y(:,:,1);

% �s��
imwrite(Z,'lena_gray.bmp');

% ��ܵ��G
subplot(1,2,1);
image(X);
title ('Original Image');
subplot(1,2,2);
image(Z);
title ('Generated Image')
