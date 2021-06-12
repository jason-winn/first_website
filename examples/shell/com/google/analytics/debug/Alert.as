package com.google.analytics.debug
{
    import flash.events.*;

    public class Alert extends Label
    {
        public var autoClose:Boolean = true;
        public var actionOnNextLine:Boolean = true;
        private var _actions:Array;

        public function Alert(param1:String, param2:Array, param3:String = "uiAlert", param4:uint = 0, param5:Align = null, param6:Boolean = false, param7:Boolean = true)
        {
            if (param4 == 0)
            {
                param4 = Style.alertColor;
            }
            if (param5 == null)
            {
                param5 = Align.center;
            }
            super(param1, param3, param4, param5, param6);
            this.selectable = true;
            super.mouseChildren = true;
            this.buttonMode = true;
            this.mouseEnabled = true;
            this.useHandCursor = true;
            this.actionOnNextLine = param7;
            _actions = [];
            var _loc_8:int = 0;
            while (_loc_8 < param2.length)
            {
                
                param2[_loc_8].container = this;
                _actions.push(param2[_loc_8]);
                _loc_8++;
            }
            return;
        }// end function

        private function _defineActions() : void
        {
            var _loc_3:AlertAction = null;
            var _loc_1:String = "";
            if (actionOnNextLine)
            {
                _loc_1 = _loc_1 + "\n";
            }
            else
            {
                _loc_1 = _loc_1 + " |";
            }
            _loc_1 = _loc_1 + " ";
            var _loc_2:Array = [];
            var _loc_4:int = 0;
            while (_loc_4 < _actions.length)
            {
                
                _loc_3 = _actions[_loc_4];
                _loc_2.push("<a href=\"event:" + _loc_3.activator + "\">" + _loc_3.name + "</a>");
                _loc_4++;
            }
            _loc_1 = _loc_1 + _loc_2.join(" | ");
            appendText(_loc_1, "uiAlertAction");
            return;
        }// end function

        protected function isValidAction(param1:String) : Boolean
        {
            var _loc_2:int = 0;
            while (_loc_2 < _actions.length)
            {
                
                if (param1 == _actions[_loc_2].activator)
                {
                    return true;
                }
                _loc_2++;
            }
            return false;
        }// end function

        override protected function layout() : void
        {
            super.layout();
            _defineActions();
            return;
        }// end function

        protected function getAction(param1:String) : AlertAction
        {
            var _loc_2:int = 0;
            while (_loc_2 < _actions.length)
            {
                
                if (param1 == _actions[_loc_2].activator)
                {
                    return _actions[_loc_2];
                }
                _loc_2++;
            }
            return null;
        }// end function

        protected function spaces(param1:int) : String
        {
            var _loc_2:String = "";
            var _loc_3:String = "          ";
            var _loc_4:int = 0;
            while (_loc_4 < (param1 + 1))
            {
                
                _loc_2 = _loc_2 + _loc_3;
                _loc_4++;
            }
            return _loc_2;
        }// end function

        override public function onLink(event:TextEvent) : void
        {
            var _loc_2:AlertAction = null;
            if (isValidAction(event.text))
            {
                _loc_2 = getAction(event.text);
                if (_loc_2)
                {
                    _loc_2.execute();
                }
            }
            if (autoClose)
            {
                close();
            }
            return;
        }// end function

        public function close() : void
        {
            if (parent != null)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
