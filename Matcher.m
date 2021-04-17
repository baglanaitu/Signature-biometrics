function finalScore=Matcher(test,Model)

% Obtain the different features from the test signature
T_test = test(1);
Npu_test = test(2);
Tpd_test = test(3);
Ppd_test = test(4);

modelSize = size(Model,1);
scores = ones(1,modelSize);
for current_model = 1: modelSize
    % Obtain the different features from the model signature
    T_Model = Model(current_model,1);
    Npu_Model = Model(current_model,2);
    Tpd_Model = Model(current_model,3);
    Ppd_Model = Model(current_model,4);

    % Get the dtw difference of the features between both signatures
    T_diff = sum((T_test - T_Model) .^ 2);
    Npu_diff = sum((Npu_test - Npu_Model) .^ 2);
    Tpd_diff = sum((Tpd_test - Tpd_Model) .^ 2);
    Ppd_diff = sum((Ppd_test - Ppd_Model) .^ 2);

    % Obtain the sqrt of the sum between all time features
    total_sum = sqrt(T_diff + Npu_diff + Tpd_diff + Ppd_diff);
    scores(current_model) = total_sum;
end

% Final score 
finalScore = mean(scores);

end