// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sprites_projection(){

}



function type_to_sprite(type,iid_seed)
{
var r_array	

if type>24
{
r_array[0]=spr_barrows_tileset_2
r_array[1]=(type-25)
return r_array;
}

switch(type){
case 1 :
r_array[0]=spr_grass_new
r_array[1]=irandom(20);
return r_array
break;
case 10 :
case 11 :
case 12 :
case 13 :
case 14 :
case 15 :
case 16 :
case 17 :
case 18 :
case 19 :
case 20 :
case 21 :
case 22 :
case 23 :
case 24 :
r_array[0]=spr_wall_tileset
r_array[1]=type-10
return r_array;
break;
}
}