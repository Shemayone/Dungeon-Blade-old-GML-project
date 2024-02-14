// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function refresh_grid(){
with(obj_tile)
{
refresh_sprite_from_grid=true;
}}

function refresh_grid_tile(xx,yy){
with(obj_game.tile[xx,yy])
{
refresh_sprite_from_grid=true;
}}

function outline_in_square(pos_x,pos_y,width_x,width_y,xx,yy){
	if ((xx==pos_x || yy==pos_y)|| (xx==pos_x + width_x-1 || yy==pos_y +width_y-1)){return true}
	else return false
}
function add_barrow_room(pos_x,pos_y,x_width,y_width,dir,r_x_width,r_y_width){
var new_pos_x,new_pos_y,entry_x,entry_y;
switch (dir)
{
//left?
case 1:
entry_x=pos_x
var place_ent=irandom_range(1,y_width-2)
entry_y=(pos_y)+place_ent
var y_middle=irandom_range((-r_y_width)+2,r_y_width-2)
new_pos_x=(pos_x-r_x_width)+1
new_pos_y=(entry_y)-(r_y_width/2)
make_barrow_tomb_room(new_pos_x,new_pos_y,r_x_width,r_y_width,entry_x,entry_y);
break;
case 2:
entry_y=pos_y
var place_ent=irandom_range(1,x_width-2)
entry_x=(pos_x+1)+place_ent
var x_middle=floor(x_width/2)
new_pos_x=(pos_x)+(place_ent-x_middle)
new_pos_y=(pos_y-r_y_width)+1
make_barrow_tomb_room(new_pos_x,new_pos_y,r_x_width,r_y_width,entry_x,entry_y);
break;
case 3:
entry_x=(pos_x +x_width)-1
var place_ent=irandom_range(1,y_width-2)
entry_y=(pos_y)+place_ent
var y_middle=floor(y_width/2)
new_pos_x=((pos_x+x_width)-1)
new_pos_y=(pos_y)+(place_ent-y_middle)
make_barrow_tomb_room(new_pos_x,new_pos_y,r_x_width,r_y_width,entry_x,entry_y);
break;

}
}


function make_barrow_tomb_room(pos_x,pos_y,x_width,y_width,entry_x,entry_y){
var grid=obj_game.grid_cell[obj_game.grid_level+1]
for (var xx=pos_x; xx<pos_x+x_width;xx++){for (var yy=pos_y; yy<pos_y+y_width;yy++){

	if (outline_in_square(pos_x,pos_y,x_width,y_width,xx,yy)){
	set_tile_type_level(xx,yy,make_b_tomb_walls_and_corners(xx,yy,pos_x,pos_y,x_width,y_width),1)
	}
	else{
	set_tile_type_level(xx,yy,choose(10,11,12,13),1)
	if random_percent(5)
	{
	if random_percent(25)
	{
	make_structure_chest(xx,yy,1,0,0,0);
	}
	
	else {
		
	make_item_sword(xx,yy,1,1,0,"ground");	
	}
	}
	}



}}
	set_tile_type_level(entry_x,entry_y,23,1)
	make_structure_door(entry_x,entry_y,1,0,0,0);
}

function make_b_tomb_walls_and_corners(xx,yy,x_pos,y_pos,x_width,y_width){
	    var r_value=18
		if xx==x_pos
		{
		r_value=17
		}
		if yy==y_pos
		{
		r_value=choose(14,15,16)
		}
		if yy==y_pos+(y_width-1)
		{
		r_value=choose(14,15,16)
		}
		if ((xx==x_pos)&&(yy==y_pos)){
		r_value= 17
		}
		if ((xx==(x_pos+(x_width-1)))&&(yy==y_pos)){
		r_value= 18	
		}
		if ((xx==(x_pos))&&(yy==y_pos+(y_width-1))){
		r_value= 19	
		}
		if ((xx==(x_pos+(x_width-1)))&&(yy==y_pos+(y_width-1))){
		r_value= 20	
		}
		return r_value;
	
}

function make_barrow_tomb_room_entrance(pos_x,pos_y,x_width,y_width,door_pos_x,door_pos_y){
var grid=obj_game.grid_cell[obj_game.grid_level+1]
for (var xx=pos_x; xx<pos_x+x_width;xx++){for (var yy=pos_y; yy<pos_y+y_width;yy++){
	if (outline_in_square(pos_x,pos_y,x_width,y_width,xx,yy)){
	///corners
	set_tile_type_level(xx,yy,make_b_tomb_walls_and_corners(xx,yy,pos_x,pos_y,x_width,y_width),1)
	}
	else{
	set_tile_type_level(xx,yy,choose(10,11,12,13),1)
	}
	
	set_tile_type_level(door_pos_x,door_pos_y,22,1)
	
	
}}
make_structure_sarcophagus((pos_x+(x_width/2)),(pos_y+(y_width/2)),1,0,0,0)
add_barrow_room(pos_x,pos_y,x_width,y_width,irandom_range(1,1),irandom(4)+3,irandom(4)+3)
}


function make_barrow_tomb_new(pos_x,pos_y,width,height){
if (width<6 ||height<6){
return false;	
}
var grid=obj_game.grid_cell[obj_game.grid_level]
var pos_x0= pos_x;
var pos_x1=(pos_x + (width-1));
var pos_y0= pos_y;
var pos_y1=(pos_y + (height-1));	
var offset=25
var door_pos=pos_x0+(floor(width/2)-1)
for (var xx=pos_x; xx<pos_x+width;xx++){for (var yy=pos_y; yy<pos_y+height;yy++){
	
	set_tile_type(xx,yy,offset+8)
	
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+12)}
	if xx=pos_x0+1  {set_tile_type(xx,yy,offset+13)}
	if xx=pos_x1-1  {set_tile_type(xx,yy,offset+16)}	
	if xx=pos_x1  {set_tile_type(xx,yy,offset+17)}	

if yy=pos_y0{
	if (xx==pos_x0||xx==pos_x1){ set_tile_type(xx,yy,1)}
	if xx=pos_x0+1 {set_tile_type(xx,yy,offset+1)}
	if xx=pos_x0+2  {set_tile_type(xx,yy,offset+2)}
	if xx=pos_x1-2  {set_tile_type(xx,yy,offset+3)}
	if xx=pos_x1-1  {set_tile_type(xx,yy,offset+4)}
}
if yy=pos_y0+1{
	set_tile_type(xx,yy,offset+8)
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+6)}
	if xx=pos_x0+1  {set_tile_type(xx,yy,offset+7)}
	if xx=pos_x0+2  {set_tile_type(xx,yy,offset+8)}
	if xx=pos_x1-2  {set_tile_type(xx,yy,offset+9)}
	if xx=pos_x1-1  {set_tile_type(xx,yy,offset+10)}	
	if xx=pos_x1  {set_tile_type(xx,yy,offset+11)}	
}
if yy=pos_y1-3{
	set_tile_type(xx,yy,offset+8)
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+12)}
	if xx=pos_x0+1  {set_tile_type(xx,yy,offset+13)}
	if xx=pos_x0+2  {set_tile_type(xx,yy,offset+14)}
	if xx=pos_x1-2  {set_tile_type(xx,yy,offset+15)}
	if xx=pos_x1-1  {set_tile_type(xx,yy,offset+16)}	
	if xx=pos_x1  {set_tile_type(xx,yy,offset+17)}		
	
}
if yy=pos_y1-2{
	set_tile_type(xx,yy,offset+7)
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+18)}
	if xx=pos_x0+1  {set_tile_type(xx,yy,offset+19)}
	if xx=pos_x0+2  {set_tile_type(xx,yy,offset+20)}
	if xx=pos_x1-2  {set_tile_type(xx,yy,offset+21)}
	if xx=pos_x1-1  {set_tile_type(xx,yy,offset+22)}	
	if xx=pos_x1  {set_tile_type(xx,yy,offset+23)}		
	
}
if yy=pos_y1-1{
	set_tile_type(xx,yy,offset+28)
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+24)}
	if xx=pos_x1  {set_tile_type(xx,yy,offset+29)}	
	if xx=door_pos-1 {set_tile_type(xx,yy,offset+25)}	
	if xx=door_pos {set_tile_type(xx,yy,offset+26)}	
	if xx=door_pos+1 {set_tile_type(xx,yy,offset+27)}	
	
}
if yy=pos_y1{
	set_tile_type(xx,yy,offset+34)
	if xx=pos_x0+0 {set_tile_type(xx,yy,offset+30)}
	if xx=pos_x1  {set_tile_type(xx,yy,offset+35)}	
	if xx=door_pos-1 {set_tile_type(xx,yy,offset+31)}	
	if xx=door_pos {set_tile_type(xx,yy,offset+32)}	
	if xx=door_pos+1 {set_tile_type(xx,yy,offset+33)}	
}

}}

make_barrow_tomb_room_entrance(pos_x,pos_y,width,height,door_pos,pos_y1);
refresh_grid();
}



function make_barrow_tomb(pos_x,pos_y,width){
var grid=obj_game.grid_cell[obj_game.grid_level]
var pos_x0= pos_x;
var pos_x1=(pos_x + (width-1));
var pos_y0= pos_y;
var pos_y1=(pos_y + (width-1));
for (var xx=pos_x; xx<pos_x+width;xx++){for (var yy=pos_y; yy<pos_y+width;yy++){
	if (((xx==pos_x0 && yy==pos_y0)||(xx==pos_x0 && yy==pos_y1) //corners of rectangle
								 ||(xx==pos_x1 && yy==pos_y0)
								 ||(xx==pos_x1 && yy==pos_y1))!=true){
								 if (yy==pos_y1)||(yy==pos_y1-1 && xx=pos_x1)
												||(yy==pos_y1-1 && xx=pos_x0){ //bottom line of the barrow
								 set_tile_type(xx,yy,14)
								 }
								 else{
								 set_tile_type(xx,yy,14)
								 }}}}
	set_tile_type(pos_x+floor((width-1)/2),pos_y+(width-1),21) //entrance
	///make underground room
	make_barrow_tomb_room_entrance(pos_x,pos_y,width,width,pos_x,pos_y);
	refresh_grid();
								 }
								 
function make_barrow_field(width,height,temp){
///temp 0.1-2
randomize();
var x_grid=(width/10) -2
var y_grid=(height/10) -2
var amount=temp
var old_pos_x=5
var old_pos_y=5
for (var xx=2;xx<x_grid;xx++){for (var yy=2;yy<y_grid;yy++){
var dist=distance_grid_to_grid(xx,yy,4,4)*10	
if random_percent(25)
{
var r_xx=x_grid-(x_grid/2)+(irandom_range(-5,5))
var r_yy=y_grid-(y_grid/2)+(irandom_range(-5,5))
var new_pos_x=clamp(r_xx+(xx*x_grid),15,85)
var new_pos_y=clamp(r_yy+(yy*y_grid),15,85)
var size=irandom_range(6,12)
while (distance_grid_to_grid(new_pos_x,new_pos_y,old_pos_x,old_pos_x)<size)
{
var r=choose(0,1)
if r==0
{
size--;
if size<=2
{size=3
 r=1;}
}
if r==1
{
var rr=choose(0,1)
if rr=0
{
new_pos_x=new_pos_x+irandom_range(-1,1)
}
if rr=1
{
new_pos_y=new_pos_y+irandom_range(-1,1)
}
}}
make_barrow_tomb_new(clamp(new_pos_x,30,70),clamp(new_pos_y,30,70),size)
old_pos_x=clamp(new_pos_x,15,85);
old_pos_y=clamp(new_pos_y,15,85);
}}}}