load BiosecurIDparameters.mat;

for param=1:4
    figure
    
    [count,edges] = histcounts(BiosecurIDparameters(:,:,param));
    lowerbound = min(count);
    upperbound = max(count);
    data = BiosecurIDparameters(:,:,param);
    histogram(data, 'Normalization','Probability');
   
    bar(edges(1:end-1),(count-lowerbound)/(upperbound-lowerbound));
    legend('show');
    switch param
        case 1
            xlabel('Total duration (seconds)')
            title('Total duration of the signature')
            xt = get(gca, 'XTick');                                 
            set(gca, 'XTick', xt, 'XTickLabel', xt/200)  ;
        case 2
            xlabel('Number of Pen-ups')
            title('Number of Pen-ups')
        case 3
            xlabel('Number of pen-down / T')
            title('Duration of pen-down')
        case 4
            xlabel('Average Pressure in pen-down')
            title('Average Pressure in pen-down')
    end
    ylabel('Normalized Probability');
    hLeg = legend('data1');
    set(hLeg,'visible','off');
    hold on
   
end