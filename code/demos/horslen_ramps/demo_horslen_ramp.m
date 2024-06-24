function demo_horslen_ramp


% Variables
protocol_file_string = 'horslen_ramp_protocol.txt';
model_parameters_json_file_string = 'horslen_ramp_parameters.json';
options_file_string = 'horslen_ramp_options.json';
model_output_file_string = '../../temp/horslen_ramp_output.myo';

% Make sure the path allows us to find the right files
addpath(genpath('../../../code'));

% Run a simulation
sim_output = simulation_driver( ...
    'simulation_protocol_file_string', protocol_file_string, ...
    'model_json_file_string', model_parameters_json_file_string, ...
    'options_json_file_string', options_file_string, ...
    'output_file_string', model_output_file_string);

% Load it back up and display to show how that can be done
sim = load(model_output_file_string,'-mat')
sim_output = sim.sim_output

figure(2);
clf;
subplot(2,1,1);
plot(sim_output.time_s,sim_output.muscle_force,'b-'); hold on
% plot(sim_output.time_s,sim_output.c_force,'b--');
% plot(sim_output.time_s,sim_output.muscle_force-sim_output.c_force,'b:');
ylabel('Force (N m^{-2})');
subplot(2,1,2);
plot(sim_output.time_s,sim_output.hs_length,'b-');
ylabel('Half-sarcomere length (nm)');
xlabel('Time (s)');