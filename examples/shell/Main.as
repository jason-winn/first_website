package 
{
    import assets.debug.*;
    import com.indusblue.display.viewManager.*;
    import com.shell.display.*;
    import com.shell.display.popups.*;
    import com.shell.display.sections.*;
    import com.shell.utils.*;
    import flash.display.*;
    import flash.events.*;
    import gs.*;

    public class Main extends MovieClip
    {
        private var _header:Header;
        private static var _mainViewManager:ViewManager;
        private static var _popupManager:ViewManager;

        public function Main()
        {
            return;
        }// end function

        public function init() : void
        {
            var _loc_3:DebugNavButton = null;
            var _loc_4:DebugNavButton = null;
            var _loc_5:DebugNavButton = null;
            var _loc_6:* = new Header();
            _header = new Header();
            addChild(_loc_6);
            _header.alpha = 0;
            TweenMax.to(_header, 0.5, {alpha:1});
            var _loc_1:* = new Sprite();
            addChild(_loc_1);
            _mainViewManager = new ViewManager(_loc_1);
            _mainViewManager.addView(SectionTypes.WelcomeScreen);
            _mainViewManager.addView(SectionTypes.StepOne);
            _mainViewManager.addView(SectionTypes.StepTwo);
            _mainViewManager.addView(SectionTypes.StepThree);
            _mainViewManager.addView(SectionTypes.EligibleThanksVisiting);
            _mainViewManager.addView(SectionTypes.NotEligibleThanksVisiting);
            _mainViewManager.addView(SectionTypes.ThanksEntering);
            _mainViewManager.addView(SectionTypes.ThanksEnteringError);
            var _loc_2:* = new Sprite();
            addChild(_loc_2);
            _popupManager = new ViewManager(_loc_2);
            _popupManager.addView(PopupTypes.Test);
            if (Master.isDebug && false)
            {
                _loc_3 = new DebugNavButton();
                _loc_3.x = 20;
                _loc_3.y = stage.stageHeight - _loc_3.height - 20;
                _loc_3.addEventListener(MouseEvent.CLICK, onBackClick);
                _loc_3.buttonMode = true;
                addChild(_loc_3);
                _loc_4 = new DebugNavButton();
                _loc_4.x = stage.stageWidth - _loc_4.width - 20;
                _loc_4.y = stage.stageHeight - _loc_4.height - 20;
                _loc_4.addEventListener(MouseEvent.CLICK, onForwardClick);
                _loc_4.buttonMode = true;
                addChild(_loc_4);
                _loc_5 = new DebugNavButton();
                _loc_5.x = stage.stageWidth / 2 - _loc_5.width / 2;
                _loc_5.y = stage.stageHeight - _loc_5.height - 20;
                _loc_5.addEventListener(MouseEvent.CLICK, onOpenPopup);
                _loc_5.buttonMode = true;
                addChild(_loc_5);
            }
            if (Master.isDebug)
            {
                changePage(SectionTypes.StepThree);
            }
            else
            {
                changePage(SectionTypes.WelcomeScreen);
            }
            return;
        }// end function

        private function onForwardClick(event:MouseEvent) : void
        {
            _mainViewManager.nextView();
            return;
        }// end function

        private function onOpenPopup(event:MouseEvent) : void
        {
            _popupManager.openView(PopupTypes.Test);
            return;
        }// end function

        private function onBackClick(event:MouseEvent) : void
        {
            _mainViewManager.previousView();
            return;
        }// end function

        public static function changePage(param1:ViewType) : void
        {
            _mainViewManager.openView(param1);
            return;
        }// end function

        public static function openPopup(param1:ViewType) : void
        {
            _popupManager.openView(param1);
            return;
        }// end function

    }
}
