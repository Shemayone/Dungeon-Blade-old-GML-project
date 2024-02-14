/// @description Insert description here
// You can write your code in this editor
///interaction box

if ui_type=1
{
ui_draw_box(spr_ui_box,id.x,id.y,ui_width,ui_height)
switch (inter_list_l){
case 0:
break;
case 1:
slot0=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,0)
break;
case 2:
slot0=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,0)
slot1=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,1)
if (draw_rect0==true){
	draw_rectangle(id.x+5,id.y+slot0,id.x+ui_width,id.y+(14),1)

	}
if (draw_rect1==true){
	draw_rectangle(id.x+5,id.y+slot1,id.x+ui_width,id.y+(slot1*2),1)
	}

break;
case 3:
slot0=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,0)
slot1=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,1)
slot2=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,2)
break;
}

}



