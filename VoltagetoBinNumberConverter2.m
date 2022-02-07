t = linspace(0,2*pi,14);
volts = 1.65 * sin(t) + 1.65;
[b12,c12] = converter(12,volts);

figure
plot(c12,[1:14],'o')
ylabel("Array Number")
xlabel("Bin Number")
title("12 bit Bin Number vs Array Number")
grid on
hold off

function [binaryC,decC] = converter(bits, volts)
    bins = zeros(1,14);
    d = Voltage2Bin(0,3.3,bits);
    voltages = volts;
    arrayL = zeros(1,14);
    for i = 1:14
       for j = 1:length(d)
          if voltages(1,i) == d(1,j)
              spot = find(d == d(1,j));
              arrayL(1,i)
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

