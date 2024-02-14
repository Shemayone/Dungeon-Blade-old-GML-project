// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function ini_structure_ds(length){
var struct_grid=ds_grid_create(length,1)
return struct_grid;
}


function access_structure(pos){
var structure=ds_grid_get(obj_game.struct_grid,pos,0)
return structure;
}

function ini_structure(xx,yy,level,type,state,damage,contents){
var pos=obj_game.struct_grid_pos
var structure = {
	identity: 0,
	s_type : type,
	s_state : state,
	s_damage : damage,
	s_contents : contents,
	s_sprite : obj_game.sprite_sheet_structures[type],
	s_level : level,
	s_description : "",
	s_def : 0,
	str_cord : string(xx)+"."+string(yy)
	
}
ds_grid_set(obj_game.struct_grid,pos,0,structure)
obj_game.struct_grid_pos+=1;
return pos;
}

function add_structure_to_grid(xx,yy,level,pos){
var struct_count,items_count,arr_pos;
struct_count=get_structure_count_level(xx,yy,level)
items_count=get_item_count_level(xx,yy,level)
if (items_count==0 && struct_count!=9){
arr_pos=3+struct_count
set_itst_nth_level(xx,yy,arr_pos,pos,level)	
struct_count+=1;
set_structure_count_level(xx,yy,struct_count,level)
return true
}
if (items_count>0 &&struct_count!=9){
arr_pos=3+struct_count
shift_items_arr_right(xx,yy,arr_pos,level)
set_itst_nth_level(xx,yy,arr_pos,pos,level)	
struct_count+=1;
set_structure_count_level(xx,yy,struct_count,level)
return true
}
return false;
	
}

function make_structure(xx,yy,level,type,state,damage,contents){
var structure=ini_structure(xx,yy,level,type,state,damage,contents)
var test=add_structure_to_grid(xx,yy,level,structure)
return structure;

}


///called from UI
function build_interaction_list_by_type_state(type,state){
var return_array;
return_array[0]="Examine"
if (type==2 || type==4) //if door or chest
{
if state==0
{
return_array[1]="Open"
}
if state==2
{
return_array[1]="Close"
}
}
return return_array

}



function do_interaction(item,interaction_string){
if (is_array(item)){
for (var i=0;i<array_length(item);i++){
do_interaction(item[i],interaction_string)
}
}
else{

if (item.identity=0)
	{
	apply_change_to_structure(item,interaction_string)
	}
	
if (item.identity=1){
   apply_change_to_item(item,interaction_string);	
}
}}




function apply_change_to_structure(structure,interaction){
switch (interaction){
case "Examine":
ui_ini_timer_text(mouse_x,mouse_y,structure.s_description,50);
break;
case "Open":
structure.s_state=2;
apply_open_close(structure,structure.s_state);
break;
case "Close":
structure.s_state=0;
apply_open_close(structure,structure.s_state);
break;
}
}

function apply_open_close(structure,state){
	if check_structure_passable(structure)
	{
var str_grid=structure.str_cord
var level=structure.s_level
var grid_array=scr_return_cord_handle_str(str_grid)
if structure.s_state=0
{
set_tile_type_level(grid_array[0],grid_array[1],24,level)
}
if structure.s_state=2
{
set_tile_type_level(grid_array[0],grid_array[1],23,level)
}
refresh_grid_tile(grid_array[0],grid_array[1]);
	}


}

function check_structure_passable(structure){
var type=structure.s_type
switch (type){
case 4: //door
return true
break;
default:
return false
break;
}
}

function check_identity_entity(entity){
	
	
}