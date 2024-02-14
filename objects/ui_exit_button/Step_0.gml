/// @description Insert description here
// You can write your code in this editor
if has_parent=true{
id.x=parent.x+offset_x
id.y=parent.y+offset_y
}

if ui_mouse_in_rect_action(id.x,id.y,width,height,mb_left)
{
alarm[0]=10;
image_index+=1;
audio_play_sound(s_click,1,0);
}

