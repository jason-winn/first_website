package 
{
    import com.shell.display.forms.*;
    import flash.display.*;

    public class FormTester extends Sprite
    {
        private var _contestForm:ContestFormPopup;

        public function FormTester()
        {
            var _loc_1:* = new ContestFormPopup();
            _contestForm = new ContestFormPopup();
            addChild(_loc_1);
            _contestForm.init();
            _contestForm.buildIn();
            return;
        }// end function

    }
}
