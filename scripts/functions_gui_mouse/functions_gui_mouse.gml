// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_item_to_mouse(item_pointer){

var item=access_item(item_pointer)
ui_mouse_cursor.draw_to_mouse_sprite=obj_game.sprite_sheet_items_inv[item.i_type]
ui_mouse_cursor.draw_to_mouse_cursor=true	
ui_mouse_cursor.content=item_pointer;
}

function remove_entity_to_mouse(){

ui_mouse_cursor.content=noone;
ui_mouse_cursor.draw_to_mouse_cursor=false;
ui_mouse_cursor.draw_to_mouse_sprite=noone;
}

function general_drag(omni_drag){
if omni_drag=true{
if mouse_check_button(mb_left){
audio_play_sound(s_click,1,0);	
}
}
}

function ui_mouse_in_rect(x0,y0,width,height){
if point_in_rectangle(ui_mouse_cursor.gui_mouse_x,ui_mouse_cursor.gui_mouse_y,x0,y0,x0+width,y0+height){
	return true}
	
return false;
}

function ui_mouse_in_rect_action(x0,y0,width,height,mo_button){
if point_in_rectangle(ui_mouse_cursor.gui_mouse_x,ui_mouse_cursor.gui_mouse_y,x0,y0,x0+width,y0+height){
	if mouse_check_button_pressed(mo_button){
	return true}}
	
return false;
}

function ui_mouse_drag_pressed(id,x0,y0,width,height){
if ui_mouse_in_rect(x0,y0,width,height){
if mouse_check_button_pressed(mb_left){
	return true}
	}
	else return false;}

function ui_mouse_drag_released(id,x0,y0,width,height){
if ui_mouse_in_rect(x0,y0,width,height){
if mouse_check_button_released(mb_left){
	return true}
	}
	else return false;}

function check_mouse_pressed_hold_gen(){

	if mouse_check_button(mb_left){
	ui_mouse_cursor.mouse_l_pressed=true;
	return true;			
	}
	else if mouse_check_button(mb_right){
	ui_mouse_cursor.mouse_r_pressed=true;
	return true;			
	}
	else {
		if mouse_check_button_released(mb_left){
		ui_mouse_cursor.mouse_l_pressed=false;
		ui_mouse_cursor.mouse_l_released=true;
        alarm[0]=5
		}
	    if mouse_check_button_released(mb_right){
		ui_mouse_cursor.mouse_r_pressed=false;
		ui_mouse_cursor.mouse_r_released=true;
		alarm[0]=5
		}
		return false
	}	
}


function ui_mouse_send_item_back_to_id(content_origin){
with (content_origin.id){

	
}
}