function y = fCorrector( n, h, YValues, predictorValues )
y = YValues(n-1) + (h/3) * (predictorValues(n-1) + 4*predictorValues(n) + predictorValues(n+1));
end

