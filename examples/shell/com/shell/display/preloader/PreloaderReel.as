package com.shell.display.preloader
{
    import assets.preloader.*;
    import flash.events.*;

    public class PreloaderReel extends PreloaderReelAsset
    {
        private var _value:Number;

        public function PreloaderReel()
        {
            stop();
            reelValue = 0;
            addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
            return;
        }// end function

        private function onEnterFrame(event:Event) : void
        {
            var _loc_2:* = Math.ceil(_value * totalFrames);
            var _loc_3:int = 1;
            if (_loc_2 == 0)
            {
                _loc_2 = 1;
            }
            if (_loc_2 < currentFrame && currentFrame == totalFrames)
            {
                gotoAndStop(1);
            }
            else
            {
                gotoAndStop(_loc_2);
            }
            return;
        }// end function

        public function set reelValue(param1:Number) : void
        {
            _value = param1;
            return;
        }// end function

        public function get reelValue() : Number
        {
            return _value;
        }// end function

    }
}
