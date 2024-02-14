function console_handle_str(argument0) {
	var str= string_lower(argument0);
	var str_l = string_length(str);
	var help_str="", help_str2="";;;
	var i=1;

	//read function
	//save_map
	//load_map
	while ((str_l>i)&& string_char_at(str,i)!=" ")
	{
	help_str=help_str + string_char_at(str,i)
	i++;
	}
	var second_arg = string_copy(str,i,(str_l-i)+1)

	str_l= string_length(second_arg);
	i=1;
	while ((str_l>i)&& string_char_at(second_arg,i)==" ")
	{
	i++;
	}

	while ((str_l>i)&& string_char_at(second_arg,i)!=" ")
	{
	help_str2=help_str2 + string_char_at(second_arg,i)
	i++;
	}
	second_arg=help_str2;

	console_decider(help_str,second_arg);



}
