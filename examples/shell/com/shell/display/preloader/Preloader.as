package com.shell.display.preloader
{
    import assets.preloader.*;
    import com.indusblue.utils.*;
    import flash.display.*;

    public class Preloader extends Sprite
    {
        private var _percentReel:PreloaderPercentAsset;
        private var _onesReel:PreloaderReel;
        private var _tensReel:PreloaderReel;
        private var _percentage:int;
        private var _hundredsReel:PreloaderReel;

        public function Preloader()
        {
            var _loc_1:* = new PreloaderReel();
            _hundredsReel = new PreloaderReel();
            addChild(_loc_1);
            var _loc_1:* = new PreloaderReel();
            _tensReel = new PreloaderReel();
            addChild(_loc_1);
            _tensReel.x = _hundredsReel.width + 2;
            var _loc_1:* = new PreloaderReel();
            _onesReel = new PreloaderReel();
            addChild(_loc_1);
            _onesReel.x = _tensReel.x + _tensReel.width + 2;
            var _loc_1:* = new PreloaderPercentAsset();
            _percentReel = new PreloaderPercentAsset();
            addChild(_loc_1);
            _percentReel.x = _onesReel.x + _onesReel.width + 2;
            percentage = 0;
            return;
        }// end function

        public function set percentage(param1:int) : void
        {
            var _loc_2:Number = NaN;
            _percentage = param1;
            _loc_2 = 1.1;
            var _loc_3:* = StringUtils.zeroPad(String(_percentage), 3);
            var _loc_4:* = parseFloat(_loc_3.charAt(2)) / 10;
            var _loc_5:* = (parseFloat(_loc_3.charAt(1)) + _loc_4) / 10;
            var _loc_6:* = (parseFloat(_loc_3.charAt(0)) + _loc_5) / 10;
            _onesReel.reelValue = _loc_4;
            _tensReel.reelValue = _loc_5;
            _hundredsReel.reelValue = _hundredsReel.reelValue + (_loc_6 - _hundredsReel.reelValue) / _loc_2;
            return;
        }// end function

        public function get percentage() : int
        {
            return _percentage;
        }// end function

    }
}
