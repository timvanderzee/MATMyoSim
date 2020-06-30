function update_best_opt_file(opt_structure, p_vector)
% Function updates opt_structure with supplied p_vector and outputs to file

% Code

% Update
best_opt_job = opt_structure;

% Do the parameters first
for i = 1 : numel(p_vector)
    best_opt_job.parameter{i}.p_value = p_vector(i);
end

% Now do the constraints
p_counter = numel(p_vector);

if (isfield(best_opt_job, 'constraint'))
    for i = 1 : numel(best_opt_job.constraint)
        if (isfield(best_opt_job.constraint{i}, 'parameter_multiplier'))
            for j = 1 : numel(best_opt_job.constraint{i}.parameter_multiplier)
                p_counter = p_counter + 1;
                best_opt_job.constraint{i}.parameter_multipler{j}.p_value = p_vector(p_counter);
            end
        end
    end
end

% Save to string and tidy up file names
out_string = savejson('MyoSim_optimization', best_opt_job);
out_string = strrep(out_string, '\/', '/');

% Write to file
output_file_string = fullfile(cd, opt_structure.best_opt_file_string);
if (~isdir(fileparts(output_file_string)))
    mkdir(fileparts(output_file_string));
end
of = fopen(opt_structure.best_opt_file_string,'w');
fprintf(of,'%s',out_string);
fclose(of);

