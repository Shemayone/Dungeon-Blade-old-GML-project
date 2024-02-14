///cord str is "x.x"
function scr_return_cord_handle_str(argument0) {

	var str_cord=argument0, xx, yy,x_str="",y_str="";
	var str_l=string_length(str_cord)
	var i=1;
	var return_array;

	while((i<str_l)&&string_char_at(str_cord,i)!=".")
	{
	x_str=x_str + string_char_at(str_cord,i)
	i++
	}
	i++
	while((i<=str_l)&&string_char_at(str_cord,i)!=".")
	{
	y_str=y_str + string_char_at(str_cord,i)
	i++
	}

	return_array[0]=real(string_digits(x_str))
	return_array[1]=real(string_digits(y_str))

	return return_array


}
