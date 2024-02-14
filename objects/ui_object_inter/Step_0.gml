/// @description Insert description here
// You can write your code in this editor
if created=true{
	
var new_list=ui_inter_box_initialize(inter_list,item_pointer_list,struct_pointer_list);
inter_list=new_list;
inter_list_l=array_length(inter_list);
created=false;
}
if ui_type=1&&created=false{
if ui_mouse_in_rect(id.x,id.y,ui_width,ui_height+10){ 
	mouse_entered=true;
	for (var i=0;i<inter_list_l;i++){		
	ui_inter_box_check_slot(slot,i)
	}}
else if mouse_entered=true{
instance_destroy();
obj_game.wait_for_input=false;
}else highlight=10;
}
//slot0 - id.x+5,id.y+slot0,id.x+ui_width,id.y+(14))
//slot1 - id.x+5,id.y+slot1,id.x+ui_width,id.y+(slot1*2))

if (ui_type=1&&created=false)
{
	
//if point_in_rectangle(mouse_x,mouse_y,id.x,id.y,id.x+ui_width,id.y+ui_width)
//{
//if slot[0]>0{
//if point_in_rectangle(mouse_x,mouse_y,id.x+5,id.y+slot[0],id.x+ui_width,id.y+(14)){
//	highlight=0;
//	draw_rect0=true;
//	if mouse_check_button_pressed(mb_left)
//	{
//	do_interaction(item_pointer,inter_list[0])
//	obj_game.wait_for_input=false;
//	instance_destroy();
//	slot1=0;
//	}
//	}else draw_rect0=false;
	
//	}
	
//if slot[1]>0{
//if point_in_rectangle(mouse_x,mouse_y,id.x+5,id.y+slot[0],id.x+ui_width,id.y+(slot[1]*2)){
//		highlight=1;
//		draw_rect1=true
//	if mouse_check_button_pressed(mb_left)
//	{
//	do_interaction(item_pointer,inter_list[1])
//	obj_game.wait_for_input=false;
//	instance_destroy();
//	slot[0]=0;
//	}

//	}
//	else draw_rect1=false;
//}

//if slot[2]>0{
//if point_in_rectangle(mouse_x,mouse_y,id.x+5,id.y+slot[2],id.x+ui_width,id.y+(slot[1]*3)){
//		highlight=2;
//		draw_rect1=true
//	if mouse_check_button_pressed(mb_left)
//	{
//	do_interaction(item_pointer,inter_list[1])
//	obj_game.wait_for_input=false;
//	instance_destroy();
//	slot[0]=0;
//	}
	
//	}
//	else draw_rect1=false;
//}

//}
//else highlight=10;

}



if ui_type=2 && initialize=false
{
alarm[0]=ui_timer
initialize=true;
}