/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if created=false{	
//ui_container_creation_event(id)
	var i=0
arr_items[0]=0;
arr_items_num=0;
container_width = ds_grid_width(container_grid);
container_height = ds_grid_height(container_grid);
for (var xx=0;xx<container_width;xx++){for (var yy=0;yy<container_height;yy++){
var item_num=ui_container_read_grid_cord(xx,yy,container_grid,arr_items)
if item_num!=false{
arr_items_num=+1;
arr_items[arr_items_num]=item_num
container_slot[i]=ui_make_element_container_slot(xx,yy,item_num,i,true,id)
}
else{
item_num=ds_grid_get(container_grid,xx,yy)
container_slot[i]=ui_make_element_container_slot(xx,yy,item_num,i,false,id)
}
i++;		
}}	
refresh_c_grid=true;
selected_slot=container_slot[0];
old_selected_slot=container_slot[0];
created=true;	
}



if (selected_slot!=old_selected_slot)&&highlight_arr==noone{
//item is not dragged, no highlight have been made
old_selected_slot.targeted=false
selected_slot.targeted=true
old_selected_slot=selected_slot;


}
else if ((selected_slot!=old_selected_slot)&&(highlight_arr=!noone)){

audio_play_sound(s_click,1,0);
//ui_container_remove_highlight_item_from_slot_array(highlight_arr)
old_selected_slot.targeted=false
selected_slot.targeted=true
old_selected_slot=selected_slot;
if selected_slot.content!=highlight_arr[0].content{
ui_container_remove_highlight_item_from_slot_array(highlight_arr)
highlight_arr=ui_container_find_item_slot_to_array(selected_slot.content,container_slot) 
 ui_container_apply_highlight_item_from_slot_array(highlight_arr,1)
}


//ui_container_apply_highlight_item_from_slot_array(highlight_arr,1)
}
else if((selected_slot!=old_selected_slot)&&move_to_highlight=true){
/// item is dragged!
if move_highlight_arr!=noone{
ui_container_remove_highlight_item_from_slot_array(move_highlight_arr)
ui_container_remove_highlight_item_from_slot_array(highlight_arr)
}
old_selected_slot.targeted=false
selected_slot.targeted=true
move_highlight_arr=ui_container_find_item_grid_relative_to_content(highlight_arr[0].content,selected_slot,container_slot,container_grid)
colission_check=ui_container_find_if_item_slot_to_array_true(move_highlight_arr,highlight_arr[0])

var arr=get_item_to_inventory_size(access_item(highlight_arr[0].content))
var item_size=arr[0]*arr[1]
var arr_size=array_length(move_highlight_arr)
if arr_size==item_size{
item_check=false
}else{item_check=true;}
if colission_check=false&&item_check=false{
ui_container_apply_highlight_item_from_slot_array(move_highlight_arr,1) 
ready_to_insert=true;
}
else {
ui_container_apply_highlight_item_from_slot_array(move_highlight_arr,2) 
ready_to_insert=false;
}

	

old_selected_slot=selected_slot;
}






if keyboard_check_pressed(ord("U")){
refresh_c_grid=true;
}

if ui_mouse_in_rect(id.x+offset_x,id.y+offset_y,container_width*16,container_height*16){
 dragable=false	
 mouse_pos_x=floor((ui_mouse_cursor.gui_mouse_x-(id.x+offset_x))/16)
 mouse_pos_y=floor((ui_mouse_cursor.gui_mouse_y-(id.y+offset_y))/16)
 var i_offset=(mouse_pos_x*container_height)
 ii=clamp(mouse_pos_y + i_offset,0,array_length(container_slot)-1)
 selected_slot=container_slot[ii]
 ///draggging boject
 if ui_mouse_cursor.draw_to_mouse_cursor=!true{
 if selected_slot.content>0{
 //old_selected_slot.targeted=false;
 if to_highlight=true{
 highlight_arr=ui_container_find_item_slot_to_array(selected_slot.content,container_slot) 
 ui_container_apply_highlight_item_from_slot_array(highlight_arr,1)
// audio_play_sound(sword_clink_0,1,0)
 to_highlight=false
 }
 }
 else{
	 if move_to_highlight==false{
//if highlight_arr!=noone{	 
//ui_container_remove_highlight_item_from_slot_array(highlight_arr)
//}
highlight_arr=noone;
to_highlight=true
 }}
 }
 
 if ui_mouse_cursor.draw_to_mouse_cursor==true{

	var col_num=1;
colission_check=ui_container_find_if_item_slot_to_array_true(move_highlight_arr,ui_mouse_cursor.content)
if colission_check==true{
col_num=2;	
}
var arr=get_item_to_inventory_size(access_item(ui_mouse_cursor.content))
var item_size=arr[0]*arr[1]
var arr_size=array_length(move_highlight_arr)	
ui_container_remove_highlight_item_from_slot_array(move_highlight_arr,1)	
move_highlight_arr=ui_container_find_item_grid_relative_to_content(ui_mouse_cursor.content,selected_slot,container_slot,container_grid)
ui_container_apply_highlight_item_from_slot_array(move_highlight_arr,col_num)	
if col_num=1
{ ready_to_insert_from_mouse=true;}



 }
 if (check_mouse_pressed_hold(id.x+offset_x,id.y+offset_y,container_width*16,container_height*16)){
	 if ui_mouse_cursor.draw_to_mouse_cursor=!true{
	 if highlight_arr!=noone{
		 if highlight_arr[0]==0{
		var test	 
		 }
	 	apply_item_to_mouse(highlight_arr[0].content) 
		dragged=true;
		move_to_highlight=true;
	 } 
 }}
 else{
 if ui_mouse_cursor.draw_to_mouse_cursor=true{	 
 remove_entity_to_mouse(); 
 if move_highlight_arr!=noone{
 ui_container_remove_highlight_item_from_slot_array(move_highlight_arr)
 move_to_highlight=false;
 }}
 if ready_to_insert=true{
 var arr2;
 audio_play_sound(s_click,1,0); 
 if highlight_arr!=noone{
	 	
 //ui_container_m_f_drop_item_to_slot(container_grid,highlight_arr,move_highlight_arr,arr2,arr_items,id)
 arr2=get_item_to_inventory_size(access_item(highlight_arr[0].content))
 var original_hi_arr_content=highlight_arr[0].content
 remove_item_from_container(container_grid,highlight_arr[0].xx,highlight_arr[0].yy,arr2[0],arr2[1])
 add_item_to_container_apply_item_pos(container_grid,move_highlight_arr[0].xx,move_highlight_arr[0].yy,arr2[0],arr2[1],original_hi_arr_content)
 ui_container_clear_from_item(highlight_arr);
 arr_items=remove_element_from_array(arr_items,highlight_arr[0].content);
 ui_container_refresh_grid(container_grid,id);
 highlight_arr=noone;
 to_highlight=true;
 ready_to_insert=false;
 ready_to_insert_from_mouse=false;
 }
 
 }
 }
 if ready_to_insert_from_mouse=true{
 arr2=get_item_to_inventory_size(ui_mouse_cursor.content);	 
var origin_content=ui_mouse_cursor.content
add_item_to_container_apply_item_pos(container_grid,move_highlight_arr[0].xx,move_highlight_arr[0].yy,arr2[0],arr2[1],origin_content)
ui_mouse_cursor.content_origin=noone;
 highlight_arr=noone;
 to_highlight=true;
 ready_to_insert=false;
 ready_to_insert_from_mouse=false;
}}
else {
	dragable=true
	}



input=ui_step_element_button(exit_button);

if refresh_c_grid=true
{
ui_container_refresh_grid(container_grid,id);
refresh_c_grid=false;
}

if input=="destroy_myself"{
	
instance_destroy();
obj_game.ui_signal=false;
}