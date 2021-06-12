package com.google.analytics.debug
{
    import flash.events.*;
    import flash.ui.*;

    public class Debug extends Label
    {
        private var _lines:Array;
        private var _preferredForcedWidth:uint = 540;
        private var _linediff:int = 0;
        public var maxLines:uint = 16;
        public static var count:uint;

        public function Debug(param1:uint = 0, param2:Align = null, param3:Boolean = false)
        {
            if (param2 == null)
            {
                param2 = Align.bottom;
            }
            super("", "uiLabel", param1, param2, param3);
            this.name = "Debug" + count++;
            _lines = [];
            selectable = true;
            addEventListener(KeyboardEvent.KEY_DOWN, onKey);
            return;
        }// end function

        public function writeBold(param1:String) : void
        {
            write(param1, true);
            return;
        }// end function

        private function _getLinesToDisplay(param1:int = 0) : Array
        {
            var _loc_2:Array = null;
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            if ((_lines.length - 1) > maxLines)
            {
                if (_linediff <= 0)
                {
                    _linediff = _linediff + param1;
                }
                else if (_linediff > 0 && param1 < 0)
                {
                    _linediff = _linediff + param1;
                }
                _loc_3 = _lines.length - maxLines + _linediff;
                _loc_4 = _loc_3 + maxLines;
                _loc_2 = _lines.slice(_loc_3, _loc_4);
            }
            else
            {
                _loc_2 = _lines;
            }
            return _loc_2;
        }// end function

        private function onKey(event:KeyboardEvent = null) : void
        {
            var _loc_2:Array = null;
            switch(event.keyCode)
            {
                case Keyboard.DOWN:
                {
                    _loc_2 = _getLinesToDisplay(1);
                    break;
                }
                case Keyboard.UP:
                {
                    _loc_2 = _getLinesToDisplay(-1);
                    break;
                }
                default:
                {
                    _loc_2 = null;
                    break;
                }
            }
            if (_loc_2 == null)
            {
                return;
            }
            text = _loc_2.join("\n");
            return;
        }// end function

        override public function get forcedWidth() : uint
        {
            if (this.parent)
            {
                if (UISprite(this.parent).forcedWidth > _preferredForcedWidth)
                {
                    return _preferredForcedWidth;
                }
                return UISprite(this.parent).forcedWidth;
            }
            else
            {
                return super.forcedWidth;
            }
        }// end function

        public function write(param1:String, param2:Boolean = false) : void
        {
            var _loc_3:Array = null;
            if (param1.indexOf("") > -1)
            {
                _loc_3 = param1.split("\n");
            }
            else
            {
                _loc_3 = [param1];
            }
            var _loc_4:String = "";
            var _loc_5:String = "";
            if (param2)
            {
                _loc_4 = "<b>";
                _loc_5 = "</b>";
            }
            var _loc_6:int = 0;
            while (_loc_6 < _loc_3.length)
            {
                
                _lines.push(_loc_4 + _loc_3[_loc_6] + _loc_5);
                _loc_6++;
            }
            var _loc_7:* = _getLinesToDisplay();
            text = _loc_7.join("\n");
            return;
        }// end function

        public function close() : void
        {
            dispose();
            return;
        }// end function

        override protected function dispose() : void
        {
            removeEventListener(KeyboardEvent.KEY_DOWN, onKey);
            super.dispose();
            return;
        }// end function

    }
}
