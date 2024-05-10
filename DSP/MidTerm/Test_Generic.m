clc
clear
close all

% x = [1 7 2 6 9 5]; 

x = [1 7 2 6 9 5 2 4 7 3 2 4 7 11 3];

N = length(x);

n1 = 5; 
n2 = 3; 

X = fft(x,N); 
I = zeros(n2,n1);

% N = 6; 

% n1 = 3; 
% n2 = 2; 

for i = 1:n2 
for j = 1:n1 
I(i,j) = x(n1*(i-1)+(j-1)+1);
end 
end 
I 

clear i 
ICF = I;
for c = 1:n1 
ICF(:,c) = fft(I(:,c),n2); 
end 
ICF 

T = zeros(n2,n1); 
for b = 1:n2 
for j = 1:n1 
T(b,j) = exp(-i*(2*pi/6))^((b-1)*(j-1));
end 
end 
T; 
B = ICF.*T 

ORF = B; 
for r = 1:n2 
ORF(r,:) = fft(B(r,:),n1); 
end 
O = ORF; 
O(:); 
[conj(X') O(:)]


%  1     7     2     6     9
%  5     2     4     7     3
%  2     4     7    11     3