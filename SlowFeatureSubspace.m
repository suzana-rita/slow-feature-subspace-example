function SFS = SlowFeatureSubspace(X, num_w, C, sub_dim)
% X = input video
% num_w = number of weight vectors
% C = coeficient of PCA contribution
% sub_dim = dimension of the SFS

    [~, nNum] = size(X);

    X= X - mean(X);

    Xdot = zeros(size(X));
    for t = 1:size(X,2)
        if (t+1>size(X,2))
            Xdot(:,t)= - X(:,t);
        else
            Xdot(:,t)= X(:,t+1) - X(:,t);
        end
    end
    
    %disp("Calculate sum Xdot*Xdot'")
%     sum_xdot = zeros(size(Xdot,1),size(Xdot,1));
%     for t = 1:size(Xdot,2)
%         sum_xdot = sum_xdot + Xdot(:,t)*Xdot(:,t)';
%     end

    sum_xdot = Xdot*Xdot';

    %disp('Calculate the SVD of X')
    [U,S,~] = svd(X,'econ');

    %disp('Calculate n = (sum normXdot^2)/T;')
    normXdot = 0;
    for i = 1:nNum
        normXdot = normXdot + norm(Xdot(:,i))^2;
    end
    n = C*normXdot/nNum;

    %disp('Calculate second eigenvalue problem')
    sigma = (n*(S^(-2))+(S^(-1))*U'*sum_xdot*U*(S^(-1)));
    [eig_vec, eig_val] = eig(sigma, 'vector');

    %disp('Calculate w')
    w = (U/S)*eig_vec;

    % order w2 according to the eigenvalues
    [~, ind] = sort(eig_val);
    aux = w(:, ind);
    w = aux;

    vec_row = size(w,1);
    vec_col = num_w;
    video_descriptor_W = zeros(vec_row,vec_col);
    for i = 1:num_w
        video_descriptor_W(:,i) = (w(:,i)/norm(w(:,i)));
    end
    SFS = cvtBasisVectorSVD(video_descriptor_W, sub_dim);
end