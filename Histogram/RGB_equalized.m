clear;
rgbImage = imread('peppers.png');
% Read in original RGB image.

% Extract color channels.
R = rgbImage(:,:,1); % Red channel
G = rgbImage(:,:,2); % Green channel
B = rgbImage(:,:,3); % Blue channel

%% R Equalization
[m, n] =size(R);  % size of image
hist_r= zeros(1, 256); % Histogram of Input image
proba_r= zeros(1, 256);
no_pixel= m*n; % no of pixels

% making PDF function
for i=1:m
    for j= 1:n
        p= R(i,j);
        if p~=0
           hist_r(p)=hist_r(p)+1;
           proba_r(p)=hist_r(p)/no_pixel;
        end
    end
end

% CDF function
sum = 0;
bin= 256;
cum_r= zeros(1, 256);
probb_r= zeros(1, 256);
hist_eq_r= zeros(1, 256); %Equalized Histogram

for i=1: 256
        sum= sum+hist_r(i);
        cum_r(i)=sum;
        probb_r(i)=cum_r(i)/no_pixel;
        hist_eq_r(i)= round(probb_r(i)*bin);
end

%% Output Image
out_img_r = zeros(m,n); %Output Equalized Image
for i=1:m
    for j= 1:n
        out_img_r(i, j)= hist_eq_r(R(i,j)+1);
        out_img_r= im2uint8(out_img_r);
    end
end

%% G Equalization
[m, n] =size(G);  % size of image
hist_g= zeros(1, 256); % Histogram of Input image
proba_g= zeros(1, 256);
no_pixel= m*n; % no of pixels

%making PDF function
for i=1:m
    for j= 1:n
        p= G(i,j);
        if p~=0
           hist_g(p)=hist_g(p)+1;
           proba_g(p)=hist_g(p)/no_pixel;
        end
    end
end

% CDF function
sum = 0;
bin= 256;
cum_g= zeros(1, 256);
probb_g= zeros(1, 256);
hist_eq_g= zeros(1, 256); %Equalized Histogram

for i=1: 256
        sum= sum+hist_g(i);
        cum_g(i)=sum;
        probb_g(i)=cum_g(i)/no_pixel;
        hist_eq_g(i)= round(probb_g(i)*bin);
end

% Output Image
out_img_g = zeros(m,n); %Output Equalized Image
for i=1:m
    for j= 1:n
        out_img_g(i, j)= hist_eq_g(G(i,j)+1);
        out_img_g= im2uint8(out_img_g);
    end
end

%% B Equalization
[m, n] =size(B);  % size of image
hist_b= zeros(1, 256); % Histogram of Input image
proba_b= zeros(1, 256);
no_pixel= m*n; % no of pixels

% making PDF function
for i=1:m
    for j= 1:n
        p= B(i,j);
        if p~=0
           hist_b(p)=hist_b(p)+1;
           proba_b(p)=hist_b(p)/no_pixel;
        end
    end
end

%% CDF function
sum = 0;
bin= 256;
cum_b= zeros(1, 256);
probb_b= zeros(1, 256);
hist_eq_b= zeros(1, 256); %Equalized Histogram

for i=1: 256
        sum= sum+hist_b(i);
        cum_b(i)=sum;
        probb_b(i)=cum_b(i)/no_pixel;
        hist_eq_b(i)= round(probb_b(i)*bin);
end

%% Output Image

out_img_b = zeros(m,n); %Output Equalized Image
for i=1:m
    for j= 1:n
        out_img_b(i, j)= hist_eq_b(B(i,j)+1);
        out_img_b= im2uint8(out_img_b);
    end
end

% Create an all black channel.
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');

% Create color versions of the individual color channels.
just_red = cat(3, out_img_r, allBlack, allBlack);
just_green = cat(3, allBlack, out_img_g, allBlack);
just_blue = cat(3, allBlack, allBlack, out_img_b);

% Recombine the individual color channels to create the original RGB image again.
recombinedRGBImage = cat(3, out_img_r,out_img_g,out_img_b);

figure,
subplot(211), imshow(rgbImage);
subplot(212), imshow(recombinedRGBImage);
