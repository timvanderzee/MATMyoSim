function demo_horslen_ramp

% Make sure the path allows us to find the right files
addpath(genpath('../../../code'));

% Variables
batch_file_string = 'horslen_ramp_batch.json';

% Load the batch data
batch_json = loadjson(batch_file_string);
batch_data = batch_json.MyoSim_batch;

% Run the batch
% run_batch(batch_data);

%% If you want to just run 1
% Variables
protocol_file_string = batch_data.job{1}.protocol_file_string;
model_parameters_json_file_string = batch_data.job{1}.model_file_string;
options_file_string = batch_data.job{1}.options_file_string;
model_output_file_string = batch_data.job{1}.results_file_string;

% Run a simulation
sim_output = simulation_driver( ...
    'simulation_protocol_file_string', protocol_file_string, ...
    'model_json_file_string', model_parameters_json_file_string, ...
    'options_json_file_string', options_file_string, ...
    'output_file_string', model_output_file_string);
