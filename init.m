% 2023_mt3 project startup script
% reads config.m and adds all necessary paths
run('config.m')
addpath('src/');
addpath('src/utils/');
addpath('src/models/');
addpath('src/postprocessing/');
addpath('src/preprocessing/');



% start GPML toolbox
run(PATH_GPML_STARTUP)
clear PATH_GPML_STARTUP

