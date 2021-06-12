package com.google.analytics.debug
{
    import flash.events.*;
    import flash.utils.*;

    public class Info extends Label
    {
        private var _timer:Timer;

        public function Info(param1:String = "", param2:uint = 3000)
        {
            super(param1, "uiInfo", Style.infoColor, Align.top, true);
            if (param2 > 0)
            {
                _timer = new Timer(param2, 1);
                _timer.start();
                _timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete, false, 0, true);
            }
            return;
        }// end function

        public function close() : void
        {
            if (parent != null)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

        override public function onLink(event:TextEvent) : void
        {
            switch(event.text)
            {
                case "hide":
                {
                    close();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function onComplete(event:TimerEvent) : void
        {
            close();
            return;
        }// end function

    }
}
