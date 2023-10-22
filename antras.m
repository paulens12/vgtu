mod(20231264, 6)+1; % 3-ias variantas

% y = x / (1 + x^2)

% l - lagranzo polinomas visiems taskams = [ x1 x2 x3 ... ] - polinomo
% koeficientai. pvz:
% [a b c] -> ax^2 + bx + c
% polyval - ivykdo fukcija pagal polinomo koeficientus. pirmas arg -
% polinomo koeficientai, antras arg - x taskai

% aproksimacijos eile - kiek tasku imam is pradines funkcijos

% -10 <= x <= 10

% polyval - paima koeficientus

% INSTRUKCIJOS KITOMS DALIMS!!!
% =============================
% inline funkcija - ikisa funkcija (ne reiksmes) i kintamaji
% spline
% praleisti dali apie Teiloro eilute


approx(5)


function ret = approx(n)
    points = zeros(n, 2);
    x = linspace(-10, 10, n);
    for i = 1:n
        points(i, :) = [x(i) (x(i) / (1 + x(i)^2))];
    end
    ret = points(1,1);
end

function l = lagranp(data)
    N = length(data);
    l = 0;
    for m = 1:N
        % skaiciuojam nari prie y_m
        % pradedam nuo tuscio polinomu vektoriaus - t.y. jis atvaizduoja
        % funkcija y=1
        P = 1;
        for k = 1:N
            % x_m - x_m praleidziam
            if k~=m
                % polinoma dauginam is (x - x_k) naudodami conv funkcija
                % tada visus polinomo koeficientus dalinam is (x_m - x_k) -
                % paprastai, nes vardiklyje nera kintamuju
                P = conv(P, [1 (-data(k,1))]) / (data(m,1)-data(k,1));
            end
            %rezultate gaunam pilna nari prie y_m
        end
        l = l + data(m,2)*P;
    end
end