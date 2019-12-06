/// PLAYER MOVMENT & POSITIONING ///


//dashing (copy to script later)
m_pressD = mouse_check_button_pressed(mb_left);     //Check for mouse press
m_pressR = mouse_check_button_released(mb_left);    //check for mouse released

    debr =keyboard_check(vk_space);                 //debug, resets dashing.

//positioning       -
onTop = place_meeting(x, y-1, argument0);               
onBottom = place_meeting(x, y+1, argument0);
onLeft = place_meeting(x+1, y, argument0); //player wall
onRight = place_meeting(x-1, y, argument0);  //wall player





if m_pressD && !dashing
{   
        /// LANDING CALCULATION GOES HERE LATER ///


    
}else if m_pressR
{
    mx = mouse_x;
    my = mouse_y; 
    
    _start_x = x;
    _start_y = y;
    _movement_direction = point_direction(_start_x, _start_y, mx, my)
    dashing = true;
    image_index = 1;
}

if dashing
{

    _move_speed += acc_speed;
    
    final_xspeed = lengthdir_x(clamp(_move_speed,min_speed,max_speed), _movement_direction)
    
    final_yspeed = lengthdir_y(clamp(_move_speed,min_speed,max_speed), _movement_direction)


    
    
    
}else
{
    final_xspeed = 0;
    final_yspeed = 0;
    _move_speed = 8;
    image_index = 0;
}


    x += final_xspeed;
    
    y += final_yspeed;
    


    

                /*//debut//*/        if debr dashing = false;






///     COLLISION STUFF     ///
    

    
    /*sprite_bbox_top = bbox_top - y;
    sprite_bbox_bottom = bbox_bottom - y;
    sprite_bbox_right = bbox_right - x;
    sprite_bbox_left = bbox_left - x;*/
    var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
    var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
    var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
    var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
    
    //Horizontal collisions
    x += final_xspeed;
    
    //Snap
    if place_meeting(x, y, argument0) 
    { 
        var wall = instance_place(x,y,argument0); 
        if (final_xspeed > 0) 
        { //right
            
            x = (wall.bbox_left-1) - sprite_bbox_right;
        } else if (final_xspeed < 0) 
        { //left
            x = (wall.bbox_right+1)-sprite_bbox_left;
        }

            
            dashing = false;
            //x-= sign(_move_speed);
    }
    
    //Vertical collisions
    y += final_yspeed;
    
    //Snap
    if place_meeting(x, y, argument0) 
    {
        var wall = instance_place(x, y, argument0);
        if (final_yspeed > 0) 
        { //down
            y = (wall.bbox_top-1) - sprite_bbox_bottom;
        } else if (final_yspeed < 0) 
        { //up
            y = (wall.bbox_bottom+1) - sprite_bbox_top;
        }


            
            dashing = false;
            //y+=sign(_move_speed);


    }
    
    
    

    

