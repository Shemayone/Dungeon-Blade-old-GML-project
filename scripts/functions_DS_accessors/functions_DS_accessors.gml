// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function transform_arr_to_str_grid_cell(grid,xx,yy){
var arr=ds_grid_get(grid,xx,yy);
var h_str="0"
if (arr[0]<=9){
var str=h_str +string(arr[0])+string(arr[1])+string(arr[2])
} else{
var str=string(arr[0])+string(arr[1])+string(arr[2])
}

var structure=arr[1];
var items=arr[2];
if (arr[1]>0){
var arr_num=3;
while (structure>0){
str=str + string(arr[arr_num])+"."	
structure--;
arr_num++;
}

}
if (arr[2]>0){
while (items>0){
str=str + string(arr[arr_num])+"."	
items--;
arr_num++;
}

}

return str;
}

function transform_str_to_arr_grid_cell(grid,xx,yy){

var str=ds_grid_get(grid,xx,yy);
var B_string="", C_string="",return_array, str_char;
	str_char[0]=string_char_at(str,1);
	str_char[1]=string_char_at(str,2);
	return_array[1]=real(string_digits(string_char_at(str,3)));
	return_array[2]=real(string_digits(string_char_at(str,4)));
	if str_char[0]!="0"{
	var help_str=str_char[0]+str_char[1]
	return_array[0]=real(string_digits(help_str));
	}
	else{
	return_array[0]=real(string_digits(str_char[1]))
	}
	var d=5
	if (return_array[1]>0){
	var i=return_array[1]

	var arr_num=3;
	while (i>0){
	var h_str="";
	while(string_char_at(str,d)!=".")
	{
	h_str=h_str + string_char_at(str,d)
	d++;
	}
	return_array[arr_num]=real(string_digits(h_str))
	h_str=""
	arr_num++;
	d++;
	i--;
	
	}}
	h_str="";
		if (return_array[2]>0){
	var i=return_array[2]
	while (i>0){
	var h_str="";
	while(string_char_at(str,d)!=".")
	{
	h_str=h_str + string_char_at(str,d)
	d++;
	}
	return_array[arr_num]=real(string_digits(h_str))
	h_str=""
	arr_num++;
	d++;
	i--;
	
	}}
	
	return return_array;
	}




function grid_cell_str_to_arr(grid){
var grid_size_x, grid_size_y;
grid_size_x=ds_grid_width(grid);
grid_size_y=ds_grid_height(grid);
for (var xx=0; xx<grid_size_x;xx++){for (var yy=0; yy<grid_size_y;yy++){
var arr=transform_str_to_arr_grid_cell(grid,xx,yy);
ds_grid_set(grid,xx,yy,arr);
}}
}





function grid_get_arr_nth(grid,xx,yy,n){
var array=ds_grid_get(grid,xx,yy);
return array[n];
}
function grid_set_arr_nth(grid,xx,yy,n,value){
var array=ds_grid_get(grid,xx,yy);
array[n]=value
ds_grid_set(grid,xx,yy,array);
}
function set_tile_type(xx,yy,value){
var grid=obj_game.grid_cell[obj_game.grid_level];
grid_set_arr_nth(grid,xx,yy,0,value);
}
function set_tile_type_level(xx,yy,value,level){
var grid=obj_game.grid_cell[level];
grid_set_arr_nth(grid,xx,yy,0,value);
}
function set_structure_count_level(xx,yy,value,level){
var grid=obj_game.grid_cell[level];
grid_set_arr_nth(grid,xx,yy,1,value);
}
function set_items_count_level(xx,yy,value,level){
var grid=obj_game.grid_cell[level];
grid_set_arr_nth(grid,xx,yy,2,value);
}
function set_itst_nth_level(xx,yy,nth,value,level){
var grid=obj_game.grid_cell[level];
grid_set_arr_nth(grid,xx,yy,nth,value);
}
function get_itst_nth_level(xx,yy,nth,level){
var grid=obj_game.grid_cell[level];
var return_value=grid_get_arr_nth(grid,xx,yy,nth);
return return_value
}


function get_tile_type(xx,yy){
var grid=obj_game.grid_cell[obj_game.grid_level];
var return_value;
return_value=grid_get_arr_nth(grid,xx,yy,0);
return return_value;

}

function get_tile_type_level(xx,yy,level){
var grid=obj_game.grid_cell[level];
var return_value;
return_value=grid_get_arr_nth(grid,xx,yy,0);
return return_value;

}

function get_structure_count(xx,yy){
var grid=obj_game.grid_cell[obj_game.grid_level];
var return_value=grid_get_arr_nth(grid,xx,yy,1);
return return_value;

}
function get_structure_count_level(xx,yy,level){
var grid=obj_game.grid_cell[level];
var return_value=grid_get_arr_nth(grid,xx,yy,1);
return return_value;

}
function get_item_count(xx,yy){
var grid=obj_game.grid_cell[obj_game.grid_level];
var return_value=grid_get_arr_nth(grid,xx,yy,2);
return return_value;

}
function get_item_count_level(xx,yy,level){
var grid=obj_game.grid_cell[level];
var return_value=grid_get_arr_nth(grid,xx,yy,2);
return return_value;

}

function array_delete_last_num(array){
var h_array,array_l;
array_l=array_length(array)-1
h_array=array_create(array_l)
array_copy(h_array,0,array,0,array_l)	
return h_array;
}

function shift_items_arr_right(xx,yy,arr_pos,level){
var grid_array=ds_grid_get(obj_game.grid_cell[level],xx,yy)
var arr_l=array_length(grid_array)
while (arr_l!=arr_pos)
{
grid_array[arr_l]=grid_array[arr_l-1]
arr_l--;
}
ds_grid_set(obj_game.grid_cell[level],xx,yy,grid_array);
}
function shift_items_arr_left(xx,yy,arr_pos,level){

var grid_array=ds_grid_get(obj_game.grid_cell[level],xx,yy)
var arr_l=(array_length(grid_array)-1)
while (arr_l!=arr_pos)
{
grid_array[arr_pos]=grid_array[arr_pos+1]
arr_pos++;
}
ds_grid_set(obj_game.grid_cell[level],xx,yy,grid_array);
}

 function remove_element_from_array(array,element){
  var arr_l,h_array;
  arr_l=array_length(array);
  for (var i=0;i<arr_l;i++){
	if array[i]==element{
	h_array=shift_elements_arr_left(i,array);	
	}
  }
  return array_delete_last_num(h_array)
	 
 }

function shift_elements_arr_left(arr_pos,array){


var arr_l=(array_length(array)-1)
while (arr_l!=arr_pos)
{
array[arr_pos]=array[arr_pos+1]
arr_pos++;
}
return array
}





function find_pos_in_arr_grid(xx,yy,level,pos,pos_type){
var arr_pos,struct_count,items_count,i;
struct_count=get_structure_count_level(xx,yy,level)
items_count=get_item_count_level(xx,yy,level)
var ent_num=struct_count+items_count;
if pos_type="item"{
i=3+struct_count;
while (i<(3+(ent_num))){
var check_pos=get_itst_nth_level(xx,yy,i,level);
if check_pos==pos{
return i;
}
i++;
}
///decrement counts? solved for n-1
if pos_type="structure"{
i=3;
while (i<(3+(struct_count-1))){
var check_pos=get_itst_nth_level(xx,yy,i,level);
if check_pos==pos{
return i;
}
i++;
}
return noone;
}

return arr_pos;
}}



function combine_arrays_in_order(arr0,arr1){
var r_arr,arr0_l,arr1_l;
if is_array(arr0)&&is_array(arr1){
arr0_l=array_length(arr0)
arr1_l=array_length(arr1)
r_arr=array_create(arr0_l+arr1_l)
array_copy(r_arr,0,arr0,0,arr0_l)
array_copy(r_arr,arr0_l,arr1,0,arr1_l)
return r_arr	
}else if is_array(arr0)!=true{
return arr1;	
	
	
}
return arr0;
}

///// grid_cell data structure
//// STRING - AA|B|C|
//// AA - (0)0-99 tile type database, nothing more
//// B - count of structures, followed by a list
//// C - count of items, followed by a list of pointers? 10.10 etc?
//// ARRAY- [A][Bi][Cn][B0][B1]...[Bi][C1][C2]...[Cn] maximum length of array is 1+9+9 = |19|
//// accessing structure for B example: x=3 in array is 0+1+1+x==2+x
//// -==- for C example d=2 and x=3 for B is 2+d+x


//what we store for structures -- states (open, closed, smashed, uncovered, partially uncovered
//							   -- damage ?
//							   -- content for storage? ( neclace on statue, iron dagger on the table,
//								  skeleon in sarcophagus

///a every B is a structure type 0-99 (example: 1 - rubble, 2 - door, 3 - entrance, 4 - table)
///b every B need to store it's state, derived further from type 0-9
///c every B need to store it's damage 0-9 or 0-99
///e every B need to store it's content (pointers to items) and descriptors (what is it made of etc.)
///e every B has maximum content 0-9 so 1023 to binary
/// 

//// (aa|b|c|)
