/// @description Insert description here
// You can write your code in this editor
x_mouse_grid=clamp(floor((mouse_x)/32),0,99)
y_mouse_grid=clamp(floor((mouse_y)/32),0,99)
///game interaction, if ui_signal then disable


general_drag(omni_drag)
if ui_signal=false
{
check_mouse_grid(old_x_mouse_grid,old_y_mouse_grid,x_mouse_grid,y_mouse_grid,wait_for_input,id);

if selected_tile!=noone
{
if mouse_check_button_pressed(mb_right)&& (instance_exists(ui_object)!=true)
{
wait_for_input=true;
var distance=distance_pc_to_grid(obj_pc.pos_X,obj_pc.pos_Y,selected_tile.pos_X,selected_tile.pos_Y)
if distance<=1
{
var s_list=get_arrpos_struct_on_grid_cord(selected_tile.pos_X,selected_tile.pos_Y,grid_level)	
var i_list=get_arrpos_items_on_grid_cord(selected_tile.pos_X,selected_tile.pos_Y,grid_level)
var intr_box=create_interaction_box_items_structs_list(ui_mouse_cursor.gui_mouse_x,ui_mouse_cursor.gui_mouse_y,64,64,s_list,i_list,1)
}
else {
//var intr_box=create_interaction_box(mouse_x,mouse_y,64,64,selected_tile.structure[selected_tile.structure_count],0)
var s_list=get_arrpos_struct_on_grid_cord(selected_tile.pos_X,selected_tile.pos_Y,grid_level)	
var i_list=get_arrpos_items_on_grid_cord(selected_tile.pos_X,selected_tile.pos_Y,grid_level)
var intr_box=create_interaction_box_items_structs_list(ui_mouse_cursor.gui_mouse_x,ui_mouse_cursor.gui_mouse_y,64,64,s_list,i_list,0)

}
}
if (mouse_check_button_pressed(mb_left)&& (instance_exists(ui_object)!=true)&&wait_for_input=false){
if (distance_pc_to_grid(obj_pc.pos_X,obj_pc.pos_Y,selected_tile.pos_X,selected_tile.pos_Y)<=1){
	attempt_default_interaction(selected_tile.structure[selected_tile.structure_count],1)
}
if (distance_pc_to_grid(obj_pc.pos_X,obj_pc.pos_Y,selected_tile.pos_X,selected_tile.pos_Y)>=2){
	attempt_default_interaction(selected_tile.structure[selected_tile.structure_count],0)
}


}
}
}

if (keyboard_check_pressed(ord("I"))&&inventory_screen=false){
	inventory_screen=true;
} else if (keyboard_check_pressed(ord("I"))){
inventory_screen=false;	
}


if (inventory_screen=true&&inventory_screen_ini=false)
{
inventory_screen_ini=ini_inventory_screen();
}

if (inventory_screen=false&&inventory_screen_ini=true)
{
inventory_screen_ini=destroy_inventory_screen();

}

