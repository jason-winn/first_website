package com.google.analytics.debug
{

    public class SuccessAlert extends Alert
    {

        public function SuccessAlert(param1:DebugConfiguration, param2:String, param3:Array)
        {
            var _loc_4:* = Align.bottomLeft;
            var _loc_5:Boolean = true;
            var _loc_6:Boolean = false;
            if (param1.verbose)
            {
                param2 = "<u><span class=\"uiAlertTitle\">Success</span>" + spaces(18) + "</u>\n\n" + param2;
                _loc_4 = Align.center;
                _loc_5 = false;
                _loc_6 = true;
            }
            super(param2, param3, "uiSuccess", Style.successColor, _loc_4, _loc_5, _loc_6);
            return;
        }// end function

    }
}
