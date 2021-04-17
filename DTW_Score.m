function ScoreFinal = DTW_Score(test, model)
%     Compute dtw score for x coordinate
    [D, IX, ~] = dtw(test.x, model.x);
    K = length(IX);
    scoreX = exp(-D/K);

%     Compute dtw score for y coordinate
    [D, IX, ~] = dtw(test.y, model.y);
    K = length(IX);
    scoreY = exp(-D/K);

%     Compute dtw score for p
    [D, IX, ~] = dtw(test.p, model.p);
    K = length(IX);
    scoreP = exp(-D/K);

%     Compute dtw score for first derivative of x coordinate    
    [D, IX, ~] = dtw(test.dx, model.dx);
    K = length(IX);
    scoreDX = exp(-D/K);

%     Compute dtw score for first derivative of y coordinate    
    [D, IX, ~] = dtw(test.dy, model.dy);
    K = length(IX);
    scoreDY = exp(-D/K);

%     Compute dtw score for first derivative of p
    [D, IX, ~] = dtw(test.dp, model.dp);
    K = length(IX);
    scoreDP = exp(-D/K);

%     Compute dtw score for second derivative of x coordinate    
    [D, IX, ~] = dtw(test.ddx, model.ddx);
    K = length(IX);
    scoreDDX = exp(-D/K);

%     Compute dtw score for second derivative of y coordinate    
    [D, IX, ~] = dtw(test.ddy, model.ddy);
    K = length(IX);
    scoreDDY = exp(-D/K);

%     Compute dtw score for second derivative of p 
    [D, IX, ~] = dtw(test.ddp, model.ddp);
    K = length(IX);
    scoreDDP = exp(-D/K);

%     Finally, the average score of all dtw values is computed
    ScoreFinal = mean([1-scoreX; 1-scoreY; 1-scoreP; 1-scoreDX; 1-scoreDY; 1-scoreDP;
        1-scoreDDX; 1-scoreDDY; 1-scoreDDP]);

end

