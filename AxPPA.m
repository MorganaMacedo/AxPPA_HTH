function [saida] = AxPPA(a, b, K, W) 
           W=W+1;
           a= dec2bin(a, W);
           b= dec2bin(b, W);
           fim =length(a);
           for j = 1:fim
                    axppa_AND  = dec2bin(bitand(bin2dec(a(j, (W-K+1):W)) , bin2dec(b(j, (W-K+1):W))), K);
                    axppa_XOR  = dec2bin(bitxor(bin2dec(a(j, (W-K+1):W)) , bin2dec(b(j, (W-K+1):W))), K);
                    ss(j, (W-K+1):W) = dec2bin(bitxor(bin2dec(axppa_AND) , bin2dec(axppa_XOR)), K); 
                    ss(j, (1:(W-K))) = dec2bin(bin2dec(a(j, (1:(W-K))))+bin2dec(b(j, (1:(W-K)))), W-K);
           end
           saida(1:fim)=bin2dec(ss(:,:));        
           saida=double(saida);
end