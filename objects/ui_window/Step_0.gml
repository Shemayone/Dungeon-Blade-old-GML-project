/// @description Insert description here
// You can write your code in this editor


/// is dragable..how to make this a goddamn function?
if ui_signal=true&&signal_sent=false{ // if mouse over ui object
obj_game.ui_signal=true;
signal_sent=true;
}
if ui_signal=false&&signal_sent=true{
obj_game.ui_signal=false;
signal_sent=false;
}
if fixed==true{
dragable=false;	
var offset= fixed_to.x + (fixed_to_offset_x)
id.x=fixed_to.x
id.y=fixed_to.y
}

if dragable=true{


var mouse_test_pressed;
var mouse_test_released;
mouse_test_pressed=ui_mouse_drag_pressed(id,id.x,id.y,width,height);
mouse_test_released=ui_mouse_drag_released(id,id.x,id.y,width,height);
if ui_mouse_in_rect(id.x,id.y,width,height){
if ((ui_mouse_cursor.mouse_drag=true)&&drag_on=false&&ui_mouse_cursor.content==noone)
{
drag_on=true;	
last_mos_x=ui_mouse_cursor.gui_mouse_x;
last_mos_y=ui_mouse_cursor.gui_mouse_y;
last_pos_x=id.x;
last_pos_y=id.y;

}
if ((ui_mouse_cursor.mouse_drag!=true))
{
drag_on=false;

}

if drag_on=true{
drag_x=last_pos_x-(last_mos_x-ui_mouse_cursor.gui_mouse_x);
drag_y=last_pos_y-(last_mos_y-ui_mouse_cursor.gui_mouse_y);
id.x=(drag_x);
id.y=(drag_y);

}
else{
drag_x=0;
drag_y=0;
drag_on=false;
}

} }///is dragable
if ui_mouse_in_rect(id.x,id.y,width,height)==true{
ui_signal=true;

} else 
{ui_signal=false

}


