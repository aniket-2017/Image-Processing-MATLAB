%% Histogram Equalization
clear;
img_2= imread("img8.jpeg"); % Read input Image
%img_2= rgb2gray(img_2);
[m, n] =size(img_2);  % size of image
hist_1= zeros(1, 256); % Histogram of Input image
hist_2= zeros(1, 256); % Histogram of Input image

proba= zeros(1, 256);
no_pixel= m*n; % no of pixels

%% PDF function

for i = 1:m
    for j= 1:n
        p= img_2(i,j);
        if p~=0
            hist_1(p)= hist_1(p) + 1;
        end
    end
end

%% CDF

cdf=zeros(1,256);
probb=zeros(1,256);
sum=0;
histeq=zeros(1,256);
for i = 1:256
    sum = sum + hist_1(p);
    cdf(i)= sum;
    probb(i)= cdf(i)/no_pixel;
    histeq(i)=round(probb(i)*256);
end

%% Out
out_img=zeros(m,n);
for i = 1:m
    for j= 1:n
        
        out_img(i,j)= histeq(img_2(i,j)+1);
        out_img=im2uint8(out_img);
    end
end

for i = 1:m
    for j= 1:n
        p= out_img(i,j);
        if p~=0
            hist_2(p)= hist_2(p) + 1;
        end
    end
end

stem(hist_2)