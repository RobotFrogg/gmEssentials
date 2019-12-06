/// PLAYER MOVMENT & POSITIONING ///


//dashing (copy to script later)

m_pressD = mouse_check_button_pressed(mb_left);     //Check for mouse press
m_pressR = mouse_check_button_released(mb_left);    //check for mouse released

    debr =keyboard_check(vk_space);                 //debug, resets dashing.
    rest =keyboard_check(ord('R'))
//positioning       -
//onTop = place_meeting(x, y-1, argument0);               
onGround = place_meeting(x, y+1, argument0);
//onLeft = place_meeting(x+1, y, argument0); //player wall
//onRight = place_meeting(x-1, y, argument0);  //wall player



if !dashing
{

    if m_pressR
    {
        mx = mouse_x;
        my = mouse_y; 
        movement_direction = point_direction(x,y, mx, my)
        dashing = true;
        move_speed=10;
        image_index = 1;
        show_debug_message("move speed set to 8 ");
    }

}




/*//debug//*/       
if debr 
  dashing = false;
if rest 
  room_restart();


//MOVE CODE MOVE CODE MOVE CODE MOVE CODE//
if move_speed>0
  move_speed += acc_speed;




final_xspeed = lengthdir_x(clamp(move_speed,min_speed,max_speed), movement_direction);
final_yspeed = lengthdir_y(clamp(move_speed,min_speed,max_speed), movement_direction);
show_debug_message(string(final_xspeed) + "   :   " + string(final_yspeed) );


if !place_meeting(x+final_xspeed,y+final_yspeed,argument0) {
    
    x+=final_xspeed;
    y+=final_yspeed;
    show_debug_message("just made good move");
}
else if place_meeting(x+final_xspeed,y+final_yspeed,argument0) {
  if abs(final_xspeed)>=abs(final_yspeed) {
     final_yspeed=final_yspeed/(abs(final_xspeed));
     final_xspeed=sign(final_xspeed);
  }
  else {
     final_xspeed=final_xspeed/(abs(final_yspeed));
     final_yspeed=sign(final_yspeed);
  }
  
  show_debug_message("nudging --> " + string(final_xspeed) + " : " + string(final_yspeed));
  
  
  while !place_meeting(x+final_xspeed, y+final_yspeed, argument0) {
     x+=final_xspeed;
     y+=final_yspeed;
  }
  
  move_speed=0;
  dashing=false;
  image_index = 0;
  
}

     
