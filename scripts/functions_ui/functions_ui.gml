// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


////lowe level initialization of filled box

function ui_ini_box(xx,yy,width,height){
var box= instance_create_layer(xx,yy,"UI",ui_object)
box.ui_type=1;
box.ui_width=width
box.ui_height=height
return box
}
function ui_ini_box_inter(xx,yy,width,height){
var box= instance_create_layer(xx,yy,"UI",ui_object_inter)
box.ui_type=1;
box.ui_width=width
box.ui_height=height
return box
}

function ui_interaction_box_get_list(pos,dist){
var return_array;
if dist=0{
return_array=build_interaction_list_by_type_state(pos.s_type,pos.s_state)
return array_create(1,return_array[0]);
}
if dist=1{
return_array=build_interaction_list_by_type_state(pos.s_type,pos.s_state)
return return_array
}
}

function ui_interaction_box_get_list_items(i_array,distance){
var r_array,arr_l;
if i_array==0{
return noone;	
}
arr_l=array_length(i_array);
for (var i=0;i<arr_l;i++){
r_array[i]=item_build_interaction_list_by_type_state(i_array[i],0) + string(access_item(i_array[i]).i_description)
}
return r_array;
}

function ui_interaction_box_get_list_structure(s_array,distance){
var r_array,arr_l;
if s_array==0{
return noone;	
}
arr_l=array_length(s_array);
for (var i=0;i<arr_l;i++){
	var current_struct=access_structure(s_array[i]);
r_array[i]=build_interaction_list_by_type_state(current_struct.s_type,current_struct.s_state)
}
return r_array;
}

function create_interaction_box(xx,yy,width,height,item,dist){
var list=ui_interaction_box_get_list(item,dist)
var def_height=18
var arr_l=array_length(list)
var box=ui_ini_box_inter(xx,yy,width,def_height*arr_l)
box.inter_list=list;
box.inter_list_l=arr_l;
box.item_pointer=item;
return box
}

function create_interaction_box_items_structs_list(xx,yy,width,height,s_list,i_list,dist){
	var i_int_list, s_int_list;
i_int_list=ui_interaction_box_get_list_items(i_list,dist)
///take helmet
///take armour
///take torch
s_int_list=ui_interaction_box_get_list_structure(s_list,dist)
///
var def_height=18
var all_list=combine_arrays_in_order(s_int_list,i_int_list);
var arr_l=array_length(all_list)
var box=ui_ini_box_inter(xx,yy,width,def_height*arr_l)
box.inter_list=all_list;
box.inter_list_l=arr_l;
box.item_pointer_list=i_list;
box.struct_pointer_list=s_list;
return box
}

function ui_inter_box_initialize(inter_list,item_pointer_list,struct_pointer_list){
	var final_inter_list,i=0,struct_exist=0;
	if is_array(struct_pointer_list){
	var s_list_l=array_length(inter_list[0])
	while (i<s_list_l){
		final_inter_list[i]=inter_list[0][i];
		i++;
	}
	
	struct_exist=1;
	id.struct_is=true;
	id.struct_list_l=i
	}
	if (array_length(item_pointer_list)>1){
	/// make general take all option	
		final_inter_list[i]="Take all"
		///this option will apply "take" on all elements of item_pointer_list
		i++;
		id.gen_take_all=true;
	}
	if (item_pointer_list!=noone){
		var i_list_l=(array_length(inter_list))
		var t=0+struct_exist;
		while (t<i_list_l){
		final_inter_list[i]=inter_list[t];	
		id.item_list_s=i;
		t++;	
		i++;
		}
		
	}
	return final_inter_list;
}

function ui_draw_box(sprite,xx,yy,width,height){
var spr_wid=sprite_get_width(sprite)
var spr_hei=sprite_get_height(sprite)
var part_w=spr_wid/2;
var part_h=spr_hei/2;
var w_scale=clamp((width/part_w)-2,0,20);
var h_scale=clamp((height/part_h)-2,0,20);
var test=2;
//left upper corner
draw_sprite_part_ext(sprite,0,part_w*0,part_h*0,part_w,part_h,xx,yy,1,1,c_white,1)
//left lower corner
draw_sprite_part_ext(sprite,0,part_w*0,part_h*1,part_w,part_h,xx,yy+(height-part_h),1,1,c_white,1)

//right upper corner
draw_sprite_part_ext(sprite,0,part_w*1,part_h*0,part_w,part_h,xx+(width-part_w),yy,1,1,c_white,1)
//right lower corner
draw_sprite_part_ext(sprite,0,part_w*1,part_h*1,part_w,part_h,xx+(width-part_w),yy+(height-part_h),1,1,c_white,1)

draw_sprite_part_ext(sprite,0,part_w*0.5,part_h*0,part_w,part_h,xx+part_w,yy,w_scale,1,c_white,1)
draw_sprite_part_ext(sprite,0,part_w*0.5,part_h*1,part_w,part_h,xx+part_w,yy+(height-part_h),w_scale,1,c_white,1)

draw_sprite_part_ext(sprite,0,part_w*0,part_h*0.5,part_w,part_h,xx,yy+part_h,1,h_scale,c_white,1)
draw_sprite_part_ext(sprite,0,part_w*1,part_h*0.5,part_w,part_h,xx+(width-part_w),yy+part_h,1,h_scale,c_white,1)

draw_sprite_part_ext(sprite,0,part_w*0.5,part_h*0.5,part_w,part_h,xx+part_w,yy+part_h,w_scale,h_scale,c_white,1)

}

function ui_inter_box_check_slot(slot,slot_num){
	if slot[slot_num]!=noone{
		var test_x=mouse_x
		var test_y=mouse_y
		var xx0=id.x+5;
		var xx1=id.ui_width
		var yy0=id.y+(slot[slot_num]*15);
		var yy1=15

		if ui_mouse_in_rect(xx0,yy0,xx1,yy1)==true{
		id.highlight=slot_num	
		if id.highlight==slot_num{
		draw_rect=true;
		x0=id.x+5;
		x1=id.x+id.ui_width;
		y0=id.y+(slot[slot_num]*15);
		y1=id.y+(slot[slot_num]*15)+15;

		}
		if mouse_check_button_pressed(mb_left)
		{
		var pointer=ui_inter_box_transform_slot_to_pointer(inter_list,id.highlight);
		if pointer[2]=="item"{
		var point_to_entity;
		if is_array(pointer[0]){
		for (var i=0;i<array_length(pointer[0]);i++){
		point_to_entity[i]=access_item(pointer[0][i]);	
		}
	
		pointer[0]=point_to_entity;
			var test=true;	
		}else{
		point_to_entity=access_item(pointer[0]);
		pointer[0]=point_to_entity;
		}}
		if pointer[2]=="structure"{
		var point_to_entity;
		point_to_entity=access_structure(pointer[0]);
		pointer[0]=point_to_entity;
		}
		do_interaction(pointer[0],pointer[1])

		obj_game.wait_for_input=false;
		instance_destroy();
		}
		
		}
	}
	}
	
function ui__inter_box_slot_to_pointer_item(inter_list,slot_num,offset){
		var return_array;
		var slot_num_with_off=slot_num;
		var slot_num_with_on=slot_num-offset;
		if (id.gen_take_all=true)&&(inter_list[slot_num]=="Take all"){
		return_array[0]=id.item_pointer_list
		return_array[1]=inter_list[slot_num_with_off]
		return return_array;
		}
		else{
		if (id.gen_take_all=true){
		var item_p_l=array_length(id.item_pointer_list)
		return_array[0]=id.item_pointer_list[slot_num_with_off-1]
		return_array[1]=inter_list[slot_num_with_off]
		return return_array;		
		}
		if (id.gen_take_all=false){
		return_array[0]=id.item_pointer_list[slot_num_with_off-id.struct_list_l]
		return_array[1]=inter_list[slot_num_with_off]
		return return_array;				
		}
						
		}
	}
	
function ui_inter_box_transform_slot_to_pointer(inter_list,slot_num){
	var return_array;
if id.struct_is=true{
if (slot_num<id.struct_list_l){	
return_array[0]=id.struct_pointer_list[0];
return_array[1]=inter_list[slot_num];
return_array[2]="structure"
return return_array;
}
else {
return_array=ui__inter_box_slot_to_pointer_item(inter_list,slot_num,id.struct_list_l)
return_array[2]="item"
return return_array;}
}
else{
return_array=ui__inter_box_slot_to_pointer_item(inter_list,slot_num,0)
return_array[2]="item"
return return_array;	
}
}

function ui_draw_list_interaction_box(xx,yy,width,height,list,num){
var r_value;
var str_l=string_width(list[num]);
var str_w=string_height(list[num])
var def_sep=15
var white=c_white;
if id.highlight==num {white=c_yellow}
draw_text_transformed_color(xx,yy+(def_sep*num),list[num],0.8,0.8,0,white,white,white,white,1)
r_value=(def_sep*num)
return num
}

function ui_ini_timer_text(xx,yy,str,timer){
var ui_pass_text=instance_create_layer(xx,yy,"UI",ui_description)
ui_pass_text.ui_type=2;
ui_pass_text.ui_str=str;
ui_pass_text.ui_timer=timer;

}

function ui_make_element_button(where_x,where_y,type_button,parent_id){
	if type_button="exit_b"{
	type_button=0;	
	}
	var button ={
	offset_x : where_x,
	offset_y : where_y,
	type_b : type_button,
	parent_id : id
		
	}
	return button;
	}
				
function ui_draw_element_button(button_struct){
draw_sprite(UI_buttons,button_struct.type_b,button_struct.parent_id.x+button_struct.offset_x,button_struct.parent_id.y+button_struct.offset_y);
}

function ui_step_element_button(button){
if ui_mouse_in_rect_action(button.parent_id.x+button.offset_x,button.parent_id.y+button.offset_y,16,16,mb_left)
{
audio_play_sound(s_click,1,0);
return "destroy_myself";
//instance_destroy();

}
return noone;
}

function ui_make_element_slot(x_cord,y_cord,type_slot,slot_num,par_id){

	var slot ={
	xx : x_cord,
	yy : y_cord,
	type_s : type_slot,
	parent_id : par_id,
	content : noone,
	pos_fetched : false,
	image: noone,
	targeted : false,
	scale_x : 2,
	scale_y : 3,
	i_scale_x : 1,
	i_scale_y : 1,
	slot_num : slot_num
	}
	if type_slot="inventory"{
	if slot_num==0 || slot_num=4
	{
	slot.scale_x=2
	slot.scale_y=4
	}
		
	}
	return slot;
	}
	
	
function ui_draw_element_slot(slot,subimg){
if slot.content=noone{
slot.image=noone;
slot.pos_fetched=false;
}

if slot.content!=noone&&slot.pos_fetched==false{
var item=access_item(slot.content);
var item_size=get_item_to_inventory_size(item);
slot.i_scale_x=(item_size[0]*32)
slot.image=item.i_sprite;
slot.pos_fetched=true;
}

if slot.image!=noone{
var item=access_item(slot.content);
draw_sprite_ext(UI_slots,subimg,slot.parent_id.x+slot.xx,slot.parent_id.y+slot.yy,slot.scale_x,slot.scale_y,0,c_white,1);
draw_sprite(obj_game.sprite_sheet_items_inv[access_item(slot.content).i_type],0,(slot.parent_id.x+slot.xx)+16,slot.parent_id.y+slot.yy+16);	
}
else{
draw_sprite_ext(UI_slots,subimg,slot.parent_id.x+slot.xx,slot.parent_id.y+slot.yy,slot.scale_x,slot.scale_y,0,c_white,1);	
}

}

function ui_step_element_slot(slot){
if ui_mouse_in_rect(slot.parent_id.x+slot.xx,slot.parent_id.y+slot.yy,32*slot.scale_x,32*slot.scale_y)
{
if slot.type_s="inventory" && slot.content!=noone{
slot.parent_id.dragable=false;	
slot.targeted=true;

}
else if ui_mouse_cursor.mouse_drag!=true{
slot.parent_id.dragable=true;	
}

if ui_mouse_cursor.mouse_l_pressed_once{

ui_mouse_cursor.mouse_l_pressed_once=false;
}
if ((ui_mouse_cursor.mouse_drag=true)&&(slot.content!=noone)&&ui_mouse_cursor.content==noone){
slot.parent_id.element_dragged=true
apply_item_to_mouse(slot.content);
var copy_content=slot.content
ui_mouse_cursor.content=copy_content;
ui_mouse_cursor.content_origin=slot;
//ui_mouse_cursor.check_release=true;
slot.content=noone;
audio_play_sound(s_click,1,0)
}

if ( ui_mouse_cursor.mouse_l_released=true)
{
if (ui_mouse_cursor.content!=noone && ui_mouse_cursor.mouse_drag=true ){
if slot.content==noone && ui_inventory_check_slot_for_item_legit(ui_mouse_cursor.content,slot.slot_num){
slot.content=ui_mouse_cursor.content;
ui_mouse_cursor.mouse_l_released=false;
ui_mouse_cursor.mouse_drag=false;
remove_entity_to_mouse();
ui_inventory_write_window_slot_to_char_slot(slot.parent_id.slot,slot.parent_id.owner)
audio_play_sound(s_click,1,0)
	
	
}
else{


ui_mouse_cursor.content_origin.content=ui_mouse_cursor.content;
if instance_exists(ui_container_window){
	var my_id=slot.parent_id
	var cursor_id=ui_mouse_cursor.content_origin.parent_id
	if (((cursor_id==my_id)==false)&&cursor_id.my_purpose=="container"){ //presume it is a container, we must specify
	 ui_container_return_item_to_grid(ui_mouse_cursor.content_origin.parent_id,ui_mouse_cursor.content_origin,ui_mouse_cursor.content);	
	}
}
ui_mouse_cursor.mouse_l_released=false;
ui_mouse_cursor.mouse_drag=false;
remove_entity_to_mouse();
audio_play_sound(s_click,1,0)
}
}
ui_mouse_cursor.mouse_l_released=false;
}
	








if (mouse_check_button_pressed(mb_right)&&(slot.slot_num==3)){
	
ini_container_screen(id.x-160,id.y,id,slot.content);
//audio_play_sound(sword_clink_0,1,0)	
audio_play_sound(s_click,1,0)
}
}
else if ui_mouse_cursor.mouse_drag!=true{
slot.parent_id.dragable=true;		
}
}

	


function ui_step_element_slot_dragable(slot){
var mouse_test_pressed;
var mouse_test_released;
mouse_test_pressed=ui_mouse_drag_pressed(id,slot.parent_id.x+slot.xx,slot.parent_id.y+slot.yy,32,32);
mouse_test_released=ui_mouse_drag_released(id,slot.parent_id.x+slot.xx,slot.parent_id.y+slot.yy,32,32);
if ((mouse_test_pressed)&&(mouse_test_released!=true))
{
drag_on_slot=true;	
last_mos_x=mouse_x;
last_mos_y=mouse_y;
last_pos_x=slot.parent_id.x+slot.xx;
last_pos_y=slot.parent_id.y+slot.yy;
}
if ((mouse_test_pressed!=true)&&(mouse_test_released))
{
drag_on=false;
audio_play_sound(s_click,1,0);
}

if drag_on=true{
drag_x=last_pos_x-(last_mos_x-mouse_x);
drag_y=last_pos_y-(last_mos_y-mouse_y);
id.x=(drag_x);
id.y=(drag_y);

}
else{
drag_x=0;
drag_y=0;
drag_on=false;
}
	
}

