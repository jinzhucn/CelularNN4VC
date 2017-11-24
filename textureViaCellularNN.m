

clc; clear; close all;
%% 1. addpath
fprintf('Loading image data file\n'); 
addpath('/Users/Yanyan/Documents/MATLAB/DATASET/SIPI_Database/');

imgRoot             = '/Users/Yanyan/Documents/MATLAB/DATASET/SIPI_Database/textures/';% test image path
im_ext              = 'tiff';

imnames             = dir([ imgRoot '*' 'tiff']);
%% 2. template initialization

A = [0 0 0; 0 2  0; 0 0 0];

B = [-1 -1 -1; -1 8 -1; -1 -1 -1];

z = -0.5;


%% 3. experiments
for ii = 1:length(imnames)
    fprintf('Processing image %d/%d ......\n', ii, length(imnames));
    tTotalStart = tic;
    % data settings
    imname                  = imnames(ii).name(1:end-5);
    imPath                  = [ imgRoot imname '.' im_ext]; 
    
    Image_info.path         =   imPath;
    Image_info.name         =   imname;
    % 
    Image_info.image = rgb2gray(imread(Image_info.path));
    Image_info.inputState = stateMatrixGen(Image_info.image);
    
    
    input = Image_info.inputState;

    
    outputState = stateCalculation(z, input, B, output, A);
    
end
    