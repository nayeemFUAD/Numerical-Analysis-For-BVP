function y = fPredictor( n, h, YValues, Values )
y = YValues(n-3) + (((4*h)/3) * (2*Values(n-2) - Values(n-1) + 2*Values(n)));
end

