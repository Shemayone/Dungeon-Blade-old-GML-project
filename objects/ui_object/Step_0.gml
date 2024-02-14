/// @description Insert description here
// You can write your code in this editor
audio_play_sound(s_click,1,0)
if ui_type=1
{
if point_in_rectangle(mouse_x,mouse_y,id.x,id.y,id.x+ui_width,id.y+ui_width)
{
if slot0>0{
if point_in_rectangle(mouse_x,mouse_y,id.x+5,id.y+slot0,id.x+ui_width,id.y+(14)){
	highlight=0;
	draw_rect0=true;
	if mouse_check_button_pressed(mb_left)
	{
	do_interaction(item_pointer,inter_list[0])
	obj_game.wait_for_input=false;
	instance_destroy();
	slot1=0;
	}
	}else draw_rect0=false;
	
	}
	
if slot1>0{
if point_in_rectangle(mouse_x,mouse_y,id.x+5,id.y+slot1,id.x+ui_width,id.y+(slot1*2)){
		highlight=1;
		draw_rect1=true
	if mouse_check_button_pressed(mb_left)
	{
	do_interaction(item_pointer,inter_list[1])
	obj_game.wait_for_input=false;
	instance_destroy();
	slot0=0;
	}
	
	}
	else draw_rect1=false;
}

}
else highlight=10;

}

if ui_type=2 && initialize=false
{
alarm[0]=ui_timer
initialize=true;
}