// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function distance_pc_to_grid(pc_xx,pc_yy,grid_xx,grid_yy){
var x_dist=abs(pc_xx-grid_xx)
var y_dist=abs(pc_yy-grid_yy)
var distance=sqrt((x_dist*x_dist)+(y_dist*y_dist))
return floor(distance)
}
function distance_grid_to_grid(grid0_xx,grid0_yy,grid1_xx,grid1_yy){
var x_dist=abs(grid0_xx-grid1_xx)
var y_dist=abs(grid0_yy-grid1_yy)
var distance=sqrt((x_dist*x_dist)+(y_dist*y_dist))
return floor(distance)
}



function attempt_default_interaction(structure,dist){
if structure!=0{
if structure.identity==0{	
var inter_string_default=list_default_inter_by_type(structure,dist)

do_interaction(structure,inter_string_default);
}}
}

////STRUCTURE
function list_default_inter_by_type(structure,dist)
{	
if (dist==1){ var type=structure.s_type}
else type=0 //default
switch (type){
case 1:
case 3:
return "Examine"
break;
case 2:
case 4:
var state=structure.s_state;
if state==0 {return "Open"}
if state==2 {return "Close"}
break;
default:
return "Examine"
break;
}

}