%% Histogram Equalization
clear;
img_2= imread("img8.jpeg"); % Read input Image
%img_2= rgb2gray(img_2);
[m, n] =size(img_2);  % size of image
hist_1= zeros(1, 256); % Histogram of Input image
proba= zeros(1, 256);
no_pixel= m*n; % no of pixels

%% making PDF function
for i=1:m
    for j= 1:n
        p= img_2(i,j);
        if p~=0
           hist_1(p)=hist_1(p)+1;
           proba(p)=hist_1(p)/no_pixel;
        end
    end
end

%% CDF function
sum = 0;
bin= 256;
cum= zeros(1, 256);
probb= zeros(1, 256);
hist_eq= zeros(1, 256); %Equalized Histogram

for i=1: 256
        sum= sum+hist_1(i);
        cum(i)=sum;
        probb(i)=cum(i)/no_pixel;
        hist_eq(i)= round(probb(i)*bin);
end

%% Output Image

out_img = zeros(m,n); %Output Equalized Image
for i=1:m
    for j= 1:n
        out_img(i, j)= hist_eq(img_2(i,j)+1);
        out_img= im2uint8(out_img);
    end
end

%% Plotting

subplot(2,2,1), imshow(img_2), title ("Input Image")
subplot(2,2,2), imshow(out_img), title ("Output Image")
subplot(2,2,3), stem(hist_1), title("Input Image Histogram")
xlabel('Intensity level'), ylabel('Number of Pixels')
subplot(2,2,4), imhist(out_img), title("Output Equalized Histogram")
xlabel('Intensity level'), ylabel('Number of Pixels')



