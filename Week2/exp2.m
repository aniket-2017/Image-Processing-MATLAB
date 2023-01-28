A= imread("img4.jpg");
B= imhist(A);
figure, imshow(A)
figure, plot(B)
C= histeq(B,4);

figure, imshow(C)