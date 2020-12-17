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


rotational_motor = wb_robot_get_device('twister');
  wb_motor_set_position(rotational_motor, inf);
twister_pos = wb_motor_get_position_sensor(rotational_motor);
  wb_position_sensor_enable(twister_pos, TIME_STEP);


while wb_robot_step(TIME_STEP) ~= -1
m = getGlobalx
  value = wb_position_sensor_get_value(twister_pos) 

    
    if m == 1
      if value < 0.732
        wb_motor_set_velocity(rotational_motor, 1);
      
      
      elseif value > 0.85
        wb_motor_set_velocity(rotational_motor, -1);
      
      
      elseif (value > 0.732) && (value < 0.85)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    
   elseif m == 2
      if value < 1.932
        wb_motor_set_velocity(rotational_motor, 1);
      
      
      elseif value > 2
        wb_motor_set_velocity(rotational_motor, -1);
      
      
      elseif (value > 1.932) && (value < 2)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    
    
   elseif m == 3
      if value < 0
        wb_motor_set_velocity(rotational_motor, 1);
      
      
      elseif value > 0.1
        wb_motor_set_velocity(rotational_motor, -1);
      
      
      elseif (value > 0) && (value < 0.1)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    end
      
     

    




    
  drawnow;
  
end

% cleanup code goes here: write data to files, etc.
