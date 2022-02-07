truth = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1];
for i = 1:8
   binary(truth(i,:)) 
end
function s = binary(G)
    if (G(3) == 1 || G(1) == 1 && G(2) == 1)
        s = 1;
    else
        s = 0;
    end
end