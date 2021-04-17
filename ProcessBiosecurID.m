close all
clear all
clc

%BiosecurIDparameters matrix with: 50 (users) x 16 (signatures/user) x 4 (params)
BiosecurIDparameters=ones(50,16,4);

%BiosecurIDparametersDTW matrix with: 50 (users) x 16 (signatures/user) x 1 (structure with x, y and p)
BiosecurIDparametersDTW=cell(50,16);

% Only selected the genuine signatures: 1, 2, 6 and 7 signatures
genuine_vector = [1,2,6,7];

% For each user
for user = 1: 50
%     Initialize the counter of each user
    counter = 1;
    
%     For all four sessions
    for sesion = 1:4
%         For each signature
        for sign_genuine = genuine_vector
                       
            %This is how to load the signatures:  
            
            if user<10
                BiosecurID=load(['./DB/u100', num2str(user),'s000', num2str(sesion), '_sg000', num2str(sign_genuine), '.mat']);
            else
                BiosecurID=load(['./DB/u10', num2str(user),'s000', num2str(sesion), '_sg000', num2str(sign_genuine), '.mat']);
            end
            
%             Take the x, y and pressure values
            x=BiosecurID.x;
            y=BiosecurID.y;
            p=BiosecurID.p;
            
%             Extract the features of each signature
            FeatVect = featureExtractor(x,y,p);
            
%             Finally, save them to the matrix
            BiosecurIDparameters(user,counter,1) = FeatVect(1);
            BiosecurIDparameters(user,counter,2) = FeatVect(2);
            BiosecurIDparameters(user,counter,3) = FeatVect(3);
            BiosecurIDparameters(user,counter,4) = FeatVect(4);
            
%           Save the features (x coordinate, y coordinate and pressure) to the DTW matrix
            BiosecurIDparametersDTW{user,counter} = BiosecurID;
            
%             Update the counter
            counter = counter+1;
            
        end
    end
end            
 
% Save the matrix into a .mat file (both matrix)
save('BiosecurIDparameters','BiosecurIDparameters');
save('BiosecurIDparametersDTW','BiosecurIDparametersDTW');

