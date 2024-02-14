/// @description Insert description here
// You can write your code in this editor
gui_mouse_x=device_mouse_x_to_gui(0);
gui_mouse_y=device_mouse_y_to_gui(0);
check_mouse_pressed_hold_gen();
if (mouse_l_pressed=true && mouse_click=false){
	mouse_click=true;	
	mouse_l_pressed_once=true
	alarm[0]=5
}

if  (ui_mouse_cursor.mouse_l_pressed==false && ui_mouse_cursor.mouse_l_released=true){
    mouse_click=false;	
}
if ui_mouse_cursor.mouse_l_released=true{
if mouse_drag=true{
if on_ground=true && content!=noone && in_ui==false{
add_item_to_grid(obj_pc.pos_X,obj_pc.pos_Y,obj_game.grid_level,content)	
refresh_grid_tile(obj_pc.pos_X,obj_pc.pos_Y);
ui_mouse_cursor.mouse_l_released=false;
ui_mouse_cursor.mouse_drag=false;
remove_entity_to_mouse();
}
	
}
if on_ground=true
{
ui_mouse_cursor.mouse_l_released=false;
if mouse_drag=true {mouse_drag=false}
}


}




if check_release=true
{
if mouse_check_button_released(mb_left){
var do_stuff=true	
if on_ground=true{

add_item_to_grid(obj_pc.pos_X,obj_pc.pos_Y,obj_game.grid_level,content)	
//remove_item_from_inventory
refresh_grid_tile(obj_pc.pos_X,obj_pc.pos_Y);
}
if (on_ground=false && in_ui=true && ui_mouse_cursor.content_origin!=noone){
var pointer_slot=ui_mouse_cursor.content_origin
pointer_slot.content=ui_mouse_cursor.content;
mouse_released=true;
}


check_release=false;
}

}