// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ini_player(pos_x,pos_y){
instance_create_layer(pos_x*32,pos_y*32,"Instances",obj_pc);
}

function ini_grid_map(grid){
var grid_size_x=ds_grid_width(grid);
var grid_size_y=ds_grid_height(grid);
for (var xx=0; xx<grid_size_x;xx++){for (var yy=0; yy<grid_size_y;yy++){
randomize();
var def_arr=array_create(3);
ds_grid_set(grid,xx,yy,def_arr);
ds_grid_set(obj_game.grid_cell[1],xx,yy,def_arr);
tile[xx][yy]=instance_create_layer(xx*obj_game.grid_size,yy*obj_game.grid_size,"Tiles",obj_tile);
tile[xx][yy].sprite=spr_grass_new;
tile[xx][yy].sprite_ind=choose(0,1);
tile[xx][yy].pos_X=xx
tile[xx][yy].pos_Y=yy
tile[xx][yy].tile_type=1;
set_tile_type(xx,yy,1);
}}

}