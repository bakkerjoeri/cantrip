/// ease_in_out_quint(inputvalue,outputmin,outputmax,inputmax)
function ease_in_out_quint(argument0, argument1, argument2, argument3) {
	argument0 /= argument3 * 0.5;

	if (argument0 < 1)
	{
	    return argument2 * 0.5 * power(argument0, 5) + argument1;
	}

	return argument2 * 0.5 * (power(argument0 - 2, 5) + 2) + argument1;


}
