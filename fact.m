%% NE 423 HW5 ~Analytic Solution~
% Aysia Demby
% Michael Gerard
% Lewis Gross

x=5;
y=make_array(x)

function output = make_array(n)
    oneArr = ones(1,n)
    zeroArr = zeros(1,n)
    output = [oneArr zeroArr]
end