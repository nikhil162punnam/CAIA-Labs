T = zeros(512,512);
load landsat_data

new_data = uint8(landsat_data);

T(20:30,60:90) = 1;
T(140:150,100:160) = 2;
T(70:80,180:200) = 3;
T(170:180,220:240) = 4;
T(250:260,250:270) = 5;
T(350:360,370:390) = 6;
T(450:460,470:500) = 7;

band1 = new_data(:,:,1);
band2 = new_data(:,:,2);
band3 = new_data(:,:,3);
band4 = new_data(:,:,4);
band5 = new_data(:,:,5);
band6 = new_data(:,:,6);
band7 = new_data(:,:,7);

figure(1);
subplot(2,4,1); imshow(new_data(:,:,1));
subplot(2,4,2); imshow(new_data(:,:,2));
subplot(2,4,3); imshow(new_data(:,:,3));
subplot(2,4,4); imshow(new_data(:,:,4));
subplot(2,4,5); imshow(new_data(:,:,5));
%subplot(2,4,6); imshow(new_data(:,:,6));
subplot(2,4,7); imshow(new_data(:,:,7));

[data,class] = create_training_data(new_data,T);
Itest = im2testdata(new_data); % Reshape the image before classification
C = classify(double(Itest),double(data),double(class),'diagquadratic'); % Train classifier and classify the data
ImC = class2im(C,size(new_data,1),size(new_data,2)); % Reshape the classification to an image
figure(2);imagesc(ImC);

figure(3);
subplot(2,2,1); imshow(landsat_data(:,:,[4,1,2])./255);
title('4,1,2');

subplot(2,2,2); imshow(landsat_data(:,:,[4,1,3])./255);
title('4,1,3');

subplot(2,2,3); imshow(landsat_data(:,:,[4,1,5])./255);
title('4,1,5');

subplot(2,2,4); imshow(landsat_data(:,:,[6,2,7])./255);
title('6,2,7');
