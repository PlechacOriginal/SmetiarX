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
A = [];


rotational_motor = wb_robot_get_device('twister');
  wb_motor_set_position(rotational_motor, inf);
twister_pos = wb_motor_get_position_sensor(rotational_motor);
  wb_position_sensor_enable(twister_pos, TIME_STEP);
 
 %zapnutie receivera 
  receiver = wb_robot_get_device('receiver');
  wb_receiver_enable(receiver, TIME_STEP);


while wb_robot_step(TIME_STEP) ~= -1

 
  %reciever
while wb_receiver_get_queue_length(receiver) > 0
        pointer = wb_receiver_get_data(receiver);
        setdatatype(pointer, 'doublePtr', 1, 1);
        A = get(pointer, 'Value')
        wb_receiver_next_packet(receiver);
    end
  
 
  
  angle = wb_position_sensor_get_value(twister_pos)

    if A == 0
      wb_motor_set_velocity(rotational_motor, 0);
    end
    if A == 1
      if angle < 0.732
        wb_motor_set_velocity(rotational_motor, 2);
      
      
      elseif angle > 0.85
        wb_motor_set_velocity(rotational_motor, -2);
      
      
      elseif (angle > 0.732) && (angle < 0.85)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    
   elseif A == 2
      if angle < 2.3
        wb_motor_set_velocity(rotational_motor, 2);
      
      
      elseif angle > 2.4
        wb_motor_set_velocity(rotational_motor, -2);
      
      
      elseif (angle > 2.3) && (angle < 2.4)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    
    
   elseif A == 3
      if angle < 0
        wb_motor_set_velocity(rotational_motor, 2);
      
      
      elseif angle > 0.1
        wb_motor_set_velocity(rotational_motor, -2);
      
      
      elseif (angle > 0) && (angle < 0.1)
        wb_motor_set_velocity(rotational_motor, 0);
      end
    end
      
     

    




    
  drawnow;
  
end

% cleanup code goes here: write data to files, etc.
