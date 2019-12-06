///scr_player_physics(obj_solid);
m_pressD = mouse_check_button_pressed(mb_left);
m_pressR = mouse_check_button_released(mb_left);
onGround = place_meeting(x,y+1,argument0);

///     LEAPING - CHARACTER MOVMENT     ///

if(mouse_check_button_released(mb_left)&& !leaping)
{
    leaping = true;
    leap_t = 0;
    p_dir = point_direction(x,y,mouse_x,mouse_y);
    direction = p_dir;
}

if(leaping)
{
    //leaping code
    image_index = 1;
    spd_def += spd_acc;
    
    leap_t ++;
    if(place_meeting(x+spd_def,y,argument0))
    {
        spd_def = -spd_def+30;
        spd_def = 0;
        
        leaping = false;
        
    }


}

speed = clamp(spd_def,0,spd_MAX);

///     COLLISION - CHARACTER MOVMENT       ///

















