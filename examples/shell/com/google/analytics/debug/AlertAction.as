package com.google.analytics.debug
{

    public class AlertAction extends Object
    {
        public var container:Alert;
        private var _callback:Object;
        public var activator:String;
        public var name:String;

        public function AlertAction(param1:String, param2:String, param3)
        {
            this.name = param1;
            this.activator = param2;
            _callback = param3;
            return;
        }// end function

        public function execute() : void
        {
            if (_callback)
            {
                if (_callback is Function)
                {
                    this._callback as Function();
                }
                else if (_callback is String)
                {
                    var _loc_1:* = container;
                    _loc_1.container[_callback]();
                }
            }
            return;
        }// end function

    }
}
