pipeline_output_path = 'I:\MECP2GEN-Q4070\SPIM\PipelineOutputs';
sep_idxs = [1200];    
load_s2p = true;
load_rois = true;

fish_folders = dir([pipeline_output_path, '\suite2p_*']);
num_fish = numel(fish_folders);

%% Get all fish numbers, padded with leading zeros (e.g. 05 rather than 5)
fish_folder_names = {fish_folders.name};
fin = cellfun(@(x)regexp(x,'fish(\d+)','tokens'), fish_folder_names, 'UniformOutput', false);
fish_numbers = cell(numel(fin), 1);
for i = 1:numel(fin)
    fish_numbers{i} = fin{i}{1}{1};
end



for fish_idx = 1:num_fish
    folder = fish_folders(fish_idx).name;
    
    fish_number = fish_numbers{fish_idx};
    
    %% Load ants ROIs for this fish
    ants_folder = dir([pipeline_output_path, '\ants_*fish', fish_number, '*']);
    ants_filename = strcat(pipeline_output_path, '\', ants_folder.name, '\ROIs_zbrainspace_', fish_number, '.csv')
    zbrain_rois = readmatrix(ants_filename);
    zbrain_rois(isnan(zbrain_rois)) = 0;
    ROI_centroids = zbrain_rois(:, 1:3);
    

end
