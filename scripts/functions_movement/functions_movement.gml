// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function check_transition(xx,yy,iid){
var tile_type=get_tile_type(xx,yy)
if (ds_grid_get(obj_game.grid_cell_act[obj_game.grid_level],xx,yy)==1 && (tile_type==21 || tile_type==22 || tile_type=57)){
	var debug_inst=obj_pc.id
if iid==debug_inst
{
var i;
if tile_type=21 {i=1}
if tile_type=22 {i=-1}
if tile_type=57 {i=1}
obj_game.grid_level=obj_game.grid_level+ i;
ds_grid_set(obj_game.grid_cell_act[obj_game.grid_level+(-i)],xx,yy,0)
refresh_grid();
}
}
}

function move_target(pos_X,pos_Y,iid) {
iid.pos_X=pos_X;
iid.pos_Y=pos_Y;
iid.x=pos_X*32;
iid.y=pos_Y*32;
ds_grid_set(obj_game.grid_cell_act[obj_game.grid_level],pos_X,pos_Y,1);
check_transition(pos_X,pos_Y,iid);
}

function actor_movement_tiles_stepable(grid_value){
switch (grid_value)
{
case 1:
case 10:
case 11:
case 12:
case 13:
case 21:
case 22:
case 23:
case 57:
return true
break;
default: 
return false
break;
}
}

function actor_movement_check_place(pos_array){
// 789
// 4X6
// 123
var x_pos,y_pos;
x_pos=pos_array[0];
y_pos=pos_array[1];
var grid_actor = obj_game.grid_cell_act[obj_game.grid_level];
var grid = obj_game.grid_cell[obj_game.grid_level]
if ((ds_grid_get(grid_actor,x_pos,y_pos))==0 && (actor_movement_tiles_stepable(get_tile_type(x_pos,y_pos))))
{
return true;
}
else return false;

}
function dir_to_pos(dir,iid){
var pos_x,pos_y;
pos_x=iid.pos_X;
pos_y=iid.pos_Y;
var r_array;
r_array[0]=0;
r_array[1]=0;

if (dir<4){	pos_y+=1;}
if (dir>6) { pos_y-=1;}
if ((dir mod 3)==0) {pos_x+=1; iid.sprite=1;}
if (dir==7 || dir==4 || dir==1){ pos_x-=1; iid.sprite=0;}
r_array[0]=pos_x
r_array[1]=pos_y
return r_array;
}

function actor_movement(dir, iid){
// 789
// 4X6
// 123
var pos_array;
pos_array=dir_to_pos(dir,iid)
if actor_movement_check_place(pos_array)
{
ds_grid_set(obj_game.grid_cell_act[obj_game.grid_level],iid.pos_X,iid.pos_Y,0);	
move_target(pos_array[0],pos_array[1],iid);
}

}


//////KEYBOARD functions
