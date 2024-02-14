/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
owner=obj_pc
default_sprite=UI_inventory_box;
width=320;
height=480;
sprite_scale_x=sprite_get_width(default_sprite)/width;
sprite_scale_y=sprite_get_height(default_sprite)/height;
element_dragged=false;
inventory_cap =8
item_dragged=false
my_purpose="inventory"
exit_button=ui_make_element_button(width-18,2,"exit_b",id);
var inv_offset_x=32+2
var inv_offset_y=32+2
slot[0]=ui_make_element_slot((width-((width*0.25)+32)),(height-(height*0.7)),"inventory",0,id)	
slot[1]=ui_make_element_slot(width-((width*0.5)+32),(height-(height*0.9)),"inventory",1,id)	
slot[2]=ui_make_element_slot((width-((width*0.5)+32)),(height-(height*0.7)),"inventory",2,id)	
slot[3]=ui_make_element_slot((width-((width*0.75)+32)),(height-(height*0.4)),"inventory",3,id)	
slot[4]=ui_make_element_slot((width-((width*0.75)+32)),(height-(height*0.7)),"inventory",4,id)	
slot[5]=ui_make_element_slot((width-((width*0.25)+32)),(height-(height*0.4)),"inventory",5,id)	
slot[6]=ui_make_element_slot((width-((width*0.5)+32)),(height-(height*0.5)),"inventory",6,id)	
slot[7]=ui_make_element_slot((width-((width*0.5)+32)),(height-(height*0.3)),"inventory",7,id)	

slot[0].content=owner.char_slot[0]
slot[1].content=owner.char_slot[1]
slot[2].content=owner.char_slot[2]
slot[3].content=owner.char_slot[3]
slot[4].content=owner.char_slot[4]
slot[5].content=owner.char_slot[5]
slot[6].content=owner.char_slot[6]
slot[7].content=owner.char_slot[7]
///test


          
		