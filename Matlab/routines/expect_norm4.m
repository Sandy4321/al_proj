function [ out ] = expect_norm4(U,V,row_cov,dim_cov,i,j,k,l)
%E [Uki Vkj Uli Vlj]
%E [XaXbXcXd] = �a �b �c �d + �c �d ?ab +�b�d?ac +�b�c?ad+�a�d?bc+�a�c?bd+�a�b?cd + ?ab?cd + ?ac?bd + ?ad?bc
% a = i,k
% b = j,k
% c = i,l
% d = j,l
% ?ij?kl = ?ab
% fprintf('i:%d - j:%d \n',i,j+length(U))
x = length(U);
out = U(i,k)*V(j,k)*U(i,l)*V(j,l) + U(i,l)*V(j,l)* row_cov(i,j+x)*dim_cov(k,k) ... % �a �b �c �d + �c �d ?ab
        + V(j,k)*V(j,l) * row_cov(i,i)*dim_cov(k,l) ... %�b�d?ac
        + V(j,k)*U(i,l) * row_cov(i,j+x)*dim_cov(k,l) ... %�b�c?ad
        + V(j,k)*V(j,l) * row_cov(j+x,i)*dim_cov(k,l) ... %�a �d ?bc
        + U(i,k)*U(i,l) * row_cov(j+x,j+x)*dim_cov(k,l) ... %�a �c ?bd
        + U(i,k)*V(j,k) * row_cov(i,j+x)*dim_cov(l,l) ... %�a�b?cd
        + row_cov(i,j+x)*dim_cov(k,k) * row_cov(i,j+x)*dim_cov(l,l) ...%?ab?cd
        + row_cov(i,i)*dim_cov(k,l) * row_cov(j+x,j+x)*dim_cov(k,l) ...%?ac?bd
        + row_cov(i,j+x)*dim_cov(k,l) * row_cov(i,j+x)*dim_cov(k,l); %?ad?bc
end

