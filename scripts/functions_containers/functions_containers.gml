// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function ini_container_screen(xx,yy,fixed_to,content_pointer){
if instance_exists(ui_container_window){
return false	
}
else{
	if fixed_to==noone{
instance_create_layer(xx+20,yy+20,"UI",ui_container_window);
	}
	else{	
var window=instance_create_layer(fixed_to.x-400,fixed_to.y,"UI",ui_container_window);	
    window.fixed=false;
	var container=(access_item(content_pointer)).i_def
    var container_grid=obj_game.container_grid[container]
	window.container_grid=container_grid;
	}
return true;
	
	
}
}

function destroy_container_screen(){
if instance_exists(ui_container_window){
obj_game.ui_signal=false;	
instance_destroy(ui_container_window);

return false;
}
}

function ui_open_container(xx,yy,parent,container_type,container_pointer){
	
	
}

function check_if_value_in_recursive_list(value_checked,list_compare,num,value_return){
var r_array, list_l;
list_l=array_length(list_compare)-1
if list_l>=num{

if value_checked!=list_compare[num]{
return check_if_value_in_recursive_list(value_checked,list_compare,num+1,value_return);	
}
else{
value_return=true;
}
}

return value_return;
}

function ui_container_refresh_grid(container_grid,iid){
var container_width,container_height,i=0;
container_width=ds_grid_width(container_grid);
container_height=ds_grid_height(container_grid);
var new_items;
new_items[0]=0
arr_items=new_items
for (var xx=0;xx<container_width;xx++){for (var yy=0;yy<container_height;yy++){
container_slot[i].content=ds_grid_get(container_grid,xx,yy)	
var item_num=ui_container_read_grid_cord(xx,yy,container_grid,arr_items)
if item_num!=false{
arr_items_num=+1;
arr_items[arr_items_num]=item_num
container_slot[i].content_origin=true
var point_to_item=access_item(container_slot[i].content)
container_slot[i].image=obj_game.sprite_sheet_items_inv[point_to_item.i_type]
	
}		
	

i++;	
}}}

function ui_container_read_grid_cord(xx,yy,container_grid,arr_items){
var item_num=ds_grid_get(container_grid,xx,yy)
var item_check=(check_if_value_in_recursive_list(item_num,arr_items,0,false))
if (item_check)==false {
return item_num;	
}
else return false;

	
}

function ui_make_element_container_slot(x_cord,y_cord,item_num,slot_num,cont_origin,par_id){
	var slot ={
	xx : x_cord,
	yy : y_cord,
	parent_id : par_id,
	content : item_num,
	content_origin : cont_origin,
	image: noone,
	targeted : false,
	subimg : 0,
	slot_num : slot_num
	}
	if slot.content_origin=true{
	var point_to_item=access_item(item_num)
	slot.image=obj_game.sprite_sheet_items_inv[point_to_item.i_type]
	}
	return slot;
}

function ui_container_find_item_grid_relative_to_sel_slot(content_num,sel_slot,slot_array,container_grid){
var item=access_item(content_num.content)
var return_array,i=0;
var h_arr=get_item_to_inventory_size(item)
var x_cord=h_arr[0]+sel_slot.xx,y_cord=h_arr[1]+sel_slot.yy;
for (var xx=sel_slot.xx;xx<x_cord;xx++){for (var yy=sel_slot.yy;yy<y_cord;yy++){
	if xx<ds_grid_width(container_grid)&&yy<ds_grid_height(container_grid){
	return_array[i]=slot_array[ui_container_cord_to_i(xx,yy,slot_array,container_grid)];
	
	i++;}
}}

return return_array;
}

function ui_container_find_item_grid_relative_to_content(content,sel_slot,slot_array,container_grid){
var item=access_item(content)
var return_array,i=0;
var h_arr=get_item_to_inventory_size(item)
var x_cord=h_arr[0]+sel_slot.xx,y_cord=h_arr[1]+sel_slot.yy;
for (var xx=sel_slot.xx;xx<x_cord;xx++){for (var yy=sel_slot.yy;yy<y_cord;yy++){
	if xx<ds_grid_width(container_grid)&&yy<ds_grid_height(container_grid){
	return_array[i]=slot_array[ui_container_cord_to_i(xx,yy,slot_array,container_grid)];
	
	i++;}
}}

return return_array;
}

function ui_container_cord_to_i(x_cord,y_cord,slot_arr,container_grid){
var container_height=ds_grid_height(container_grid)
var i_offset=(x_cord*container_height)
var ii=clamp(y_cord + i_offset,0,array_length(slot_arr)-1)
return ii;
}

function ui_container_find_item_slot_to_array(content_num,slot_grid){
	var h_array, array_l,t=0;
	array_l=array_length(slot_grid);
for (var i=0;i<array_l;i++){
if content_num==slot_grid[i].content{
	h_array[t]=slot_grid[i]	
	t++;
}
}
return h_array;	
}

function ui_container_find_if_item_slot_to_array_true(slot_arr,slot_me_content){
	var array_l;
	var check_if_me=slot_me_content
	array_l=array_length(slot_arr);
for (var i=0;i<array_l;i++){
if (0<slot_arr[i].content){
	if (slot_arr[i].content!=check_if_me){
	return true;
	}
}
}
return false
}

function ui_container_apply_highlight_item_from_slot_array(slot_array,subimg){
for (var i=0;i<array_length(slot_array);i++){
slot_array[i].targeted=subimg;
slot_array[i].subimg=subimg;
}

}
function ui_container_remove_highlight_item_from_slot_array(slot_array){
for (var i=0;i<array_length(slot_array);i++){
slot_array[i].targeted=false;
}
}
function ui_container_clear_from_item(slot_array){
for (var i=0;i<array_length(slot_array);i++){
slot_array[i].targeted=false;
slot_array[i].content_origin=false
slot_array[i].content=0;
}}


function remove_item_from_container(container_grid,xx,yy,item_x,item_y){
var x0,x1,y0,y1;

x0=xx
x1=xx+item_x
y0=yy
y1=yy+item_y
for (var xxx=x0;xxx<x1;xxx++){for (var yyy=y0;yyy<y1;yyy++){
ds_grid_set(container_grid,xxx,yyy,0)


}}
return true;
}

function ui_draw_element_container_slot(slot,subimg){
slot.subimg=slot.targeted;
draw_sprite(UI_cont_slots,slot.subimg,slot.parent_id.x+slot.parent_id.offset_x+(slot.xx*(slot.parent_id.slot_width)),slot.parent_id.y+slot.parent_id.offset_y+(slot.yy*(slot.parent_id.slot_height)))
draw_text(slot.parent_id.x+slot.parent_id.offset_x+(slot.xx*(slot.parent_id.slot_height))-2,slot.parent_id.y+slot.parent_id.offset_y+(slot.yy*(slot.parent_id.slot_width)),slot.content)
if slot.content_origin!=false&& slot.content!=0{
var get_item_size=get_item_to_inventory_size(access_item(slot.content))
var image_scale=((get_item_size[0]*(slot.parent_id.slot_width))/sprite_get_width(slot.image))
draw_sprite_ext(slot.image,0,slot.parent_id.x+slot.parent_id.offset_x+(slot.xx*(slot.parent_id.slot_height)),slot.parent_id.y+slot.parent_id.offset_y+(slot.yy*(slot.parent_id.slot_height)),image_scale,image_scale,0,c_white,1)
}
}

function ui_ini_container(container_type,container_pointer){
	var c_width,c_height;
if container_type="structure"{
	var structure=access_structure(container_pointer)
	if structure.s_type=2{///default chest
	c_width=8;
	c_height=6;
	var container=ds_grid_create(c_width,c_height);
	obj_game.container_grid[container_grid_pos]=container;
	obj_game.container_grid_pos+=1;
	return container_grid_pos-1;
}}
if container_type="item"{
var item=access_item(container_pointer);
if item.i_type==3{///default bag
	c_width=6;
	c_height=5;
	var container=ds_grid_create(c_width,c_height);
	obj_game.container_grid[container_grid_pos]=container;
	obj_game.container_grid_pos+=1;
	return container_grid_pos-1;
}
}

}

function  ui_container_return_item_to_grid(my_id,slot_0,item_pointer){
with(my_id){
var arr2=get_item_to_inventory_size(access_item(item_pointer))
var slot_origin=slot_0;
add_item_to_container_apply_item_pos(container_grid,slot_origin.xx,slot_origin.yy,arr2[0],arr2[1],item_pointer) 	
refresh_c_grid=true	
}
}