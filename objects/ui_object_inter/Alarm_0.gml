/// @description Insert description here
// You can write your code in this editor
alpha-=0.1
if alpha<0.2
{
instance_destroy();
}
ui_timer-=2;
alarm[0]=ui_timer;