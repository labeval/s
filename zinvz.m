%z
syms n z
f=2^n
F=ztrans(f)
y=iztrans(F)
%1
num=[0,1]
den=[3,-4,1]
[r,p,c]=residue(num,den)
[b,a]=residue(r,p,c)
zplane(num,den)
%2
num=1
den=poly([0.9,0.9,-0.9])
[r,p,c]=residuez(num,den)
zplane(num,den)