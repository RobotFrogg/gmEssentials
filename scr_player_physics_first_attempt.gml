///scr_player_physics(obj_solid);
m_pressD = mouse_check_button_pressed(mb_left);
m_pressR = mouse_check_button_released(mb_left);
onGround = place_meeting(x,y+1,argument0);


if (m_pressD)
{
    image_index = 1;
    p_dir = point_direction(x,y,mouse_x,mouse_y);
    
}else if (m_pressR)
{
    image_index = 1;
    direction = p_dir;
}
    p_spd += p_spd_acc;
    p_spd = clamp(p_spd,p_spd,p_spd_MAX);
    speed = p_spd





//p_spd += p_spd_acc;
//speed = clamp(p_spd,p_spd,p_spd_MAX);

 //if near wall slow untill stop

    if (place_meeting(x+speed,y,argument0))
    {
        var numPix = sign(speed);
        while (!place_meeting(x+numPix,y,argument0)) x += numPix;
        p_spd = 0;
    }
    //Update
    speed = p_spd;
    
    //vertical
    if (place_meeting(x,y+speed,argument0))
    {
        var numPix = sign(speed);
        while (!place_meeting(x,y+numPix,argument0)) y += numPix;     
        p_spd = 0;
    }
    //Update
    speed = p_spd

