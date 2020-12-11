% MATLAB controller for Webots
% File:          twister_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;


rotational_motor = wb_robot_get_device('twister');
wb_motor_set_position(rotational_motor, inf);
<<<<<<< Updated upstream
wb_position_sensor_enable;

  % Process here sensor data, im

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.
    wb_motor_set_velocity(rotational_motor, 0.5);
    if mod(wb_position_sensor_get_value, 3) == 0
      wb_motor_set_velocity(rotational_motor, -0.5);
    end 
    
=======
twister_pos = wb_motor_get_position_sensor(rotational_motor);
wb_position_sensor_enable(twister_pos, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1

  
    wb_motor_set_velocity(rotational_motor, 0.1);
    %value = wb_position_sensor_get_value(rotational_motor)
>>>>>>> Stashed changes
    
  drawnow;

end

% cleanup code goes here: write data to files, etc.
