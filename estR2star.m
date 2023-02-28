function R2star=estR2star(iField,TE)
% ----------------- Input ----------------------------------------
% iField is the complex data with dim [Nrow x Ncol x Slice X Necho]
% ----------------- Output ---------------------------------------
% R2star is the R2star value with dim [Nrow x Ncol x Slice]
% ----------------------------------------------------------------
tic
M=log(abs(iField));
s0=size(M);
L_s0=length(s0);
M=reshape(M,[prod(s0(1:L_s0-1)),s0(L_s0)]);
A=[ones(s0(L_s0),1),TE];
ip = A\M';
ip = transpose(ip);
ip = ip(:,2);
R2star = -reshape(ip,[s0(1),s0(2),s0(3)]);
R2star=min(max(R2star,0),130);
toc
