function [saida] = LOA_Trojan(a,b, K, W)
           W=W+1;
           a= dec2bin(a, W);
           b= dec2bin(b, W);
           fim =length(a);
                for j = 1:fim
                   aux = dec2bin(or(bin2dec(a(j, (W-K+1):W)), bin2dec(a(j, (W-K+1):W))));
                   T = dec2bin(and(bin2dec(a(j, (W-K+1):W)), bin2dec(a(j, (W-K+1):W))));
                   ss(j, (W-K+1):W) = dec2bin(xor(bin2dec(aux), bin2dec(T))); 
                   ss(j, (1:(W-K))) = dec2bin(bin2dec(a(j, (1:(W-K))))+bin2dec(b(j, (1:(W-K)))), W-K);
                   
                end
                saida(1:fim)=bin2dec(ss(:,:));
                saida=double(saida);
end