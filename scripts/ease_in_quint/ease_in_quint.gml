/// ease_in_quint(inputvalue,outputmin,outputmax,inputmax)
function ease_in_quint(argument0, argument1, argument2, argument3) {
	return argument2 * power(argument0 / argument3, 5) + argument1;


}
