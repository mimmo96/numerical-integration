function accuracity=gausslege(f,n)
%la funzione restituisce una stima dell'errore di integrazione calcolato
%sulla funzione fun mediante il metodo di Gauss_Legendre utilizzando il
%polinomio di grado n 

xu=linspace(-1,1,n)';

%approssimazione iniziale delle radici
x=cos((2*(0:(n-1))'+1)*pi/(2*(n-1)+2))+(0.27/n)*sin(pi*xu*(n-1)/(n+1)); 
x0=2;
% Matrice contenente gli n polinomi di legendre 
M=zeros(n,n+1);

% approssimazione delle n+1 radici del polinomio di legendre usando il
% metodo delle tangenti di Newton
% iteriamo fino a quando la differenza tra il punto x(i) e x(i+1) è
% maggiore di eps(precisone di macchina) 

while max(abs(x-x0))>eps
	
	M(:,1)=1;
	M(:,2)=x;
	Mder(:,1)=0;
	Mder(:,2)=1;

	for k=2:n
	   %calcolo degli n polinomi di legendre 
	   M(:,k+1)=( (2*k-1)*x.*M(:,k)-(k-1)*M(:,k-1) )/k;
	end
	
	%derivata del polinomio n-esimo
	Mder=(n)*( M(:,n)-x.*M(:,(n+1)) )./(1-x.^2);
 
	%metodo delle tangenti di Newton 
	x0=x;
	x=x0-M(:,(n+1))./Mder;
end 

% calcolo dei pesi 
w=2./((1-x.^2).*Mder.^2);

%calcolo l'integrale 
I=0;
for i=1:n
	%calcolo dell'integrale 
	I=I+w(i)*f(x(i));
end

%calcolo l'accuratezza
accuracity=abs(integral(f,-1,1)-I); 
end
 
