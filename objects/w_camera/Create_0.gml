/// @description Insert description here
// You can write your code in this editor
x=obj_pc.x
y=obj_pc.y
deathcam=false;

cameraoffsetz=0;
alarm[0] =10
alarmtrigger=1
cameraoffsety= (-0.5);
cameraoffsetx=0
transition= false
teleport=false
camera = camera_create()

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
var pm = matrix_build_projection_ortho(500,250,1,10000)

camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)

view_camera[0] = camera

follow = obj_pc
 xf = x
 yf = y
 
 
