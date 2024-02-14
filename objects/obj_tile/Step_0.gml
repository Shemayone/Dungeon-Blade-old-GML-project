/// @description Insert description here
// You can write your code in this editor
if id.refresh_sprite_from_grid=true
{
tile_type=get_tile_type(pos_X,pos_Y)
structure_count=get_structure_count(pos_X,pos_Y)
item_count=get_item_count(pos_X,pos_Y)

if structure_count>0
{
structure[structure_count]=access_structure(get_itst_nth_level(pos_X,pos_Y,2+structure_count,obj_game.grid_level))

}
if item_count>0
{
for (var i=1;i<=item_count;i++){
item[i]=access_item(get_itst_nth_level(pos_X,pos_Y,2+structure_count+i,obj_game.grid_level))	
	
}

var test=true;
}

if tile_type!=0 {
	var sprite=type_to_sprite(tile_type,id);
	if is_array(sprite)!=true
	{
	var test=true	
	}
	var autoscale=sprite_get_width(sprite[0])
	id.x_scale=32/autoscale
	id.y_scale=32/autoscale
	id.sprite=sprite[0];
	id.sprite_ind=sprite[1];
	
	}
id.refresh_sprite_from_grid=false;
}