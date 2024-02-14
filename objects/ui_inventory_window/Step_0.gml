/// @description Insert description here
// You can write your code in this editor
event_inherited();


var input=ui_step_element_button(exit_button);
if input=="destroy_myself"{
obj_game.inventory_screen=false;	
}

if ui_mouse_in_rect(id.x,id.y,width,height)
{
ui_step_element_slot(slot[0]);
ui_step_element_slot(slot[1]);
ui_step_element_slot(slot[2]);
ui_step_element_slot(slot[3]);
ui_step_element_slot(slot[4]);
ui_step_element_slot(slot[5]);
ui_step_element_slot(slot[6]);
ui_step_element_slot(slot[7]);
}


