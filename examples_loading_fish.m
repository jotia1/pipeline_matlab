%% Examples loading a single or multiple fish

%% Load a single fish's raw data 
% Note: using the 'raw' functions loads the data with minimal extra
% processing. In particular, the ROIs are not filtered using zbrain and the
% Suite2p traces do not have the DF/F calculated. 


% the path should be to the pipeline output folder (not the fish specific
% folder).
pipline_output_path = 'I:\MECP2GEN-Q4070\SPIM\PipelineOutputs';
% This is the fish's number and must include a leading 0 if the fish has one (e.g. '05' instead of '5')
% Also note this is a string (has '' marks) and isn't just a number 
fish_number = '05'; 

% Now actually load the fish
[Suite2p_traces, ROI_centroids] = load_fish_raw(pipline_output_path, fish_number);


% Lets plot the ROIs to have a look
figure;
plot3(ROI_centroids(:, 1), ROI_centroids(:, 2), ROI_centroids(:, 3), '.');
title('ROIs from raw fish05');

% Lets plot the mean suite2p trace
figure;
plot(mean(Suite2p_traces))
title('Mean suite2p trace from raw fish05');


%% Load raw data for all fish in a pipeline output folder
% Load data for ALL fish in the pipeline output folder raw (without DF/F
% or filtering to zbrains)

% Load all fish
[Suite2p_traces_all, ROI_centroids_all, fish_ncells, fish_numbers] = load_all_fish(pipeline_output_path);

% Plot the ROIs of ALL fish
figure;
plot3(ROI_centroids_all(:, 1), ROI_centroids_all(:, 2), ROI_centroids_all(:, 3), '.');
title('ROIs from ALL raw fish');

% plot the mean Suite2p_trace of ALL fish
figure;
plot(mean(Suite2p_traces_all))
title('Mean suite2p trace from ALL raw fish');

% fish_ncells 


%% Loading only suite2p or ANTs data
% The above commands also work if you want to load ONLY Suite2p_traces or
% ANTs ROIs, however we have to tell the code not to try and load the
% unwanted variables.

% To load just Suite2p_traces
load_s2p = true;
load_rois = false;
[Suite2p_traces, ~] = load_fish_raw(pipline_output_path, fish_number, load_s2p, load_rois);

% To load just ROI locations.
load_s2p = false;
load_rois = true;
[~, ROI_centroids] = load_fish_raw(pipline_output_path, fish_number, load_s2p, load_rois);

% The same style of command works for load_all_fish_raw

