// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_mouse_grid(old_x_m_grid,old_y_m_grid,x_m_grid,y_m_grid,input,id){
if (old_x_m_grid!=x_m_grid || old_y_m_grid!=y_m_grid)&&(input=false)
{
if (id.tile[x_m_grid][y_m_grid].structure_count>0)||(id.tile[x_m_grid][y_m_grid].item_count>0)
{
id.tile[x_m_grid][y_m_grid].structure_highlight=1;
id.tile[x_m_grid][y_m_grid].item_highlight=1;
id.selected_tile=id.tile[x_m_grid][y_m_grid];
if instance_exists(id.tile[old_x_m_grid][old_y_m_grid])
{
id.tile[old_x_m_grid][old_y_m_grid].structure_highlight=0;
id.tile[old_x_m_grid][old_y_m_grid].item_highlight=0;
}

}
else {id.selected_tile=noone;
	id.tile[old_x_m_grid][old_y_m_grid].structure_highlight=0
	id.tile[old_x_m_grid][old_y_m_grid].item_highlight=0;}
id.old_x_mouse_grid=x_m_grid;
id.old_y_mouse_grid=y_m_grid;
///returns selected_tile for manipulation
}}


function get_listpos_structs_items_on_grid_tile(tile){
	
	
}
function get_arrpos_items_on_grid_cord(xx,yy,level){
	var struct_count,item_count,ent_count,r_arr;
	item_count=get_item_count_level(xx,yy,level);
	struct_count=get_structure_count_level(xx,yy,level);
	ent_count=item_count;
	if ent_count!=0{
		for (var i=0;i<ent_count;i++){
			r_arr[i]=get_itst_nth_level(xx,yy,(3+struct_count)+i,level)
	}
	return r_arr;
	}
	
	return false;
}

function get_arrpos_struct_on_grid_cord(xx,yy,level){
	var struct_count,item_count,ent_count,r_arr;
	item_count=get_item_count_level(xx,yy,level);
	struct_count=get_structure_count_level(xx,yy,level);
	ent_count=struct_count;
	if ent_count!=0{
		for (var i=0;i<ent_count;i++){
			r_arr[i]=get_itst_nth_level(xx,yy,(3+i),level)
	}
	return r_arr;
	}
	
	return false;
}