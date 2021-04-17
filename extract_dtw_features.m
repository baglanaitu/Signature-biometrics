function features = extract_dtw_features(signature)

%     First, the x & y coordinate and pression value are obtained
    x = signature{1,1}.x;
    x = x.';
    
    y = signature{1,1}.y;
    y = y.';
    
    p= signature{1,1}.p;
    p = p.';

%     The first derivative is computed for each parameter
%     We also take into account the first and final value in order to calculate
%    the derivatives
    xi = [x(1); x(1); x ; x(end) ; x(end)];
    yi = [y(1); y(1); y ; y(end) ; y(end)];
    pi = [p(1); p(1); p ; p(end) ; p(end)];

    dx = zeros(1,length(x));
    dy = zeros(1,length(y));
    dp = zeros(1,length(p));

%     Finally, the derivatives of each feature are computed
    for i = 3:length(xi)-2
        dx(i-2) = (xi(i+1) - xi(i-1) + 2.* (xi(i+2) - xi(i-2)))/(2*(1+4));
        dy(i-2) = (yi(i+1) - yi(i-1) + 2.* (yi(i+2) - yi(i-2)))/(2*(1+4));
        dp(i-2) = (pi(i+1) - pi(i-1) + 2.* (pi(i+2) - pi(i-2)))/(2*(1+4));
    end
    
%     The second derivative is computed for each parameter
%     We also take into account the first and final value in order to calculate
%    the derivatives
    dxi = [dx(1) dx(1) dx  dx(end) dx(end)];
    dyi = [dy(1) dy(1) dy  dy(end) dy(end)];
    dpi = [dp(1) dp(1) dp  dp(end) dp(end)];

    ddx = zeros(1,length(dx));
    ddy = zeros(1,length(dy));
    ddp = zeros(1,length(dp));

%     Finally, the derivatives of each feature are computed    
    for i = 3:length(dxi)-2
        ddx(i-2) = (dxi(i+1) - dxi(i-1) + 2.* (dxi(i+2) - dxi(i-2)))/(2*(1+4));
        ddy(i-2) = (dyi(i+1) - dyi(i-1) + 2.* (dyi(i+2) - dyi(i-2)))/(2*(1+4));
        ddp(i-2) = (dpi(i+1) - dpi(i-1) + 2.* (dpi(i+2) - dpi(i-2)))/(2*(1+4));
    end 

%     All the features are stored in a struct
    features.x = x.';
    features.y = y.';
    features.p = p.';
    features.dx = dx.';
    features.dy = dy.';
    features.dp = dp.';
    features.ddx = ddx.';
    features.ddy = ddy.';
    features.ddp = ddp.';

end

