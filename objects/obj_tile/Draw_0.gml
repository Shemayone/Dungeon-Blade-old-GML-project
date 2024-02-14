/// @description Insert description here
// You can write your code in this editor
  if tile_type!=0
 {
	
 draw_sprite_ext(sprite,sprite_ind,id.x,id.y,x_scale,y_scale,0,c_white,1)
 }
 
 if structure_count>0
 {
 if structure_count=1
 {
 draw_sprite(structure[structure_count].s_sprite,structure[structure_count].s_state+structure_highlight,id.x,id.y)	 
 }
 }
 
 
  if item_count>0
 {
   if item_count>=3
 {
 draw_sprite(item[item_count-2].i_sprite,0+item_highlight,id.x,id.y)	 
 }
  if item_count>=2
 {
 draw_sprite(item[item_count-1].i_sprite,0+item_highlight,id.x,id.y)	 
 }
  if item_count>=1
 {
 draw_sprite(item[item_count].i_sprite,0+item_highlight,id.x,id.y)	 
 }
 }
 
