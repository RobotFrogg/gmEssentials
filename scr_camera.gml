///scr_camera(0-10 0 is still cam, 10 is lock cam.)
var s = argument0/100;
view_xview = lerp(view_xview,x-(view_wview/2),s)
view_yview = lerp(view_yview,y-(view_hview/2),s)

view_xview = clamp(view_xview,0,room_width-view_wview)
view_yview = clamp(view_yview,0,room_height-view_hview)
