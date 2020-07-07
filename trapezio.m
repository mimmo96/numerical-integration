function integrale = trapezio(fun, x, num_it )
% fun = funzione da integrare
% x = [x1,x2] intervallo su cui calcolare l'integrale
% num_it = numero max di punti di ascissa su cui calcolare l 'integrale: 2^num_it

%la funzione restituisce un vettore contenente una stima degli errori di integrazione
%calcolati sulla funzione fun con cardinalità dei punti di ascissa che vanno
%da 2^1 a 2^num_it.

%inizializzo il vettore contenente i valori degli integrali 
integrale = zeros(num_it, 1);
n = 1;
  for i= 1: num_it
     	%cardinalità punti di ascissa 
	n = n *2;
     	%distanza tra due punti di ascissa adiacenti 
	h = (x(2) -x(1)) / n;
   	%vettore dei punti di ascissa equidistanti compresi tra x(1) e x(2) 
	points = linspace ( x(1), x(2), n+1);
    	%calcolo dell'integrale i-esimo mediante formula dei trapezi 
	for j = 1: length(points) -1
		integrale(i) = integrale(i) + 0.5*h*(fun(points(j)) + fun(points(j+1)));
	end
  end 
end
