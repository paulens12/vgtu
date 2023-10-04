% eksperimentiniai duomenis, pagal kuriuos bus tikslinama formule
testData = [13 55; 14 58; 17 63; 18 65; 19 66; 15 59; 13 56; 31 87; 32 90; 29 85; 27 81];
% pradiniai parametrai formulei: c = k1 * f + k2
k = [100; 100];

% klaidu kovariacijos matrica
% matricos dimensija yra n x n, kur n - pozymiu kiekis (siuo atveju - k1 ir
% k2). Istrizaineje esantys nariai nurodo atitinkamo pozymio neapibreztuma,
% o like - atitinkamos pozymiu poros priklausomybe.
% pradzioje paklaidos visur dideles, todel pradedame su didelemis
% reiksmemis istrizaineje, ir tariame, kad savybes tarpusavyje
% nepriklausomos.
P = [10 0; 0 10];

for i = 1 : 5
    % atnaujiname svertini vektoriu: K = P * f / (f^T * P * f + 1)
    % feat yra vektorius is eksperimentines f reiksmes (koeficientas prie k1)
    % ir 1 (koeficientas prie k2)
    c = testData(i, 1);
    f = testData(i, 2);
    feat = [f; 1];
    K = P * feat / (feat.' * P * feat + 1)
    
    % atnaujinam koeficientus pagal gauta paklaida
    % nuspejama c reiksme pagal formule naudojant dabartines k1, k2 reiksmes
    c_pred = feat.' * k;
    k = k + P * feat * (c - c_pred)
    
    % atnaujinam klaidu kovariacijos matrica
    P = P - K * feat.' * P
end
