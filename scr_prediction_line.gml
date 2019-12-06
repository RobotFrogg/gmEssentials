mx = mouse_x;
my = mouse_y; 

draw_set_colour(c_white);
var dir=point_direction(x,y,mouse_x,mouse_y);
len=500;
draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir));




