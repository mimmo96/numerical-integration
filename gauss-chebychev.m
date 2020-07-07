function integrale = g_cheb (f, num_it)
% f = funzione da integrare
% num_it = numero max di nodi: 2^num_it

%la funzione restituisce un vettore contenente una stima degli errori di
%integrazione calcolati sulla funzione fun con cardinalità dei punti di
%ascissa che vanno da 2^1 a 2^num_it.

integrale = zeros (num_it, 1); n = 1;
for j = 1: num_it
	%numero dei nodi di cheb 
	n = n*2;
	%peso  
	w= pi/n;
	for i=1:n
		%calcolo del nodo i-esimo 
		x=cos(((2*i-1)/(2*n))*pi);
		%calcolo di w / W(x) con x nodo i-esimo di chebyshev 
		wf=w*sqrt(1-x^2);
		%calcolo dell'integrale 
		integrale(j)=integrale(j)+wf*f(x); 
	end 
end
