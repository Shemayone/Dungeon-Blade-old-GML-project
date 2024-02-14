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



if (selected_slot!=old_selected_slot){
//item is not dragged, no highlight have been made
old_selected_slot.targeted=false
selected_slot.targeted=true
old_selected_slot=selected_slot;
if item_dragged=true{ 
	if ui_mouse_cursor.content==noone{
	item_dragged=false;	
	}
	else{
	if highlight_arr!=noone{
	ui_container_remove_highlight_item_from_slot_array(highlight_arr);	
	}
	highlight_arr=ui_container_find_item_grid_relative_to_sel_slot(ui_mouse_cursor,selected_slot,container_slot,container_grid);
	var arr=get_item_to_inventory_size(access_item(ui_mouse_cursor.content))
	var item_size=arr[0]*arr[1]
	var arr_size=array_length(highlight_arr)
	if arr_size==item_size{
	item_check=false
	}else{item_check=true;}
    colission_check=ui_container_find_if_item_slot_to_array_true(highlight_arr,ui_mouse_cursor.content)
	if colission_check==false &&item_check==false{
    ui_container_apply_highlight_item_from_slot_array(highlight_arr,1);
	ready_to_insert=true;
	}
	else
	{
		audio_play_sound(s_click,1,0)
	ui_container_apply_highlight_item_from_slot_array(highlight_arr,2);	
	ready_to_insert=false;
	}
}}

}
if ui_mouse_in_rect(id.x+offset_x,id.y+offset_y,container_width*slot_width,container_height*slot_height){
 dragable=false	
 ui_mouse_cursor.in_ui=true;
 mouse_pos_x=floor((ui_mouse_cursor.gui_mouse_x-(id.x+offset_x))/slot_width)
 mouse_pos_y=floor((ui_mouse_cursor.gui_mouse_y-(id.y+offset_y))/slot_height)
 var i_offset=(mouse_pos_x*container_height)
 ii=clamp(mouse_pos_y + i_offset,0,array_length(container_slot)-1)
 selected_slot=container_slot[ii]
 if ui_mouse_cursor.mouse_drag=true && item_dragged=false{
	if ui_mouse_cursor.content==noone{ //if dragged not from outside
	var starting_slot=selected_slot.content
	var item_in_cont=ui_container_find_item_slot_to_array(starting_slot,container_slot)
	if item_in_cont[0].content>0{
	highlight_arr=item_in_cont;
	ui_container_apply_highlight_item_from_slot_array(highlight_arr,1)
	apply_item_to_mouse(item_in_cont[0].content)
	ui_mouse_cursor.content_origin=item_in_cont[0];
	var arr2=get_item_to_inventory_size(access_item(selected_slot.content))
	ui_container_clear_from_item(item_in_cont); //deletes it from container_window
    remove_item_from_container(container_grid,item_in_cont[0].xx,item_in_cont[0].yy,arr2[0],arr2[1])
   //deletes it from ds_grid
	refresh_c_grid=true
	item_dragged=true;
	}}
	if ui_mouse_cursor.content!=noone{
	item_dragged=true;		
	}
	}
    ////droppping item
 if ui_mouse_cursor.mouse_l_released=true&&item_dragged=true{
 if ready_to_insert=true{
	var arr2=get_item_to_inventory_size(access_item(ui_mouse_cursor.content))
	add_item_to_container_apply_item_pos(container_grid,highlight_arr[0].xx,highlight_arr[0].yy,arr2[0],arr2[1],ui_mouse_cursor.content) 
	refresh_c_grid=true
	ui_container_remove_highlight_item_from_slot_array(highlight_arr)
	ui_mouse_cursor.mouse_l_released=false
	remove_entity_to_mouse();
	item_dragged=false;
	ui_mouse_cursor.mouse_drag=false;
 }
 if ready_to_insert=false && item_dragged=true{
ui_mouse_cursor.content_origin.content=ui_mouse_cursor.content;
if ui_mouse_cursor.content_origin.parent_id==id{
ui_container_return_item_to_grid(id,ui_mouse_cursor.content_origin,ui_mouse_cursor.content);
ui_container_remove_highlight_item_from_slot_array(highlight_arr)
}
ui_mouse_cursor.mouse_l_released=false;
ui_mouse_cursor.mouse_drag=false;
remove_entity_to_mouse();
audio_play_sound(s_click,1,0) 
	 

 }
	 
 }
}
else
{dragable=true}

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