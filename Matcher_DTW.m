function ScoreFinal=Matcher_DTW(test,model)
%   Extract test features (x,y,p and their corresponding derivatives)
    testFeatures= extract_dtw_features(test);

%   Check model size
    model_signatures = size(model,2);

    scores= ones(1,model_signatures);

%   Extract and compute dtw score between test and model signatures
%   depending on the model size (if there are more than one signature)
    if model_signatures > 1
        for current_model_number = 1: model_signatures
            current_model = model(current_model_number);
            modelFeatures= extract_dtw_features(current_model);

            currentScore = DTW_Score(testFeatures, modelFeatures);
%            Finally all the scores are saved
            scores(current_model_number) = currentScore;
        end
    else

        modelFeatures= extract_dtw_features(model);

        currentScore = DTW_Score(testFeatures, modelFeatures);
        scores(1) = currentScore;    

    end

%   Compute the final score by calculating the average among all the scores
    ScoreFinal = mean(scores);
    
end

    