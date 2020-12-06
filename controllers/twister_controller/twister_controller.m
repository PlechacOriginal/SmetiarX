% MATLAB controller for Webots
% File:          twister_controller.m
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
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');
<<<<<<< Updated upstream


=======
rotational_motor = wb_robot_get_device('twister');
wb_motor_set_position(rotational_motor, inf);
%wb_position_sensor_sampling_period = 100;
%wb_position_sensor_enable(twister_sensor);
>>>>>>> Stashed changes

%wb_position_sensor_enable(PositionSensor);
  % Process here sensor data, im


% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%

  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.
<<<<<<< Updated upstream
   
=======
    wb_motor_set_velocity(rotational_motor, 0.1);
    %value = wb_position_sensor_get_value(PositionSensor)
   % if mod(value, 3) == 0
      %wb_motor_set_velocity(rotational_motor, -0.1);
    %end 
    %value = wb_position_sensor_get_value(twister_sensor)
>>>>>>> Stashed changes
    
   
  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
