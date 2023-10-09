clear
%% only calculate the subspace
% data for comparison
load ('0000_openhand_gray_float_40x30.mat')
video_open_0000 = video_open;
clear video_open

%hyperparameters
C_coef=10;
num_weight_vecs = 10;
sub_dim = 10;

% video_open_norm = cvtNormalize(video_open_0000);
SFS = SlowFeatureSubspace(video_open_0000, num_weight_vecs, C_coef, sub_dim);
%%%%%%%%%%%%%%%%%%%%%%%%


%% Calculate similarity for the standard subspaces
clear

% these two videos have the same frames but in inverse order
% each frame was flattened and are now columns in the matrices below
% you can easily visualize the frames by unflaterring the vectors using
% 40x30 dimension
load ('0000_openhand_gray_float_40x30.mat')
load ('0000_closehand_gray_float_40x30.mat')

video_open_0000 = video_open;
video_close_0000 = video_close;
clear video_open video_close

C_coef=10;
num_weight_vecs = 10;
sub_dim = 5;

video_open_norm = Normalize(video_open_0000);
video_close_norm = Normalize(video_close_0000);

std_subspace_open = BasisVectorSVD(video_open_norm, sub_dim);
std_subspace_close = BasisVectorSVD(video_close_norm, sub_dim);

sfs_open = SlowFeatureSubspace(video_open_0000, num_weight_vecs, C_coef, sub_dim);
sfs_close = SlowFeatureSubspace(video_close_0000, num_weight_vecs, C_coef, sub_dim);


% In this example, the traditional subspace has similarity equal to 1.0,
% which means that the subspaces are identical. In this way, the
% traditional subspace representation is unable of distinguishing
% diferent sequences of frames
stds_sim = CanonicalAnglesMean(std_subspace_open, std_subspace_close);

%In contrast, the similarity is 0.7764, which means that our SFS can
%represent different sequences even though they are based in the same frames 
sfs_sim = CanonicalAnglesMean(sfs_open, sfs_close);

clear video_close_0000 video_close_norm video_open_0000 video_open_norm
clear std_subspace_close std_subspace_open sfs_open sfs_close
clear sub_dim num_weight_vecs C_coef