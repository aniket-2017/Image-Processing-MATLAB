%% Median Filtering 

clear;
E=imread("img10.jpg");
E=im2gray(E);
[m, n]= size(E);

%% Salt and Pepper Noise
C=rand(m,n);
F=E;
t=0.960; % setting threshold for noise
for i=1:m
    for j=1:n
        if(C(i,j)>=t)
            F(i,j)=255;
        else 
            if (C(i,j)<=1-t)
            F(i,j)=0;
            end
        end
    end
end

%% Zero Padding
Zr=zeros(1,n);
Zc=zeros(m+2,1);
G1=[Zr; F; Zr];
G1=[Zc G1 Zc];

%% Output
H=zeros(m,n);
H=im2uint8(H);
for i=2:m
    for j=2:n
        H(i,j)= median_2(i,j,G1);
    end
end

%% Plotting
subplot(2,2,1), imshow(E), title('Given Image');
subplot(2,2,2), imshow(F), title('Noisy Image');
subplot(2,2,3), imshow(G1), title('Zero padding');
subplot(2,2,4), imshow(H), title('Filtered Image');

%% Median Function Defination
function media = median_1(i,j,G1)    
        median_arr= zeros(1,9); % creating 3x3 window for filter
        median_arr(5)=G1(i,j); %center pixel
        median_arr(1)=G1(i-1,j-1);
        median_arr(2)=G1(i-1,j);
        median_arr(3)=G1(i-1,j+1);
        median_arr(4)=G1(i,j-1);
        median_arr(6)=G1(i,j+1);
        median_arr(7)=G1(i+1,j-1);
        median_arr(8)=G1(i+1,j);
        median_arr(9)=G1(i+1,j+1);
        median_arr=sort(median_arr); % sorting Median array
        media=median_arr(5); % returning median value
end

function media= median_2(i,j,G1)
        mdn=zeros(1,9);
        p=1;
            for k=i-1:i+1
                for m=j-1:j+1
                    mdn(p)=G1(k,m);
                    p=p+1;
                end
            end
            mdn=sort(mdn);
            media=mdn(5);
end
