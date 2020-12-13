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
twister_pos = wb_motor_get_position_sensor(twister);
  wb_position_sensor_enable(twister_pos, TIME_STEP);


while wb_robot_step(TIME_STEP) ~= -1

 
wb_motor_set_velocity(rotational_motor, 0.5);
value = wb_position_sensor_get_value(twister_pos);    


    
  drawnow;

end

% cleanup code goes here: write data to files, etc.
