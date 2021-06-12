package com.google.analytics.debug
{
    import com.google.analytics.core.*;
    import flash.net.*;
    import flash.utils.*;

    public class DebugConfiguration extends Object
    {
        public var showHideKey:Number = 32;
        private var _mode:VisualDebugMode;
        private var _verbose:Boolean = false;
        public var destroyKey:Number = 8;
        public var GIFRequests:Boolean = false;
        public var showInfos:Boolean = true;
        public var infoTimeout:Number = 1000;
        public var minimizedOnStart:Boolean = false;
        private var _active:Boolean = false;
        public var traceOutput:Boolean = false;
        public var layout:ILayout;
        public var warningTimeout:Number = 1500;
        public var javascript:Boolean = false;
        public var showWarnings:Boolean = true;
        private var _visualInitialized:Boolean = false;

        public function DebugConfiguration()
        {
            _mode = VisualDebugMode.basic;
            return;
        }// end function

        public function get verbose() : Boolean
        {
            return _verbose;
        }// end function

        public function set verbose(param1:Boolean) : void
        {
            _verbose = param1;
            return;
        }// end function

        public function set mode(param1) : void
        {
            if (param1 is String)
            {
                switch(param1)
                {
                    case "geek":
                    {
                        param1 = VisualDebugMode.geek;
                        break;
                    }
                    case "advanced":
                    {
                        param1 = VisualDebugMode.advanced;
                        break;
                    }
                    case "basic":
                    default:
                    {
                        param1 = VisualDebugMode.basic;
                        break;
                    }
                }
            }
            _mode = param1;
            return;
        }// end function

        public function success(param1:String) : void
        {
            if (layout)
            {
                layout.createSuccessAlert(param1);
            }
            if (traceOutput)
            {
                trace("[+] " + param1 + " !!");
            }
            return;
        }// end function

        public function get active() : Boolean
        {
            return _active;
        }// end function

        private function _initializeVisual() : void
        {
            if (layout)
            {
                layout.init();
                _visualInitialized = true;
            }
            return;
        }// end function

        private function _destroyVisual() : void
        {
            if (layout && _visualInitialized)
            {
                layout.destroy();
            }
            return;
        }// end function

        public function warning(param1:String, param2:VisualDebugMode = null) : void
        {
            if (_filter(param2))
            {
                return;
            }
            if (layout && showWarnings)
            {
                layout.createWarning(param1);
            }
            if (traceOutput)
            {
                trace("## " + param1 + " ##");
            }
            return;
        }// end function

        private function _filter(param1:VisualDebugMode = null) : Boolean
        {
            return param1 && int(param1) >= int(this.mode);
        }// end function

        public function failure(param1:String) : void
        {
            if (layout)
            {
                layout.createFailureAlert(param1);
            }
            if (traceOutput)
            {
                trace("[-] " + param1 + " !!");
            }
            return;
        }// end function

        public function get mode()
        {
            return _mode;
        }// end function

        public function set active(param1:Boolean) : void
        {
            _active = param1;
            if (_active)
            {
                _initializeVisual();
            }
            else
            {
                _destroyVisual();
            }
            return;
        }// end function

        protected function trace(param1:String) : void
        {
            var _loc_7:Array = null;
            var _loc_8:int = 0;
            var _loc_2:Array = [];
            var _loc_3:String = "";
            var _loc_4:String = "";
            if (this.mode == VisualDebugMode.geek)
            {
                _loc_3 = getTimer() + " - ";
                _loc_4 = new Array(_loc_3.length).join(" ") + " ";
            }
            if (param1.indexOf("\n") > -1)
            {
                _loc_7 = param1.split("\n");
                _loc_8 = 0;
                while (_loc_8 < _loc_7.length)
                {
                    
                    if (_loc_7[_loc_8] == "")
                    {
                    }
                    else if (_loc_8 == 0)
                    {
                        _loc_2.push(_loc_3 + _loc_7[_loc_8]);
                    }
                    else
                    {
                        _loc_2.push(_loc_4 + _loc_7[_loc_8]);
                    }
                    _loc_8++;
                }
            }
            else
            {
                _loc_2.push(_loc_3 + param1);
            }
            var _loc_5:* = _loc_2.length;
            var _loc_6:int = 0;
            while (_loc_6 < _loc_5)
            {
                
                trace(_loc_2[_loc_6]);
                _loc_6++;
            }
            return;
        }// end function

        public function alert(param1:String) : void
        {
            if (layout)
            {
                layout.createAlert(param1);
            }
            if (traceOutput)
            {
                trace("!! " + param1 + " !!");
            }
            return;
        }// end function

        public function info(param1:String, param2:VisualDebugMode = null) : void
        {
            if (_filter(param2))
            {
                return;
            }
            if (layout && showInfos)
            {
                layout.createInfo(param1);
            }
            if (traceOutput)
            {
                trace(param1);
            }
            return;
        }// end function

        public function alertGifRequest(param1:String, param2:URLRequest, param3:GIFRequest) : void
        {
            if (layout)
            {
                layout.createGIFRequestAlert(param1, param2, param3);
            }
            if (traceOutput)
            {
                trace(">> " + param1 + " <<");
            }
            return;
        }// end function

    }
}
