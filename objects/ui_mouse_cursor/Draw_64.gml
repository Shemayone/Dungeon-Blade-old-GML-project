/// @description Insert description here
// You can write your code in this editor

if obj_game.ui_signal=true{
on_ground=false;
in_ui=true;
}
else
{
on_ground=true;
in_ui=false;	
}
if draw_to_mouse_cursor=true
{	
draw_sprite_ext(draw_to_mouse_sprite,0,gui_mouse_x-20,gui_mouse_y-(sprite_get_height(draw_to_mouse_sprite)),2,2,0,c_white,0.5)	
}

draw_sprite(sprite_index,0,gui_mouse_x,gui_mouse_y)


draw_text(gui_mouse_x,gui_mouse_y,"on_ground:"+ string(on_ground)+ "ui:" + string(in_ui)+ "left_m_rel:" + string(mouse_l_released))