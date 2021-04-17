function FeatVect = featureExtractor(x,y,p)

%   Total duration of the signature: T
    [~,T] = size(x);
    
%   Number of pen-up (number of times the pen was lifted)
    [~,Npu] = size(find(p == 0));
    
%   Duration of pen-down
%   First, the pressures > 0 are found. Then, the Number of pen down (Npd)
%   is calculated. Finally, the duration of pen down (Tpd) is computed.
    PFind = find(p ~= 0);
    Pression = p(PFind);
    [~,Npd] = size(Pression);
    Tpd = Npd/T;
    
%   Average pressure in pen-down (only those which pressure > 0)
    Ppd = mean(Pression);
    
    FeatVect=[T, Npu, Tpd, Ppd];

end
