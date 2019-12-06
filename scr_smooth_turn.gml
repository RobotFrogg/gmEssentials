///scr_smooth_turn(current, target, turn_speed)

  //var target_angle = point_direction(x, y, mouse_x, mouse_y);
  //image_angle = scr_smoothTurn(image_angle, target_angle, 4);

var tempdir;
var angle = argument0;
var target_angle = argument1;
var turn_speed = argument2;
var diff = abs(target_angle-angle);
if (diff > 180)
{
    if (target_angle > 180)
    {
        tempdir = target_angle - 360;
        if (abs(tempdir-angle ) > turn_speed)
        {
            angle -= turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
    else
    {
        tempdir = target_angle + 360;
        if (abs(tempdir-angle) > turn_speed)
        {
            angle += turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
}
else
{
    if (diff > turn_speed)
    {
        if (target_angle > angle)
        {
            angle += turn_speed;
        }
        else
        {
            angle -= turn_speed;
        }
    }
    else
    {
        angle = target_angle;
    }
}
return angle;
