package com.shell.utils
{
    import flash.display.*;
    import flash.external.*;
    import flash.system.*;

    public class Master extends Object
    {
        public static var stage:Stage;

        public function Master()
        {
            return;
        }// end function

        public static function get isDebug() : Boolean
        {
            return Capabilities.playerType == "StandAlone" && Capabilities.isDebugger;
        }// end function

        public static function log(param1:String) : void
        {
            return;
        }// end function

    }
}
