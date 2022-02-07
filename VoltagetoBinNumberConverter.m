voltages = linspace(0,3.25,14);
[b4,c4] = converter(4);
[b8,c8] = converter(8);
[b12,c12] = converter(12);
figure
plot(c4,voltages,'o')
ylabel("Voltage")
xlabel("Bin Number")
title("4 bit Bin Number vs Voltage")
hold off
figure
plot(c8,voltages,'o')
ylabel("Voltage")
xlabel("Bin Number")
title("8 bit Bin Number vs Voltage")
hold off
figure
plot(c12,voltages,'o')
ylabel("Voltage")
xlabel("Bin Number")
title("12 bit Bin Number vs Voltage")
hold off
function [binaryC,decC] = converter(bits)
    bins = zeros(1,14);
    d = Voltage2Bin(0,3.3,bits);
    voltages = linspace(0,3.25,14);
    for i = 1:14
       for j = 1:length(d)
          if voltages(1,i) == d(1,j)
              spot = find(d == d(1,j));
              break
          elseif (voltages(1,i) <= d(1,j))
              spot = find(d == d(1,j)) - 1;
              break
          end
       end
       bins(1,i) = spot;
    end
    decC = bins;
    binaryC = dec2bin(bins);
end
function binD = Voltage2Bin(min_voltage,max_voltage,bits)
    % dec2bin, bin2dec
    range = max_voltage - min_voltage;
    binSize = range / 2^bits;
    binD = [0:binSize:range];
end

