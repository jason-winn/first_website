package com.indusblue.utils
{

    public class StringUtils extends Object
    {

        public function StringUtils()
        {
            return;
        }// end function

        public static function trim(param1:String) : String
        {
            return param1.replace(/^\s+|\s+$/, "");
        }// end function

        public static function zeroPad(param1:String, param2:Number = 2) : String
        {
            while (param1.length < param2)
            {
                
                param1 = "0" + param1;
            }
            return param1;
        }// end function

        public static function trimAll(param1:String) : String
        {
            return param1.replace(/\s/g, "");
        }// end function

    }
}
