// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_percent(percent){
var chance=irandom(99)+1
if (chance<percent) {return true}
else {return false}
}