/// @description Insert description here
// You can write your code in this editor
///interaction box

if (ui_type=1&&created=false)
{
ui_draw_box(spr_ui_box,id.x,id.y,ui_width,(inter_list_l)*20)

for (var i=0;i<inter_list_l;i++){
slot[i]=ui_draw_list_interaction_box(id.x+5,id.y+2,ui_width,ui_height,inter_list,i)	
	
}
if draw_rect=true
{
draw_rectangle(x0,y0,x1,y1,1)
}

}



