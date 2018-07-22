function demo()

im = imread('~/Desktop/photo2.jpg');

w = ones(3)/9;

y = conv_op(im, w, 1, 1);

figure,

imshow(uint8(y))