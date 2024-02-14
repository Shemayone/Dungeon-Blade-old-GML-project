///
///  all possible versions (0 - is 00) (1) is 01 10 is (10) 9999
function hex_grid_string_to_array1(argument0) {
	//
	//  string - A-(0 to 100) visual type of hex (movement cost, and other derived) D-(separator) B- entity number
	//  C- list of entities (list?) (own data structure)
	//  format - 100D10D
	///00-99
	/// we get data from ds_grid_get call and here we process string to array

	var grid_str=argument0;
	var str_l=string_length(grid_str);
	var A_string="",B_string="", E_string="",return_array;
	var i=1;
	var str_char=string_char_at(grid_str,i);
	while (3>i &&str_l>1)
	{
	if ((i==1)&& (str_char=="0"))!=true
	{
	A_string=A_string + str_char;
	}
	i++;
	str_char=string_char_at(grid_str,i)
	}
	if A_string!=""
	{
	return_array[0]=real(A_string)
	}
	else {return_array[0]=0;}
	//i++;
	//str_char=string_char_at(grid_str,i)
	if return_array[0]!=0
	{
	while (5>i && str_l>=i)
	{
	if (i==3 && str_char=="0")!=true
	{	
	B_string=B_string + str_char;
	}
	i++;
	str_char=string_char_at(grid_str,i);
	}
	if B_string !=""
	{
	return_array[1]=real(B_string);
	}
	else { return_array[1]=0; }

	while (7>i && i<str_l)
	{
	if (i==5 && str_char=="0")!=true
	{	
	E_string=E_string + str_char;
	}
	i++;
	str_char=string_char_at(grid_str,i);	
	}
	if E_string !=""
	{
	return_array[2]=real(E_string);
	}
	else return_array[2]=0;

	while (i<=str_l)
	{

	return_array[i-4]=real(string_char_at(grid_str,i))
	i++
	}

	}
	else
	{
	return_array[1]=0
	return_array[2]=0
	return_array[3]=0
	return_array[4]=0

	}




	return return_array;


}
