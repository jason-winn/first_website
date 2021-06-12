package assets.sections.stepThree
{
    import fl.controls.*;
    import flash.display.*;

    dynamic public class StepThreeAsset_en extends MovieClip
    {
        public var messageField:TextArea;
        public var nameField:TextInput;
        public var friendsField:TextArea;
        public var sendPostcardButton:MovieClip;
        public var postcardPlaceholder:MovieClip;
        public var emailField:TextInput;
        public var noThanksButton:MovieClip;
        public var errorMessage:MovieClip;

        public function StepThreeAsset_en()
        {
            __setProp_messageField_StepThreeAsset_en_messageField_1();
            __setProp_friendsField_StepThreeAsset_en_friendsField_1();
            return;
        }// end function

        function __setProp_friendsField_StepThreeAsset_en_friendsField_1()
        {
            try
            {
                friendsField["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            friendsField.condenseWhite = false;
            friendsField.editable = true;
            friendsField.enabled = true;
            friendsField.horizontalScrollPolicy = "auto";
            friendsField.htmlText = "";
            friendsField.maxChars = 0;
            friendsField.restrict = "";
            friendsField.text = "";
            friendsField.verticalScrollPolicy = "off";
            friendsField.visible = true;
            friendsField.wordWrap = true;
            try
            {
                friendsField["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_messageField_StepThreeAsset_en_messageField_1()
        {
            try
            {
                messageField["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            messageField.condenseWhite = false;
            messageField.editable = true;
            messageField.enabled = true;
            messageField.horizontalScrollPolicy = "auto";
            messageField.htmlText = "";
            messageField.maxChars = 0;
            messageField.restrict = "";
            messageField.text = "";
            messageField.verticalScrollPolicy = "off";
            messageField.visible = true;
            messageField.wordWrap = true;
            try
            {
                messageField["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
