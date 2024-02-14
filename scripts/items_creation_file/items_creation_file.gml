// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information





function make_item_bag(xx,yy,level,type,stats,state){
var bag_pos=make_item(xx,yy,level,3,stats,1);
var bag=ds_grid_get(obj_game.item_grid,bag_pos,0)
bag.i_description = " a bag."
bag.i_sprite=spr_i_bag;
bag.i_inv_slot="3"
var container=ui_ini_container("item",bag_pos)
bag.i_def=container;
if ((state!=("inventory"))&&(state!="container")){
var check=add_item_to_grid(xx,yy,level,bag_pos);	
}
return bag_pos;
}


function make_item_sword(xx,yy,level,type,stats,state){
var sword_pos=make_item(xx,yy,level,1,stats,13);
var sword=ds_grid_get(obj_game.item_grid,sword_pos,0)
sword.i_description = " a sword."
sword.i_sprite=spr_i_sword;
sword.i_inv_slot="0.4"
if ((state!=("inventory"))&&(state!="container")){
var check=add_item_to_grid(xx,yy,level,sword_pos);	
}
return sword_pos;
}
function make_item_torch(xx,yy,level,type,stats,state){
var sword_pos=make_item(xx,yy,level,2,stats,12);
var sword=ds_grid_get(obj_game.item_grid,sword_pos,0)
sword.i_description = " a torch."
sword.i_sprite=spr_i_torch;
sword.i_inv_slot="0.4"
if ((state!=("inventory"))||(state!="container")){
var check=add_item_to_grid(xx,yy,level,sword_pos);	
}
return sword_pos;
}

function make_item_chainmail(xx,yy,level,stats,state){
var armor_pos=make_item(xx,yy,level,0,stats,23);
var armor=ds_grid_get(obj_game.item_grid,armor_pos,0)
armor.i_description = " a chainmail coat."
armor.i_sprite=spr_i_arm_chainmail_2
armor.i_inv_slot="2"
var check=((state!=("inventory"))||(state!="container"))
if check{
check=add_item_to_grid(xx,yy,level,armor_pos);	
}
return armor_pos;
}


