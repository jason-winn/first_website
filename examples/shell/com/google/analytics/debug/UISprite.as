package com.google.analytics.debug
{
    import flash.display.*;
    import flash.events.*;

    public class UISprite extends Sprite
    {
        private var _forcedWidth:uint;
        public var margin:Margin;
        protected var alignTarget:DisplayObject;
        protected var listenResize:Boolean;
        public var alignement:Align;
        private var _forcedHeight:uint;

        public function UISprite(param1:DisplayObject = null)
        {
            listenResize = false;
            alignement = Align.none;
            this.alignTarget = param1;
            margin = new Margin();
            addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
            return;
        }// end function

        public function get forcedHeight() : uint
        {
            if (_forcedHeight)
            {
                return _forcedHeight;
            }
            return height;
        }// end function

        private function _onAddedToStage(event:Event) : void
        {
            layout();
            resize();
            return;
        }// end function

        protected function dispose() : void
        {
            var _loc_1:DisplayObject = null;
            var _loc_2:int = 0;
            while (_loc_2 < numChildren)
            {
                
                _loc_1 = getChildAt(_loc_2);
                if (_loc_1)
                {
                    removeChild(_loc_1);
                }
                _loc_2++;
            }
            return;
        }// end function

        public function set forcedHeight(param1:uint) : void
        {
            _forcedHeight = param1;
            return;
        }// end function

        public function set forcedWidth(param1:uint) : void
        {
            _forcedWidth = param1;
            return;
        }// end function

        protected function layout() : void
        {
            return;
        }// end function

        public function get forcedWidth() : uint
        {
            if (_forcedWidth)
            {
                return _forcedWidth;
            }
            return width;
        }// end function

        public function alignTo(param1:Align, param2:DisplayObject = null) : void
        {
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            var _loc_7:UISprite = null;
            if (param2 == null)
            {
                if (parent is Stage)
                {
                    param2 = this.stage;
                }
                else
                {
                    param2 = parent;
                }
            }
            if (param2 == this.stage)
            {
                if (this.stage == null)
                {
                    return;
                }
                _loc_3 = this.stage.stageHeight;
                _loc_4 = this.stage.stageWidth;
                _loc_5 = 0;
                _loc_6 = 0;
            }
            else
            {
                _loc_7 = param2 as UISprite;
                if (_loc_7.forcedHeight)
                {
                    _loc_3 = _loc_7.forcedHeight;
                }
                else
                {
                    _loc_3 = _loc_7.height;
                }
                if (_loc_7.forcedWidth)
                {
                    _loc_4 = _loc_7.forcedWidth;
                }
                else
                {
                    _loc_4 = _loc_7.width;
                }
                _loc_5 = 0;
                _loc_6 = 0;
            }
            switch(param1)
            {
                case Align.top:
                {
                    x = _loc_4 / 2 - forcedWidth / 2;
                    y = _loc_6 + margin.top;
                    break;
                }
                case Align.bottom:
                {
                    x = _loc_4 / 2 - forcedWidth / 2;
                    y = _loc_6 + _loc_3 - forcedHeight - margin.bottom;
                    break;
                }
                case Align.left:
                {
                    x = _loc_5 + margin.left;
                    y = _loc_3 / 2 - forcedHeight / 2;
                    break;
                }
                case Align.right:
                {
                    x = _loc_5 + _loc_4 - forcedWidth - margin.right;
                    y = _loc_3 / 2 - forcedHeight / 2;
                    break;
                }
                case Align.center:
                {
                    x = _loc_4 / 2 - forcedWidth / 2;
                    y = _loc_3 / 2 - forcedHeight / 2;
                    break;
                }
                case Align.topLeft:
                {
                    x = _loc_5 + margin.left;
                    y = _loc_6 + margin.top;
                    break;
                }
                case Align.topRight:
                {
                    x = _loc_5 + _loc_4 - forcedWidth - margin.right;
                    y = _loc_6 + margin.top;
                    break;
                }
                case Align.bottomLeft:
                {
                    x = _loc_5 + margin.left;
                    y = _loc_6 + _loc_3 - forcedHeight - margin.bottom;
                    break;
                }
                case Align.bottomRight:
                {
                    x = _loc_5 + _loc_4 - forcedWidth - margin.right;
                    y = _loc_6 + _loc_3 - forcedHeight - margin.bottom;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (!listenResize && param1 != Align.none)
            {
                param2.addEventListener(Event.RESIZE, onResize, false, 0, true);
                listenResize = true;
            }
            this.alignement = param1;
            this.alignTarget = param2;
            return;
        }// end function

        private function _onRemovedFromStage(event:Event) : void
        {
            removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
            removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
            dispose();
            return;
        }// end function

        public function resize() : void
        {
            if (alignement != Align.none)
            {
                alignTo(alignement, alignTarget);
            }
            return;
        }// end function

        protected function onResize(event:Event) : void
        {
            resize();
            return;
        }// end function

    }
}
