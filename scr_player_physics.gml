///scr_player_physics(obj_solid);
m_pressD = mouse_check_button_pressed(mb_left);
m_pressR = mouse_check_button_released(mb_left);


if m_pressR && !leaping
{
    leaping = true;
    d = point_direction(x,y,mouse_x,mouse_y);
}


if leaping
{
    image_index = 1;
    direction = d
    speed = 3
    
}


