/// PLAYER MOVMENT & POSITIONING ///


//dashing (copy to script later)
m_pressD = mouse_check_button_pressed(mb_left);     //Check for mouse press
m_pressR = mouse_check_button_released(mb_left);    //check for mouse released

    debr =keyboard_check(vk_space);                 //debug, resets dashing.

//positioning       -
//onTop = place_meeting(x, y-1, argument0);               
onGround = place_meeting(x, y+1, argument0);
//onLeft = place_meeting(x+1, y, argument0); //player wall
//onRight = place_meeting(x-1, y, argument0);  //wall player




        /// GRAVITY FALLING STUFF ///
if !onGround
{
    var count  = stick_count;
    count--;
    if count <= 0
    {
        grav = true;
    }
    
}else
{
    grav = false;
}

if grav = true
{
    y += grav;
}


if !dashing
{
    if m_pressD && !dashing
    {   
            /// LANDING CALCULATION GOES HERE LATER ///
    
    
    
    }else if m_pressR
    {
        mx = mouse_x;
        my = mouse_y; 
        
        start_x = x;
        start_y = y;
        movement_direction = point_direction(start_x, start_y, mx, my)
        dashing = true;
        image_index = 1;
    }
}



if dashing
{

    move_speed += acc_speed;
    
    final_xspeed = lengthdir_x(clamp(move_speed,min_speed,max_speed), movement_direction)
    
    final_yspeed = lengthdir_y(clamp(move_speed,min_speed,max_speed), movement_direction)


    
    
    
}else if !dashing
{
    final_xspeed = 0;
    final_yspeed = 0;
    move_speed = 8;
    image_index = 0;
    movement_direction = movement_direction;
}

//speed update

    x += final_xspeed;
    y += final_yspeed;
    
/*//debug//*/        if debr dashing = false;



    if (place_meeting(x+final_xspeed,y,argument0))
    {
        var numPix = sign(final_xspeed);
        while (!place_meeting(x+numPix,y,argument0)) x += numPix;
        dashing = false;
        final_xspeed = 0;
        final_yspeed = 0;
        
    }
    //Update hsp
    x += final_xspeed;
    
    //vertical
    if (place_meeting(x,y+final_yspeed,argument0))
    {
        var numPix = sign(final_yspeed);
        while (!place_meeting(x,y+numPix,argument0)) y += numPix;     
        dashing = false;
        final_xspeed = 0;
        final_yspeed = 0;
        
    }
    //Update vsp
    y += final_yspeed;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*if ( ! place_free (x,y) && image_xscale = 1)
    {
        show_debug_message("WALL OVERLAPING RIGHT !!!");
        x -= 1;
    }
    else if ( ! place_free (x,y) && image_xscale = -1)
    {
        show_debug_message("WALL OVERLAPING LEFT !!!");
        x += 1;
    }






                /*    
    ///     COLLISION STUFF     ///
    
    sprite_bbox_top = bbox_top - y;
    sprite_bbox_bottom = bbox_bottom - y;
    sprite_bbox_right = bbox_right - x;
    sprite_bbox_left = bbox_left - x;
    
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
    }
  
































