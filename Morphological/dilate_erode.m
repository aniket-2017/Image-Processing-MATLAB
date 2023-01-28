clear;
img_i=imread('text.png'); % reading logical image
img_p= padarray(img_i,[1 1],0,'both'); % padding image with ones 
subplot(321),imshow(img_p),title('Input Image'); 
[m, n]=size(img_p);
w=ones(3); % Structure element

%% Erosion operation
for i=2:1:m-1
    for j=2:1:n-1
        if img_p(i-1:i+1,j-1:j+1) == w
            img_e(i,j) = img_p(i,j);
        else
            img_e(i,j)=0;
        end
    end
end
subplot(322),imshow(img_e),title('Eroded Image'); 

%% Dilation operation

for i=2:1:m-1
    for j=2:1:n-1
        if img_p(i-1:i+1,j-1:j+1) ~= w
            img_d(i,j) = img_p(i,j) ;
        else
            img_d(i,j)= 1;
        end
    end
end
subplot(323),imshow(img_d),title('Dilated Image'); 

%% Dilation followed by erosion 

img_ep=padarray(img_e,[1,1],0,'both');
for i=2:1:m-1
    for j=2:1:n-1
        if img_ep(i-1:i+1,j-1:j+1) ~= w
            img_ed(i,j) = img_e(i,j) ;
        else
            img_ed(i,j)= 1;
        end
    end
end
subplot(324),imshow(img_ed),title('opening operator Image'); 

%% Erosion followed by dilation 

img_dp=padarray(img_d,[1,1],0,'both');
for i=2:1:m-1
    for j=2:1:n-1
        if img_dp(i-1:i+1,j-1:j+1) == w
            img_de(i,j) = img_d(i,j);
        else
            img_de(i,j)=0;
        end
    end
end

subplot(325),imshow(img_de),title('Closing operator Image'); 

%% Edge Detection = dilation - erosion

for i=2:1:m-1
    for j=2:1:n-1
        img_edge(i,j)=img_d(i,j)-img_e(i,j);
    end
end
 
subplot(326),imshow(img_edge),title('Edge Detected Image'); 