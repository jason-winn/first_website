package com.google.analytics.debug
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class Label extends UISprite
    {
        private var _color:uint;
        private var _background:Shape;
        private var _textField:TextField;
        public var stickToEdge:Boolean;
        private var _text:String;
        protected var selectable:Boolean;
        private var _tag:String;
        public static var count:uint = 0;

        public function Label(param1:String = "", param2:String = "uiLabel", param3:uint = 0, param4:Align = null, param5:Boolean = false)
        {
            this.name = "Label" + count++;
            selectable = false;
            _background = new Shape();
            _textField = new TextField();
            _text = param1;
            _tag = param2;
            if (param4 == null)
            {
                param4 = Align.none;
            }
            this.alignement = param4;
            this.stickToEdge = param5;
            if (param3 == 0)
            {
                param3 = Style.backgroundColor;
            }
            _color = param3;
            _textField.addEventListener(TextEvent.LINK, onLink);
            return;
        }// end function

        public function get tag() : String
        {
            return _tag;
        }// end function

        private function _draw() : void
        {
            var _loc_1:* = _background.graphics;
            _loc_1.clear();
            _loc_1.beginFill(_color);
            var _loc_2:* = _textField.width;
            var _loc_3:* = _textField.height;
            if (forcedWidth > 0)
            {
                _loc_2 = forcedWidth;
            }
            Background.drawRounded(this, _loc_1, _loc_2, _loc_3);
            _loc_1.endFill();
            return;
        }// end function

        public function get text() : String
        {
            return _textField.text;
        }// end function

        public function appendText(param1:String, param2:String = "") : void
        {
            if (param1 == "")
            {
                return;
            }
            if (param2 == "")
            {
                param2 = tag;
            }
            _textField.htmlText = _textField.htmlText + ("<span class=\"" + param2 + "\">" + param1 + "</span>");
            _text = _text + param1;
            _draw();
            resize();
            return;
        }// end function

        public function set text(param1:String) : void
        {
            if (param1 == "")
            {
                param1 = _text;
            }
            _textField.htmlText = "<span class=\"" + tag + "\">" + param1 + "</span>";
            _text = param1;
            _draw();
            resize();
            return;
        }// end function

        override protected function layout() : void
        {
            _textField.type = TextFieldType.DYNAMIC;
            _textField.autoSize = TextFieldAutoSize.LEFT;
            _textField.background = false;
            _textField.selectable = selectable;
            _textField.multiline = true;
            _textField.styleSheet = Style.sheet;
            this.text = _text;
            addChild(_background);
            addChild(_textField);
            return;
        }// end function

        public function set tag(param1:String) : void
        {
            _tag = param1;
            text = "";
            return;
        }// end function

        public function onLink(event:TextEvent) : void
        {
            return;
        }// end function

        override protected function dispose() : void
        {
            _textField.removeEventListener(TextEvent.LINK, onLink);
            super.dispose();
            return;
        }// end function

    }
}
