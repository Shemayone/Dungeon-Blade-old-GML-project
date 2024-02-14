/// @description Insert description here
// You can write your code in this editor
grid_cell[0]=ds_grid_create(100,100);
grid_cell_act[0]=ds_grid_create(100,100);
grid_cell[1]=ds_grid_create(100,100);
grid_cell_act[1]=ds_grid_create(100,100);
grid_size=32;
grid_level=0
dark_level=0
incr=0.05;
instance_create_layer(mouse_x,mouse_y,"UI_cursor",ui_mouse_cursor);
//UI ini
inventory_screen=false;
inventory_screen_ini=false;
ui_signal=false;
///
old_grid_level=0
selected_tile=noone;
wait_for_input=false;
old_x_mouse_grid=0
old_y_mouse_grid=0

struct_grid_pos=1;
struct_grid=ini_structure_ds(100);
item_grid_pos=1;
item_grid=ini_items_ds(200);
container_grid=noone;
container_grid_pos=1;
ini_player(5,5);
ini_grid_map(grid_cell[0]);
instance_create_layer(0,0,"UI",obj_ui)
sprite_sheet[0]=spr_grass_new;
sprite_sheet[1]=spr_grass_new;
sprite_sheet[10]=spr_stone_wall;
sprite_sheet[11]=spr_stone_wall_close;
sprite_sheet[12]=spr_stone_wall_entrance;
sprite_sheet[13]=spr_stone_wall_entrance;
sprite_sheet[14]=spr_stone_floor;
sprite_sheet[15]=spr_stone_wall_arch;
sprite_sheet[16]=spr_stone_wall_arch;
sprite_sheet_structures[0]=false;
sprite_sheet_structures[1]=spr_statue;
sprite_sheet_structures[2]=spr_chest;
sprite_sheet_structures[3]=spr_sarcophagus;
sprite_sheet_structures[4]=spr_door;
sprite_sheet_items[0]=spr_i_arm_chainmail_2;
sprite_sheet_items[1]=spr_i_sword;
sprite_sheet_items[2]=spr_i_torch;
sprite_sheet_items[3]=spr_i_bag;
sprite_sheet_items_inv[0]=spr_i_arm_chainmail_inv;
sprite_sheet_items_inv[1]=spr_i_sword_inv;
sprite_sheet_items_inv[2]=spr_i_torch_inv;
sprite_sheet_items_inv[3]=spr_i_bag;
omni_drag=false;
instance_create_layer(0,0,"UI",w_camera);
alarm[0]=60;

///player inventory hardcoded
var slot;
slot[0]=make_item_sword(0,0,0,1,0,"inventory");
slot[1]=make_item_bag(0,0,0,3,0,"inventory");
obj_pc.char_slot[0]=slot[0];
obj_pc.char_slot[3]=slot[1];

add_item_to_container(container_grid[1],make_item_sword(0,0,0,1,0,"container"))
add_item_to_container(container_grid[1],make_item_chainmail(0,0,0,0,"container"))
make_item_sword(5,5,0,1,0,"ground");
make_item_sword(6,6,0,1,0,"ground");
make_item_sword(6,6,0,1,0,"ground");
make_item_sword(6,6,0,1,0,"ground");
make_item_torch(6,6,0,2,0,"ground");
make_structure_chest(4,4,0,2,0,0);
//make_structure_statue(4,5,0,0,0,0);
//make_structure_statue(6,5,0,0,0,0);
//make_structure_statue(8,5,0,0,0,0);
//make_structure_statue(6,3,0,0,0,0);
//make_barrow_field(100,100,80)
make_barrow_tomb_new(8,8,6,6);
make_barrow_tomb_new(7,20,10,10);
make_barrow_tomb_new(10,40,6,12);
make_barrow_tomb_new(40,40,14,8);
refresh_grid();



///grid cells 0 above, 1 -1 level, 2 -2 level.