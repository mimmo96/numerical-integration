function integral = Cavalieri_Simpson ( fun , x, num_it)

% fun = funzione da integrare
% x = [x1,x2] intervallo su cui calcolare l'integrale
% num_it = numero max di punti di ascissa su cui calcolare l 'integrale: 2^num_it

%la funzione restituisce un vettore contenente una stima degli errori di
%integrazione calcolati sulla funzione fun con cardinalità dei punti di
%ascissa che vanno da 2^1 a 2^num_it.

%inizializzo il vettore contenente i valori degli integrali integral = zeros(num_it, 1);
n = 1;

for j= 1: num_it
	%cardinalità punti di ascissa 
	n = n*2;
	%distanza tra due punti di ascissa adiacenti 
	h = (x(2) - x(1)) / n;
	%vettore dei punti di ascissa equidistanti compresi tra x(1) e x(2) 
	points = linspace(x(1), x(2), n+1);
	%calcolo dell'integrale mediante la formula cavalieri_simpson 
	integral(j) = (h/3)*(fun(points(1)) + fun(points(length(points)))); 
	for i = 2:length(points) -1
		if ( mod(i, 2) == 0)
			integral(j) = integral(j) + (4/3)*h*fun(points(i)); 
		else
			integral(j) = integral(j) + (2/3)*h*fun(points(i));
	end 
end
