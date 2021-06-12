package fl.controls
{
    import fl.managers.*;
    import flash.display.*;
    import flash.events.*;
    import flash.ui.*;

    public class RadioButton extends LabelButton implements IFocusManagerGroup
    {
        protected var _value:Object;
        protected var defaultGroupName:String = "RadioButtonGroup";
        protected var _group:RadioButtonGroup;
        private static var defaultStyles:Object = {icon:null, upIcon:"RadioButton_upIcon", downIcon:"RadioButton_downIcon", overIcon:"RadioButton_overIcon", disabledIcon:"RadioButton_disabledIcon", selectedDisabledIcon:"RadioButton_selectedDisabledIcon", selectedUpIcon:"RadioButton_selectedUpIcon", selectedDownIcon:"RadioButton_selectedDownIcon", selectedOverIcon:"RadioButton_selectedOverIcon", focusRectSkin:null, focusRectPadding:null, textFormat:null, disabledTextFormat:null, embedFonts:null, textPadding:5};
        public static var createAccessibilityImplementation:Function;

        public function RadioButton()
        {
            defaultGroupName = "RadioButtonGroup";
            mode = "border";
            groupName = defaultGroupName;
            return;
        }// end function

        override public function drawFocus(param1:Boolean) : void
        {
            var _loc_2:Number = NaN;
            super.drawFocus(param1);
            if (param1)
            {
                _loc_2 = Number(getStyleValue("focusRectPadding"));
                uiFocusRect.x = background.x - _loc_2;
                uiFocusRect.y = background.y - _loc_2;
                uiFocusRect.width = background.width + _loc_2 * 2;
                uiFocusRect.height = background.height + _loc_2 * 2;
            }
            return;
        }// end function

        private function setThis() : void
        {
            var _loc_1:RadioButtonGroup = null;
            _loc_1 = _group;
            if (_loc_1 != null)
            {
                if (_loc_1.selection != this)
                {
                    _loc_1.selection = this;
                }
            }
            else
            {
                super.selected = true;
            }
            return;
        }// end function

        override public function get autoRepeat() : Boolean
        {
            return false;
        }// end function

        override public function set autoRepeat(param1:Boolean) : void
        {
            return;
        }// end function

        protected function handleClick(event:MouseEvent) : void
        {
            if (_group == null)
            {
                return;
            }
            _group.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true));
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            switch(event.keyCode)
            {
                case Keyboard.DOWN:
                {
                    setNext(!event.ctrlKey);
                    event.stopPropagation();
                    break;
                }
                case Keyboard.UP:
                {
                    setPrev(!event.ctrlKey);
                    event.stopPropagation();
                    break;
                }
                case Keyboard.LEFT:
                {
                    setPrev(!event.ctrlKey);
                    event.stopPropagation();
                    break;
                }
                case Keyboard.RIGHT:
                {
                    setNext(!event.ctrlKey);
                    event.stopPropagation();
                    break;
                }
                case Keyboard.SPACE:
                {
                    setThis();
                    _toggle = false;
                }
                default:
                {
                    super.keyDownHandler(event);
                    break;
                    break;
                }
            }
            return;
        }// end function

        private function setNext(param1:Boolean = true) : void
        {
            var _loc_2:RadioButtonGroup = null;
            var _loc_3:IFocusManager = null;
            var _loc_4:int = 0;
            var _loc_5:Number = NaN;
            var _loc_6:int = 0;
            var _loc_7:* = undefined;
            _loc_2 = _group;
            if (_loc_2 == null)
            {
                return;
            }
            _loc_3 = focusManager;
            if (_loc_3)
            {
                _loc_3.showFocusIndicator = true;
            }
            _loc_4 = _loc_2.getRadioButtonIndex(this);
            _loc_5 = _loc_2.numRadioButtons;
            _loc_6 = _loc_4;
            if (_loc_4 != -1)
            {
                do
                {
                    
                    _loc_6++;
                    _loc_6 = _loc_6 > (_loc_2.numRadioButtons - 1) ? (0) : (_loc_6);
                    _loc_7 = _loc_2.getRadioButtonAt(_loc_6);
                    if (_loc_7 && _loc_7.enabled)
                    {
                        if (param1)
                        {
                            _loc_2.selection = _loc_7;
                        }
                        _loc_7.setFocus();
                        return;
                    }
                    if (param1 && _loc_2.getRadioButtonAt(_loc_6) != _loc_2.selection)
                    {
                        _loc_2.selection = this;
                    }
                    this.drawFocus(true);
                }while (_loc_6 != _loc_4)
            }
            return;
        }// end function

        public function get group() : RadioButtonGroup
        {
            return _group;
        }// end function

        override protected function keyUpHandler(event:KeyboardEvent) : void
        {
            super.keyUpHandler(event);
            if (event.keyCode == Keyboard.SPACE && !_toggle)
            {
                _toggle = true;
            }
            return;
        }// end function

        override public function get selected() : Boolean
        {
            return super.selected;
        }// end function

        override public function set toggle(param1:Boolean) : void
        {
            throw new Error("Warning: You cannot change a RadioButtons toggle.");
        }// end function

        public function set value(param1:Object) : void
        {
            _value = param1;
            return;
        }// end function

        public function set group(param1:RadioButtonGroup) : void
        {
            groupName = param1.name;
            return;
        }// end function

        override public function set selected(param1:Boolean) : void
        {
            if (param1 == false || selected)
            {
                return;
            }
            if (_group != null)
            {
                _group.selection = this;
            }
            else
            {
                super.selected = param1;
            }
            return;
        }// end function

        override protected function draw() : void
        {
            super.draw();
            return;
        }// end function

        override public function get toggle() : Boolean
        {
            return true;
        }// end function

        override protected function configUI() : void
        {
            var _loc_1:Shape = null;
            var _loc_2:Graphics = null;
            super.configUI();
            super.toggle = true;
            _loc_1 = new Shape();
            _loc_2 = _loc_1.graphics;
            _loc_2.beginFill(0, 0);
            _loc_2.drawRect(0, 0, 100, 100);
            _loc_2.endFill();
            background = _loc_1 as DisplayObject;
            addChildAt(background, 0);
            addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
            return;
        }// end function

        public function set groupName(param1:String) : void
        {
            if (_group != null)
            {
                _group.removeRadioButton(this);
                _group.removeEventListener(Event.CHANGE, handleChange);
            }
            _group = param1 == null ? (null) : (RadioButtonGroup.getGroup(param1));
            if (_group != null)
            {
                _group.addRadioButton(this);
                _group.addEventListener(Event.CHANGE, handleChange, false, 0, true);
            }
            return;
        }// end function

        public function get value() : Object
        {
            return _value;
        }// end function

        override protected function drawLayout() : void
        {
            var _loc_1:Number = NaN;
            super.drawLayout();
            _loc_1 = Number(getStyleValue("textPadding"));
            switch(_labelPlacement)
            {
                case ButtonLabelPlacement.RIGHT:
                {
                    icon.x = _loc_1;
                    textField.x = icon.x + (icon.width + _loc_1);
                    background.width = textField.x + textField.width + _loc_1;
                    background.height = Math.max(textField.height, icon.height) + _loc_1 * 2;
                    break;
                }
                case ButtonLabelPlacement.LEFT:
                {
                    icon.x = width - icon.width - _loc_1;
                    textField.x = width - icon.width - _loc_1 * 2 - textField.width;
                    background.width = textField.width + icon.width + _loc_1 * 3;
                    background.height = Math.max(textField.height, icon.height) + _loc_1 * 2;
                    break;
                }
                case ButtonLabelPlacement.TOP:
                case ButtonLabelPlacement.BOTTOM:
                {
                    background.width = Math.max(textField.width, icon.width) + _loc_1 * 2;
                    background.height = textField.height + icon.height + _loc_1 * 3;
                    break;
                }
                default:
                {
                    break;
                }
            }
            background.x = Math.min(icon.x - _loc_1, textField.x - _loc_1);
            background.y = Math.min(icon.y - _loc_1, textField.y - _loc_1);
            return;
        }// end function

        override protected function drawBackground() : void
        {
            return;
        }// end function

        override protected function initializeAccessibility() : void
        {
            if (RadioButton.createAccessibilityImplementation != null)
            {
                RadioButton.createAccessibilityImplementation(this);
            }
            return;
        }// end function

        public function get groupName() : String
        {
            return _group == null ? (null) : (_group.name);
        }// end function

        private function setPrev(param1:Boolean = true) : void
        {
            var _loc_2:RadioButtonGroup = null;
            var _loc_3:IFocusManager = null;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_6:* = undefined;
            _loc_2 = _group;
            if (_loc_2 == null)
            {
                return;
            }
            _loc_3 = focusManager;
            if (_loc_3)
            {
                _loc_3.showFocusIndicator = true;
            }
            _loc_4 = _loc_2.getRadioButtonIndex(this);
            _loc_5 = _loc_4;
            if (_loc_4 != -1)
            {
                do
                {
                    
                    _loc_5 = --_loc_5 == -1 ? ((_loc_2.numRadioButtons - 1)) : (--_loc_5);
                    _loc_6 = _loc_2.getRadioButtonAt(_loc_5);
                    if (_loc_6 && _loc_6.enabled)
                    {
                        if (param1)
                        {
                            _loc_2.selection = _loc_6;
                        }
                        _loc_6.setFocus();
                        return;
                    }
                    if (param1 && _loc_2.getRadioButtonAt(_loc_5) != _loc_2.selection)
                    {
                        _loc_2.selection = this;
                    }
                    this.drawFocus(true);
                }while (_loc_5 != _loc_4)
            }
            return;
        }// end function

        protected function handleChange(event:Event) : void
        {
            super.selected = _group.selection == this;
            dispatchEvent(new Event(Event.CHANGE, true));
            return;
        }// end function

        public static function getStyleDefinition() : Object
        {
            return defaultStyles;
        }// end function

    }
}
