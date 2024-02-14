/// @description Insert description here
// You can write your code in this editor
draw_sprite(UI_inventory_box,0,id.x,id.y)

draw_text(id.x-20,id.y-20,ii)
ui_draw_element_button(exit_button);

for (var i=0;i<array_length(container_slot);i++){
ui_draw_element_container_slot(container_slot[i],1)	
}


///debug dump

draw_text(id.x-20,id.y-80,"move_to_high:" + string(move_to_highlight))
draw_text(id.x-20,id.y-40,"to_high:" + string(to_highlight))
if selected_slot!=noone{
draw_text(id.x+20,id.y-20,"sl:" + string(selected_slot.slot_num));
if highlight_arr!=noone{
draw_text(id.x+120,id.y-20,"h_r_l:" + string(array_length(highlight_arr)))
}
}
