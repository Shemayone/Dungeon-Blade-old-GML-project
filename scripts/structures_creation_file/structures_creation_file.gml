// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function make_structure_statue(xx,yy,level,state,damage,contents){
var statue_pos=make_structure(xx,yy,level,1,state,damage,contents);
var statue=ds_grid_get(obj_game.struct_grid,statue_pos,0)
statue.s_description = "A marble statue, depicting a king from the past."
}
function make_structure_sarcophagus(xx,yy,level,state,damage,contents){
var sarcophagus_pos=make_structure(xx,yy,level,3,state,damage,contents);
var sarcophagus=ds_grid_get(obj_game.struct_grid,sarcophagus_pos,0)
sarcophagus.s_description = "An old stone coffin."
}
function make_structure_chest(xx,yy,level,state,damage,contents){
var chest_pos=make_structure(xx,yy,level,2,state,damage,contents);
var chest=ds_grid_get(obj_game.struct_grid,chest_pos,0)
var container=ui_ini_container("structure",chest_pos)
chest.s_def=container;
chest.s_description = "A wooden treasure chest. Who knows what it holds?"
ds_grid_set(obj_game.struct_grid,chest_pos,0,chest);
}
function make_structure_door(xx,yy,level,state,damage,contents){
var door_pos=make_structure(xx,yy,level,4,state,damage,contents);
var door=ds_grid_get(obj_game.struct_grid,door_pos,0)
apply_open_close(door,door.s_state);
door.s_description= "A wooden door."
}