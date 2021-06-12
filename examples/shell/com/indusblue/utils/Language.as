package com.indusblue.utils
{
    import flash.display.*;

    public class Language extends Object
    {
        public static var ENGLISH:String = "en";
        public static var FRENCH:String = "fr";
        public static var lang:String;

        public function Language()
        {
            return;
        }// end function

        public static function languify(param1:MovieClip) : void
        {
            if (isEnglish())
            {
                param1.gotoAndStop(1);
            }
            else
            {
                param1.gotoAndStop(2);
            }
            return;
        }// end function

        public static function isEnglish() : Boolean
        {
            if (lang == "fr")
            {
                return false;
            }
            return true;
        }// end function

        public static function setText(param1:String, param2:String) : String
        {
            if (isEnglish())
            {
                return param1;
            }
            return param2;
        }// end function

    }
}
