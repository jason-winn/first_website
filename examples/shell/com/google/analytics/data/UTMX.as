package com.google.analytics.data
{

    public class UTMX extends UTMCookie
    {
        private var _value:String;

        public function UTMX()
        {
            super("utmx", "__utmx", ["value"], 0);
            _value = "-";
            return;
        }// end function

        public function get value() : String
        {
            return _value;
        }// end function

        public function set value(param1:String) : void
        {
            _value = param1;
            return;
        }// end function

    }
}
