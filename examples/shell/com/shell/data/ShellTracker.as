package com.shell.data
{
    import com.google.analytics.*;
    import com.indusblue.utils.*;
    import flash.net.*;

    public class ShellTracker extends Object
    {
        public static const THANKS_ENTERING:String = "thanksEnteringPage";
        public static const ELIGIBLE_THANKS_VISITING:String = "eligibleThanksVisitingPage";
        public static const WELCOME_SCREEN:String = "welcomePage";
        public static const STEP_THREE:String = "stepThreePage";
        public static const CONTEST_RULES:String = "contestRulesPopup";
        public static const LEARN_MORE_LINK:String = "learnMoreLink";
        public static const NOT_ELIGIBLE_THANKS_VISITING:String = "notEligibleThanksVisiting";
        public static const STEP_ONE:String = "stepOnePage";
        public static const LOCATE_A_SHELL_LINK:String = "locateAShellLink";
        public static const THANKS_ENTERING_ERROR:String = "thanksEnteringErrorPage";
        public static const APPLY_NOW_LINK:String = "applyNowLink";
        public static const CONTEST_FORM:String = "contestFormPopup";
        public static var tracker:AnalyticsTracker;
        public static const STEP_TWO:String = "stepTwoPage";

        public function ShellTracker()
        {
            return;
        }// end function

        public static function openExternalLink(param1:String, param2:String) : void
        {
            trackPage(param2);
            navigateToURL(new URLRequest(param1));
            return;
        }// end function

        public static function trackPage(param1:String) : void
        {
            if (tracker)
            {
                tracker.trackPageview(Language.lang + "/" + param1);
            }
            trace("tracking: " + (Language.lang + "/" + param1));
            var _loc_2:* = new URLLoader();
            _loc_2.load(new URLRequest("http://idb005.fatboxes.com/tracking/" + Language.lang + "/" + param1));
            return;
        }// end function

    }
}
