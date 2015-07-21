set_global_path;
% addpath opt_flip_Prob_0.00_groundtruth_C0.30_E0.40_W3_tfeat_on_Thre1.0_learning;
% addpath opt_corrupt_Prob_0.50_uniform_20_0_C0.30_E0.40_W3_tfeat_on_Thre1.0_learning;
% addpath opt_flip_Prob_0.00_m1_100_C0.30_E0.40_W3_tfeat_on_Thre1.0_learning;
addpath BCFW_opt_flip_Prob_0.00_groundtruth_C0.50_E0.10_W3_tfeat_on_Thre1.0_learning;
% baseFile takes the name of the dataset for evaluation. valid options:
% groundtruth segmentation: 'groundtruth'
% uniform segmentation: 'uniform_20_0' 'uniform_20_15' 'uniform_30_10' 'uniform_40_10'
% graph-based segmentation: 'm1_100' 'm1_500' 'm1_1000' 'm2_100' 'm2_500' 'm2_1000'
baseFile = 'groundtruth'; % dataset to evaluate

% load model
load('model_groundtruth_Z2_C1.00_E0.01_W3_tfeat_on_Thre1.0_learning_iter2_Test4.mat')

% load data
baseFolder = fullfile(pwd,'CAD120','segmentation_lists');
path = fullfile(baseFolder,baseFile);
[trainData,testData] = load_CAD120('tfeat_on',train_sid,path);

% evaluate on training data
[~,~,trainRate] = evaluate_model(trainData, model, params);

% evaluate on test data
[gt_labels,pred_labels,testRate] = evaluate_model(testData, model, params);
[confmat, precision, recall, fscore] = prec_recall(gt_labels,pred_labels);

activity_labels = {'reaching','moving','pouring','eating','drinking','opening','placing','closing','scrubbing','null'};
draw_cm(confmat,activity_labels,activity_labels,[10,10]);

result = sprintf('%s_result_hard',baseFile);
saveas(gcf,result,'jpg');

% showmat = cell(11,11);
% resmat = num2cell(confmat);

% for j = 2:11
%	showmat(1,j) = activity_labels((j-1));
%end
%for i = 2:11
%	showmat(i,1) = activity_labels((i-1));
%end
%for i = 2:11
%	for j = 2:11
%		showmat(i,j) = resmat((i-1),(j-1));
%	end
%end
%disp(showmat);
