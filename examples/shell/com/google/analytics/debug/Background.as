package com.google.analytics.debug
{
    import flash.display.*;

    public class Background extends Object
    {

        public function Background()
        {
            return;
        }// end function

        public static function drawRounded(param1, param2:Graphics, param3:uint = 0, param4:uint = 0) : void
        {
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            var _loc_7:* = Style.roundedCorner;
            if (param3 > 0 && param4 > 0)
            {
                _loc_5 = param3;
                _loc_6 = param4;
            }
            else
            {
                _loc_5 = param1.width;
                _loc_6 = param1.height;
            }
            switch(param1.alignement)
            {
                case Align.top:
                {
                    break;
                }
                case Align.topLeft:
                {
                    break;
                }
                case Align.topRight:
                {
                    break;
                }
                case Align.bottom:
                {
                    break;
                }
                case Align.bottomLeft:
                {
                    break;
                }
                case Align.bottomRight:
                {
                    break;
                }
                case Align.left:
                {
                    break;
                }
                case Align.right:
                {
                    break;
                }
                case Align.center:
                {
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
