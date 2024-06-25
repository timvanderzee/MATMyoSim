function demo_horslen_ramp

% Make sure the path allows us to find the right files
addpath(genpath('../../../code'));

% Variables
batch_file_string = 'horslen_ramp_batch.json';

% Load the batch data
batch_json = loadjson(batch_file_string);
batch_data = batch_json.MyoSim_batch;

% Run the batch
run_batch(batch_data);
