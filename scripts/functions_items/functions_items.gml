// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function functions_items(){

}

function ini_items_ds(length){
var items_grid=ds_grid_create(length,1)
return items_grid;
}

function access_item(pos){
var structure=ds_grid_get(obj_game.item_grid,pos,0)
return structure;
}

function ini_item(xx,yy,level,type,stats,inv_cord){
var pos=obj_game.item_grid_pos
var item = {
	identity: 1,
	i_type : type,
	i_stats : stats,
	i_pos : pos,
	i_sprite : obj_game.sprite_sheet_items[type],
	i_level : level,
	i_description : "",
	i_inv_slot : "all",
	i_def : 0,
	str_cord : string(xx)+"."+string(yy),
	inventory_cord : inv_cord,
	i_state : "default"
}
ds_grid_set(obj_game.item_grid,pos,0,item)
obj_game.item_grid_pos+=1;
return pos;
}

function ini_item_stats(type,pos){
///stats are a list of values determining what kind of object it is defined by type.	
	
	
	
}

function item_build_interaction_list_by_type_state(type,state){
var return_noarray;
return_noarray="Take"
return return_noarray
}




function make_item(xx,yy,level,type,stats,inv_cord){
var item=ini_item(xx,yy,level,type,stats,inv_cord)
//var test=add_item_to_grid(xx,yy,level,item)
return item;

}





///da se narozdil od structures zjednodusit.. pozdeji
function add_item_to_grid(xx,yy,level,pos){
var struct_count,items_count,arr_pos;
struct_count=get_structure_count_level(xx,yy,level)
items_count=get_item_count_level(xx,yy,level)
if (items_count!=9 && struct_count==0){
arr_pos=3+items_count
set_itst_nth_level(xx,yy,arr_pos,pos,level)	
items_count+=1;
set_items_count_level(xx,yy,items_count,level)
var item=access_item(pos)
item.str_cord=string(xx)+"."+string(yy)
return true
}
if (struct_count>0 &&items_count!=9){
arr_pos=3+struct_count+items_count
//shift_items_arr_right(xx,yy,arr_pos,level)
set_itst_nth_level(xx,yy,arr_pos,pos,level)	
items_count+=1;
set_items_count_level(xx,yy,items_count,level)
var item=access_item(pos)
item.str_cord=string(xx)+"."+string(yy)
return true
}
return false;
	
}


function get_item_to_inventory_size(item){
var cord_num=item.inventory_cord;
var r_array;
if cord_num<10{
r_array[0]=cord_num
r_array[1]=cord_num
return r_array;
}
if cord_num<100{
var h_num=cord_num mod 10;	
r_array[0]=(cord_num-h_num)/10
r_array[1]=h_num;
return r_array	
}
	
}


function add_item_to_container_search_for_room(cont_grid,xx,yy,item_x,item_y){
var x0,x1,y0,y1;

x0=xx
x1=xx+item_x
y0=yy
y1=yy+item_y
for (var xxx=x0;xxx<x1;xxx++){for (var yyy=y0;yyy<y1;yyy++){
var grid_value=ds_grid_get(cont_grid,xxx,yyy)
if grid_value!=0
{return false}
}}
return true;
}

function add_item_to_container_apply_item_pos(cont_grid,xx,yy,item_x,item_y,item_pointer){
var x0,x1,y0,y1;

x0=xx
x1=xx+item_x
y0=yy
y1=yy+item_y
for (var xxx=x0;xxx<x1;xxx++){for (var yyy=y0;yyy<y1;yyy++){
ds_grid_set(cont_grid,xxx,yyy,item_pointer)

}}
return true;
}

function add_item_to_container(container, item_pointer){
// ini container and its dimensions
var cont_grid=container;
var cont_grid_w=ds_grid_width(cont_grid);
var cont_grid_h=ds_grid_height(cont_grid);
/// find item dimension in inventory size
var item=access_item(item_pointer)
var h_array=get_item_to_inventory_size(item)
var item_x=h_array[0];
var item_y=h_array[1];
for (var xx=0;xx<cont_grid_w;xx++){for (var yy=0;yy<cont_grid_h;yy++){
var grid_value=ds_grid_get(cont_grid,xx,yy)
if grid_value==0{
	if (add_item_to_container_search_for_room(cont_grid,xx,yy,item_x,item_y))
	{
	add_item_to_container_apply_item_pos(cont_grid,xx,yy,item_x,item_y,item_pointer);
	return true;
	}
	
	
}
}}
return false;
}

function add_item_to_inventory(actor, item){
	
	
}

function resize_array(array,num){
var h_array=0	
	
}

function delete_item_from_grid(xx,yy,level,item){
var struct_count,items_count,arr_pos,final_array;
struct_count=get_structure_count_level(xx,yy,level)
items_count=get_item_count_level(xx,yy,level)
arr_pos=find_pos_in_arr_grid(xx,yy,level,item,"item")
if arr_pos!=noone{
set_itst_nth_level(xx,yy,arr_pos,noone,level);
if (items_count>1){
var i=items_count-1;
shift_items_arr_left(xx,yy,arr_pos,level);	

}
set_items_count_level(xx,yy,items_count-1,level)
var grid_array=ds_grid_get(obj_game.grid_cell[level],xx,yy)
final_array=array_delete_last_num(grid_array)
ds_grid_set(obj_game.grid_cell[level],xx,yy,final_array)
}
refresh_grid_tile(xx,yy);
}

function delete_item_from_container(structure, item){
	
}

function delete_item_from_inventory(actor, item){

}

function signify_item_to_mouse(item){
// we assume that grabbing action is done
//caller should be actor or game

}

function item_read_inter_string(inter){
var str_l=string_length(inter)	
var char_at;
var test_str="";
for (var i=1;i<str_l;i++){
char_at=string_char_at(inter,i)
test_str=test_str + char_at;
if test_str=="Take"{
return test_str;	
}
}
	
}

function apply_change_to_item(item,interaction){
var inter;
inter=item_read_inter_string(interaction)
switch (inter){
case "Take":
var pc_container_pointer=access_item(obj_pc.char_slot[3]);
add_item_to_container(obj_game.container_grid[pc_container_pointer.i_def],item.i_pos)
if instance_exists(ui_container_window){
ui_container_window.refresh_c_grid=true	
}
var h_arr=scr_return_cord_handle_str(item.str_cord)
delete_item_from_grid(h_arr[0],h_arr[1],obj_game.grid_level,item.i_pos)
}
}


///type 0 - valuables
///type 1 - armour
///type 2 - weapons
///type 3 - usables

////stats per type -
//// 0 - (