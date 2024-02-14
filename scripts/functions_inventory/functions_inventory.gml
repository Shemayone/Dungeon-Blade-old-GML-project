// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ini_inventory_screen(){
if instance_exists(obj_pc){
instance_create_layer(irandom(100)+1000,irandom(100)+50,"UI",ui_inventory_window);
return true;
	
	
}
}

function destroy_inventory_screen(){
if instance_exists(ui_inventory_window){
instance_destroy(ui_inventory_window);
obj_game.ui_signal=false;
return false;
}
}


//actor functions
function scr_char_slot_ini(iid){
var char_slot;
if iid.actor_type="humanoid"{
for (var i=0;i<9;i++){
char_slot[i+1]=noone;	
}
}

return char_slot;
}


function ui_inventory__retrieve_item_inventory_slot(item_pointer)
{
	var str=access_item(item_pointer).i_inv_slot
	var str_l=string_length(str)
	var i=1;
	var r_i=0;
	var return_arr;
	while (str_l>=i){
	var char=string_char_at(str,i)
	if char!="."{
	return_arr[r_i]=real(char);
	r_i++;
	}
	i++;
	}
	return return_arr;
}

function ui_inventory_check_slot_for_item_legit(item_pointer,slot_num){
var item_arr=ui_inventory__retrieve_item_inventory_slot(item_pointer);
var item_arr_l=array_length(item_arr);
for (var i=0;i<item_arr_l;i++){
if slot_num==item_arr[i]{
return true	
}
}
return false	
}

function ui_inventory_write_window_slot_to_char_slot(slot,actor_id){
var slot_l=array_length(slot)
for (var i=0;i<slot_l;i++){
actor_id.char_slot[i]=slot[i].content

}
	
}