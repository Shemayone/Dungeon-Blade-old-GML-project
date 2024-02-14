function console_decider(argument0, argument1) {
	var func=argument0;
	var arg=argument1;



	if func=="make_barrow"
	{
	var h_array=scr_return_cord_handle_str(arg)
	make_barrow_tomb(h_array[0],h_array[1],5);
	}
	if func=="make_barrow_field"
	{
	var passed_arg=real(string_digits(arg));
	make_barrow_field(obj_game.grid_size,obj_game.grid_size,passed_arg);
	}
	
		if func=="test_str"
	{
	 var test_grid=ds_grid_create(3,3)
	 var test_str="012514.3.0.4.156.46.9."
	 ds_grid_set(test_grid,1,1,test_str);
     var test_arr=transform_str_to_arr_grid_cell(test_grid,1,1);
	 var test_test=true
	 ds_grid_destroy(test_grid);
	}
	  	if func=="test_arr"
	{
	 var test_grid=ds_grid_create(3,3)
	 var test_str_def="012514.3.0.4.156.46.9."
	 var test_arr;
	 test_arr[0]=1
	 test_arr[1]=2
	 test_arr[2]=5
	 test_arr[3]=14
	 test_arr[4]=3
	 test_arr[5]=0
	 test_arr[6]=4
	 test_arr[7]=156
	 test_arr[8]=46
	 test_arr[9]=9
	 ds_grid_set(test_grid,1,1,test_arr);
     var test_str=transform_arr_to_str_grid_cell(test_grid,1,1);
	 var test_test=true
	 ds_grid_destroy(test_grid);
	}



}
