%% Histogram Generation
clear;
img_1= imread("img8.jpeg"); %Read image
[m, n] =size(img_1); %Size of Image
hist_1= zeros(1, 256);
for i=1:m
   for j= 1:n
       p= img_1(i,j);
       if p~=0
       hist_1(p)=hist_1(p)+1;
       end
   end
end

%% Plotting
figure(1), imshow(img_1), title ("Input Image")
figure(2), subplot(1,2,1), stem(hist_1), title ("Histogram Generated"), 
xlabel('Intensity level'), ylabel('Number of Pixels')
subplot(1,2,2), imhist(img_1), title("Predefined hist Function"), 
xlabel('Intensity level'), ylabel('Number of Pixels')
