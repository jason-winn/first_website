package com.google.analytics.debug
{
    import com.google.analytics.*;
    import com.google.analytics.core.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    public class Layout extends Object implements ILayout
    {
        private var _display:DisplayObject;
        private var _infoQueue:Array;
        private var _maxCharPerLine:int = 85;
        private var _hasInfo:Boolean;
        private var _warningQueue:Array;
        private var _hasDebug:Boolean;
        private var _hasWarning:Boolean;
        private var _mainPanel:Panel;
        private var _GRAlertQueue:Array;
        private var _debug:DebugConfiguration;
        public var visualDebug:Debug;
        private var _hasGRAlert:Boolean;

        public function Layout(param1:DebugConfiguration, param2:DisplayObject)
        {
            _display = param2;
            _debug = param1;
            _hasWarning = false;
            _hasInfo = false;
            _hasDebug = false;
            _hasGRAlert = false;
            _warningQueue = [];
            _infoQueue = [];
            _GRAlertQueue = [];
            return;
        }// end function

        private function onKey(event:KeyboardEvent = null) : void
        {
            switch(event.keyCode)
            {
                case _debug.showHideKey:
                {
                    _mainPanel.visible = !_mainPanel.visible;
                    break;
                }
                case _debug.destroyKey:
                {
                    destroy();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function createWarning(param1:String) : void
        {
            if (_hasWarning || !isAvailable())
            {
                _warningQueue.push(param1);
                return;
            }
            param1 = _filterMaxChars(param1);
            _hasWarning = true;
            var _loc_2:* = new Warning(param1, _debug.warningTimeout);
            addToPanel("analytics", _loc_2);
            _loc_2.addEventListener(Event.REMOVED_FROM_STAGE, _clearWarning, false, 0, true);
            if (_hasDebug)
            {
                visualDebug.writeBold(param1);
            }
            return;
        }// end function

        public function bringToFront(param1:DisplayObject) : void
        {
            _display.stage.setChildIndex(param1, (_display.stage.numChildren - 1));
            return;
        }// end function

        public function createFailureAlert(param1:String) : void
        {
            var _loc_2:AlertAction = null;
            if (_debug.verbose)
            {
                param1 = _filterMaxChars(param1);
                _loc_2 = new AlertAction("Close", "close", "close");
            }
            else
            {
                _loc_2 = new AlertAction("X", "close", "close");
            }
            var _loc_3:* = new FailureAlert(_debug, param1, [_loc_2]);
            addToPanel("analytics", _loc_3);
            if (_hasDebug)
            {
                if (_debug.verbose)
                {
                    param1 = param1.split("\n").join("");
                    param1 = _filterMaxChars(param1, 66);
                }
                visualDebug.writeBold(param1);
            }
            return;
        }// end function

        public function init() : void
        {
            var _loc_1:int = 10;
            var _loc_2:* = _display.stage.stageWidth - _loc_1 * 2;
            var _loc_3:* = _display.stage.stageHeight - _loc_1 * 2;
            var _loc_4:* = new Panel("analytics", _loc_2, _loc_3);
            new Panel("analytics", _loc_2, _loc_3).alignement = Align.top;
            _loc_4.stickToEdge = false;
            _loc_4.title = "Google Analytics v" + GATracker.version;
            _mainPanel = _loc_4;
            addToStage(_loc_4);
            bringToFront(_loc_4);
            if (_debug.minimizedOnStart)
            {
                _mainPanel.onToggle();
            }
            createVisualDebug();
            _display.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey, false, 0, true);
            return;
        }// end function

        public function addToPanel(param1:String, param2:DisplayObject) : void
        {
            var _loc_4:Panel = null;
            var _loc_3:* = _display.stage.getChildByName(param1);
            if (_loc_3)
            {
                _loc_4 = _loc_3 as Panel;
                _loc_4.addData(param2);
            }
            else
            {
                trace("panel \"" + param1 + "\" not found");
            }
            return;
        }// end function

        private function _clearInfo(event:Event) : void
        {
            _hasInfo = false;
            if (_infoQueue.length > 0)
            {
                createInfo(_infoQueue.shift());
            }
            return;
        }// end function

        private function _filterMaxChars(param1:String, param2:int = 0) : String
        {
            var _loc_6:String = null;
            var _loc_3:String = "\n";
            var _loc_4:Array = [];
            var _loc_5:* = param1.split(_loc_3);
            if (param2 == 0)
            {
                param2 = _maxCharPerLine;
            }
            var _loc_7:int = 0;
            while (_loc_7 < _loc_5.length)
            {
                
                _loc_6 = _loc_5[_loc_7];
                while (_loc_6.length > param2)
                {
                    
                    _loc_4.push(_loc_6.substr(0, param2));
                    _loc_6 = _loc_6.substring(param2);
                }
                _loc_4.push(_loc_6);
                _loc_7++;
            }
            return _loc_4.join(_loc_3);
        }// end function

        private function _clearGRAlert(event:Event) : void
        {
            _hasGRAlert = false;
            if (_GRAlertQueue.length > 0)
            {
                createGIFRequestAlert.apply(this, _GRAlertQueue.shift());
            }
            return;
        }// end function

        public function createSuccessAlert(param1:String) : void
        {
            var _loc_2:AlertAction = null;
            if (_debug.verbose)
            {
                param1 = _filterMaxChars(param1);
                _loc_2 = new AlertAction("Close", "close", "close");
            }
            else
            {
                _loc_2 = new AlertAction("X", "close", "close");
            }
            var _loc_3:* = new SuccessAlert(_debug, param1, [_loc_2]);
            addToPanel("analytics", _loc_3);
            if (_hasDebug)
            {
                if (_debug.verbose)
                {
                    param1 = param1.split("\n").join("");
                    param1 = _filterMaxChars(param1, 66);
                }
                visualDebug.writeBold(param1);
            }
            return;
        }// end function

        public function isAvailable() : Boolean
        {
            return _display.stage != null;
        }// end function

        public function createAlert(param1:String) : void
        {
            param1 = _filterMaxChars(param1);
            var _loc_2:* = new Alert(param1, [new AlertAction("Close", "close", "close")]);
            addToPanel("analytics", _loc_2);
            if (_hasDebug)
            {
                visualDebug.writeBold(param1);
            }
            return;
        }// end function

        public function createInfo(param1:String) : void
        {
            if (_hasInfo || !isAvailable())
            {
                _infoQueue.push(param1);
                return;
            }
            param1 = _filterMaxChars(param1);
            _hasInfo = true;
            var _loc_2:* = new Info(param1, _debug.infoTimeout);
            addToPanel("analytics", _loc_2);
            _loc_2.addEventListener(Event.REMOVED_FROM_STAGE, _clearInfo, false, 0, true);
            if (_hasDebug)
            {
                visualDebug.write(param1);
            }
            return;
        }// end function

        public function createGIFRequestAlert(param1:String, param2:URLRequest, param3:GIFRequest) : void
        {
            var message:* = param1;
            var request:* = param2;
            var ref:* = param3;
            if (_hasGRAlert)
            {
                _GRAlertQueue.push([message, request, ref]);
                return;
            }
            _hasGRAlert = true;
            var f:* = function () : void
            {
                ref.sendRequest(request);
                return;
            }// end function
            ;
            message = _filterMaxChars(message);
            var gra:* = new GIFRequestAlert(message, [new AlertAction("OK", "ok", f), new AlertAction("Cancel", "cancel", "close")]);
            addToPanel("analytics", gra);
            gra.addEventListener(Event.REMOVED_FROM_STAGE, _clearGRAlert, false, 0, true);
            if (_hasDebug)
            {
                if (_debug.verbose)
                {
                    message = message.split("\n").join("");
                    message = _filterMaxChars(message, 66);
                }
                visualDebug.write(message);
            }
            return;
        }// end function

        public function createVisualDebug() : void
        {
            if (!visualDebug)
            {
                visualDebug = new Debug();
                visualDebug.alignement = Align.bottom;
                visualDebug.stickToEdge = true;
                addToPanel("analytics", visualDebug);
                _hasDebug = true;
            }
            return;
        }// end function

        public function addToStage(param1:DisplayObject) : void
        {
            _display.stage.addChild(param1);
            return;
        }// end function

        private function _clearWarning(event:Event) : void
        {
            _hasWarning = false;
            if (_warningQueue.length > 0)
            {
                createWarning(_warningQueue.shift());
            }
            return;
        }// end function

        public function createPanel(param1:String, param2:uint, param3:uint) : void
        {
            var _loc_4:* = new Panel(param1, param2, param3);
            new Panel(param1, param2, param3).alignement = Align.center;
            _loc_4.stickToEdge = false;
            addToStage(_loc_4);
            bringToFront(_loc_4);
            return;
        }// end function

        public function destroy() : void
        {
            _mainPanel.close();
            _debug.layout = null;
            return;
        }// end function

    }
}
