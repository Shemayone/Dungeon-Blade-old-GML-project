/// @description Insert description here
// You can write your code in this editor
gui_mouse_x=0
gui_mouse_y=0
draw_to_mouse_cursor=false;
draw_to_mouse_sprite=noone;
check_release=false;
content=noone;
content_origin=noone;
on_ground=true;
in_ui=false;
gui_mouse_x=device_mouse_x_to_gui(0);
gui_mouse_y=device_mouse_y_to_gui(0);

mouse_l_released=false;
mouse_l_pressed=false;
mouse_r_released=false;
mouse_r_pressed=false;
mouse_drag=false;
mouse_click=false;
wait_for_release=false
mouse_l_pressed_once=false