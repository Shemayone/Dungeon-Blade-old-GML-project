/// @description Insert description here
// You can write your code in this editor
//step event
if instance_exists(follow)
{



if deathcam=false
{
if teleport=false
{
if alarmtrigger=1
{alarm[0]=5
alarmtrigger=0
}
if transition= false
{
	
x += ((xf - x)/20)+cameraoffsetx
y += ((yf - y)/20)+cameraoffsety
x=round(x)
y=round(y)
}


else if transition = true
{x=newposx + cameraoffsetx
y=newposy + cameraoffsety
if alarmtrigger=1
{alarm[0]=30
alarmtrigger=0
}
transition=false
}
if follow != noone
{
xf = follow.x
yf = follow.y

}else if follow=noone
{
follow=obj_pc;
}
}
if teleport =true
{
newposx=follow.x
newposy=follow.y
transition=true;
teleport=false;
}
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
camera_set_view_mat(camera,vm)
var pm = matrix_build_projection_ortho(500+cameraoffsetz,250+(round(cameraoffsetz/2)),1,10000)
camera_set_proj_mat(camera,pm)
}}



if keyboard_check_direct(vk_add)
{
cameraoffsetz-=10
}
if keyboard_check_direct(vk_subtract)
{
cameraoffsetz+=10
}

