package com.google.analytics.debug
{
    import flash.display.*;
    import flash.events.*;

    public class Panel extends UISprite
    {
        private var _savedH:uint;
        private var _data:UISprite;
        private var _mask:Sprite;
        private var _background:Shape;
        private var _savedW:uint;
        private var _stickToEdge:Boolean;
        private var _border:Shape;
        private var _borderColor:uint;
        protected var baseAlpha:Number;
        private var _backgroundColor:uint;
        private var _title:Label;
        private var _colapsed:Boolean;
        private var _name:String;

        public function Panel(param1:String, param2:uint, param3:uint, param4:uint = 0, param5:uint = 0, param6:Number = 0.3, param7:Align = null, param8:Boolean = false)
        {
            _name = param1;
            this.name = param1;
            this.mouseEnabled = false;
            _colapsed = false;
            forcedWidth = param2;
            forcedHeight = param3;
            this.baseAlpha = param6;
            _background = new Shape();
            _data = new UISprite();
            _data.forcedWidth = param2;
            _data.forcedHeight = param3;
            _data.mouseEnabled = false;
            _title = new Label(param1, "uiLabel", 16777215, Align.topLeft, param8);
            _title.buttonMode = true;
            _title.margin.top = 0.6;
            _title.margin.left = 0.6;
            _title.addEventListener(MouseEvent.CLICK, onToggle);
            _title.mouseChildren = false;
            _border = new Shape();
            _mask = new Sprite();
            _mask.useHandCursor = false;
            _mask.mouseEnabled = false;
            _mask.mouseChildren = false;
            if (param7 == null)
            {
                param7 = Align.none;
            }
            this.alignement = param7;
            this.stickToEdge = param8;
            if (param4 == 0)
            {
                param4 = Style.backgroundColor;
            }
            _backgroundColor = param4;
            if (param5 == 0)
            {
                param5 = Style.borderColor;
            }
            _borderColor = param5;
            return;
        }// end function

        public function get stickToEdge() : Boolean
        {
            return _stickToEdge;
        }// end function

        public function onToggle(event:MouseEvent = null) : void
        {
            if (_colapsed)
            {
                _data.visible = true;
            }
            else
            {
                _data.visible = false;
            }
            _colapsed = !_colapsed;
            _update();
            resize();
            return;
        }// end function

        public function set stickToEdge(param1:Boolean) : void
        {
            _stickToEdge = param1;
            _title.stickToEdge = param1;
            return;
        }// end function

        override protected function dispose() : void
        {
            _title.removeEventListener(MouseEvent.CLICK, onToggle);
            super.dispose();
            return;
        }// end function

        private function _draw() : void
        {
            var _loc_1:uint = 0;
            var _loc_2:uint = 0;
            if (_savedW && _savedH)
            {
                forcedWidth = _savedW;
                forcedHeight = _savedH;
            }
            if (!_colapsed)
            {
                _loc_1 = forcedWidth;
                _loc_2 = forcedHeight;
            }
            else
            {
                _loc_1 = _title.width;
                _loc_2 = _title.height;
                _savedW = forcedWidth;
                _savedH = forcedHeight;
                forcedWidth = _loc_1;
                forcedHeight = _loc_2;
            }
            var _loc_3:* = _background.graphics;
            _loc_3.clear();
            _loc_3.beginFill(_backgroundColor);
            Background.drawRounded(this, _loc_3, _loc_1, _loc_2);
            _loc_3.endFill();
            var _loc_4:* = _data.graphics;
            _data.graphics.clear();
            _loc_4.beginFill(_backgroundColor, 0);
            Background.drawRounded(this, _loc_4, _loc_1, _loc_2);
            _loc_4.endFill();
            var _loc_5:* = _border.graphics;
            _border.graphics.clear();
            _loc_5.lineStyle(0.1, _borderColor);
            Background.drawRounded(this, _loc_5, _loc_1, _loc_2);
            _loc_5.endFill();
            var _loc_6:* = _mask.graphics;
            _mask.graphics.clear();
            _loc_6.beginFill(_backgroundColor);
            Background.drawRounded(this, _loc_6, (_loc_1 + 1), (_loc_2 + 1));
            _loc_6.endFill();
            return;
        }// end function

        public function get title() : String
        {
            return _title.text;
        }// end function

        private function _update() : void
        {
            _draw();
            if (baseAlpha < 1)
            {
                _background.alpha = baseAlpha;
                _border.alpha = baseAlpha;
            }
            return;
        }// end function

        public function addData(param1:DisplayObject) : void
        {
            _data.addChild(param1);
            return;
        }// end function

        override protected function layout() : void
        {
            _update();
            addChild(_background);
            addChild(_data);
            addChild(_title);
            addChild(_border);
            addChild(_mask);
            mask = _mask;
            return;
        }// end function

        public function set title(param1:String) : void
        {
            _title.text = param1;
            return;
        }// end function

        public function close() : void
        {
            dispose();
            if (parent != null)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
