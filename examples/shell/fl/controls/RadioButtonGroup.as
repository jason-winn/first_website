package fl.controls
{
    import flash.events.*;

    public class RadioButtonGroup extends EventDispatcher
    {
        protected var _selection:RadioButton;
        protected var radioButtons:Array;
        protected var _name:String;
        private static var groups:Object;
        private static var groupCount:uint = 0;

        public function RadioButtonGroup(param1:String)
        {
            _name = param1;
            radioButtons = [];
            registerGroup(this);
            return;
        }// end function

        public function getRadioButtonIndex(param1:RadioButton) : int
        {
            var _loc_2:int = 0;
            var _loc_3:RadioButton = null;
            _loc_2 = 0;
            while (_loc_2 < radioButtons.length)
            {
                
                _loc_3 = radioButtons[_loc_2] as RadioButton;
                if (_loc_3 == param1)
                {
                    return _loc_2;
                }
                _loc_2++;
            }
            return -1;
        }// end function

        public function get numRadioButtons() : int
        {
            return radioButtons.length;
        }// end function

        public function get name() : String
        {
            return _name;
        }// end function

        public function get selection() : RadioButton
        {
            return _selection;
        }// end function

        public function set selection(param1:RadioButton) : void
        {
            if (_selection == param1 || param1 == null || getRadioButtonIndex(param1) == -1)
            {
                return;
            }
            _selection = param1;
            dispatchEvent(new Event(Event.CHANGE, true));
            return;
        }// end function

        public function set selectedData(param1:Object) : void
        {
            var _loc_2:int = 0;
            var _loc_3:RadioButton = null;
            _loc_2 = 0;
            while (_loc_2 < radioButtons.length)
            {
                
                _loc_3 = radioButtons[_loc_2] as RadioButton;
                if (_loc_3.value == param1)
                {
                    selection = _loc_3;
                    return;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function removeRadioButton(param1:RadioButton) : void
        {
            var _loc_2:int = 0;
            _loc_2 = getRadioButtonIndex(param1);
            if (_loc_2 != -1)
            {
                radioButtons.splice(_loc_2, 1);
            }
            if (_selection == param1)
            {
                _selection = null;
            }
            return;
        }// end function

        public function addRadioButton(param1:RadioButton) : void
        {
            if (param1.groupName != name)
            {
                param1.groupName = name;
                return;
            }
            radioButtons.push(param1);
            if (param1.selected)
            {
                selection = param1;
            }
            return;
        }// end function

        public function getRadioButtonAt(param1:int) : RadioButton
        {
            return RadioButton(radioButtons[param1]);
        }// end function

        public function get selectedData() : Object
        {
            var _loc_1:RadioButton = null;
            _loc_1 = _selection;
            return _loc_1 == null ? (null) : (_loc_1.value);
        }// end function

        public static function getGroup(param1:String) : RadioButtonGroup
        {
            var _loc_2:RadioButtonGroup = null;
            if (groups == null)
            {
                groups = {};
            }
            _loc_2 = groups[param1] as RadioButtonGroup;
            if (_loc_2 == null)
            {
                _loc_2 = new RadioButtonGroup(param1);
                if (++groupCount % 20 == 0)
                {
                    cleanUpGroups();
                }
            }
            return _loc_2;
        }// end function

        private static function registerGroup(param1:RadioButtonGroup) : void
        {
            if (groups == null)
            {
                groups = {};
            }
            groups[param1.name] = param1;
            return;
        }// end function

        private static function cleanUpGroups() : void
        {
            var _loc_1:String = null;
            var _loc_2:RadioButtonGroup = null;
            for (_loc_1 in groups)
            {
                
                _loc_2 = groups[_loc_1] as RadioButtonGroup;
                if (_loc_2.radioButtons.length == 0)
                {
                    delete groups[_loc_1];
                }
            }
            return;
        }// end function

    }
}
