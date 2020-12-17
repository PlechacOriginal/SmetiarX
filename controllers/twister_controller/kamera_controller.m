% MATLAB controller for Webots
% File:          kamera_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
desktop;
%keyboard;

TIME_STEP = 64;


% get and enable devices, e.g.:
camera = wb_robot_get_device('camera');
wb_camera_enable(camera, 5);


  

figure('Name','Feed z triediacej kamery','NumberTitle','off');
% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

%ziskanie obrazu z kamery
RGB = wb_camera_get_image(camera);


%prahovanie plastovej flase
I = rgb2hsv(RGB);

channel1Min = 0.525;
channel1Max = 0.584;

channel2Min = 0.042;
channel2Max = 0.746;

channel3Min = 0.569;
channel3Max = 0.968;

sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW_plast = sliderBW;

maskedRGBImage = RGB;

maskedRGBImage(repmat(~BW_plast,[1 1 3])) = 0;

%výpočet veľkosti pre plast
biele_plast = length(find(BW_plast));
cierne_plast = length(find(~BW_plast));


%prahovanie plechovky
I = rgb2hsv(RGB);

channel1Min = 0.613;
channel1Max = 0.010;

channel2Min = 0.087;
channel2Max = 0.794;

channel3Min = 0.202;
channel3Max = 0.422;

sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW_plech = sliderBW;

maskedRGBImage = RGB;

maskedRGBImage(repmat(~BW_plech,[1 1 3])) = 0;

%výpočet veľkosti pre plech
biele_plech = length(find(BW_plech));
cierne_plech = length(find(~BW_plech));


%prahovanie sklo
I = rgb2hsv(RGB);

channel1Min = 0.207;
channel1Max = 0.401;

channel2Min = 0.108;
channel2Max = 1.000;

channel3Min = 0.021;
channel3Max = 0.400;

sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW_sklo = sliderBW;

maskedRGBImage = RGB;

maskedRGBImage(repmat(~BW_sklo,[1 1 3])) = 0;

%výpočet veľkosti pre sklo
biele_sklo = length(find(BW_sklo));
cierne_sklo = length(find(~BW_sklo));


%rozhodnutie o materiali
    if biele_plast > biele_sklo && biele_plast > biele_plech
        x = 1
        disp("material: plast");
              
    elseif biele_plech > biele_sklo && biele_plech > biele_plast
        x = 2
        disp("material: plech");
        
    elseif biele_sklo > biele_plast && biele_sklo > biele_plech
        x = 3
        disp("material: sklo");
        
    else
        x = 0
        disp("unable to recognize given material");
        
    end
  
  

%zobrazenie feedu kamery v okne
%rgb
subplot(3,3,1);
imshow(RGB);
title("RGB Zdroj");

%masky
subplot(3,3,4);
imshow(BW_plast);
title("Plast"); 

subplot(3,3,5);
imshow(BW_plech);
title("Plech");

subplot(3,3,6);
imshow(BW_sklo);
title("Sklo");
%koniec kodu na zobrazenie feedu


  % read the sensors, e.g.:
  

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
