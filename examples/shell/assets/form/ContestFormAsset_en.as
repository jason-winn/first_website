package assets.form
{
    import fl.controls.*;
    import fl.data.*;
    import flash.display.*;

    dynamic public class ContestFormAsset_en extends MovieClip
    {
        public var eveningPhone4TI:TextInput;
        public var eveningPhoneExtTI:TextInput;
        public var dayPhoneExtTI:TextInput;
        public var eveningPhone3TI:TextInput;
        public var captchaTI:TextInput;
        public var lastNameTI:TextInput;
        public var femaleRB:RadioButton;
        public var shellCB:CheckBox;
        public var captchaField:MovieClip;
        public var collProps1:Array;
        public var errorMessage:MovieClip;
        public var i1:int;
        public var monthTI:TextInput;
        public var maleRB:RadioButton;
        public var j1:Object;
        public var firstNameTI:TextInput;
        public var dayTI:TextInput;
        public var collObj1:DataProvider;
        public var emailTI:TextInput;
        public var cityTI:TextInput;
        public var dayPhone4TI:TextInput;
        public var closeButton:MovieClip;
        public var eveningPhoneAreaTI:TextInput;
        public var yearTI:TextInput;
        public var dayPhone3TI:TextInput;
        public var provinceCB:ComboBox;
        public var dayPhoneAreaTI:TextInput;
        public var rulesCB:CheckBox;
        public var collProp1:Object;
        public var address2TI:TextInput;
        public var submitButtonHolder:MovieClip;
        public var postalCodeTI:TextInput;
        public var itemObj1:SimpleCollectionItem;
        public var address1TI:TextInput;

        public function ContestFormAsset_en()
        {
            __setProp_dayPhoneAreaTI_ContestForm_en_inputs_1();
            __setProp_yearTI_ContestForm_en_inputs_1();
            __setProp_postalCodeTI_ContestForm_en_inputs_1();
            __setProp_cityTI_ContestForm_en_inputs_1();
            __setProp_eveningPhone3TI_ContestForm_en_labels_1();
            __setProp_eveningPhoneAreaTI_ContestForm_en_labels_1();
            __setProp_rulesCB_ContestForm_en_labels_1();
            __setProp_dayPhone3TI_ContestForm_en_inputs_1();
            __setProp_dayTI_ContestForm_en_inputs_1();
            __setProp_address1TI_ContestForm_en_inputs_1();
            __setProp_address2TI_ContestForm_en_inputs_1();
            __setProp_firstNameTI_ContestForm_en_inputs_1();
            __setProp_eveningPhoneExtTI_ContestForm_en_labels_1();
            __setProp_dayPhoneExtTI_ContestForm_en_inputs_1();
            __setProp_femaleRB_ContestForm_en_inputs_1();
            __setProp_monthTI_ContestForm_en_inputs_1();
            __setProp_eveningPhone4TI_ContestForm_en_labels_1();
            __setProp_shellCB_ContestForm_en_inputs_1();
            __setProp_provinceCB_ContestForm_en_inputs_1();
            __setProp_lastNameTI_ContestForm_en_inputs_1();
            __setProp_dayPhone4TI_ContestForm_en_inputs_1();
            __setProp_captchaTI_ContestForm_en_inputs_1();
            __setProp_maleRB_ContestForm_en_inputs_1();
            return;
        }// end function

        function __setProp_eveningPhoneAreaTI_ContestForm_en_labels_1()
        {
            try
            {
                eveningPhoneAreaTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            eveningPhoneAreaTI.displayAsPassword = false;
            eveningPhoneAreaTI.editable = true;
            eveningPhoneAreaTI.enabled = true;
            eveningPhoneAreaTI.maxChars = 3;
            eveningPhoneAreaTI.restrict = " 0-9";
            eveningPhoneAreaTI.text = "";
            eveningPhoneAreaTI.visible = true;
            try
            {
                eveningPhoneAreaTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dayPhone3TI_ContestForm_en_inputs_1()
        {
            try
            {
                dayPhone3TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            dayPhone3TI.displayAsPassword = false;
            dayPhone3TI.editable = true;
            dayPhone3TI.enabled = true;
            dayPhone3TI.maxChars = 3;
            dayPhone3TI.restrict = " 0-9";
            dayPhone3TI.text = "";
            dayPhone3TI.visible = true;
            try
            {
                dayPhone3TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_address1TI_ContestForm_en_inputs_1()
        {
            try
            {
                address1TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            address1TI.displayAsPassword = false;
            address1TI.editable = true;
            address1TI.enabled = true;
            address1TI.maxChars = 255;
            address1TI.restrict = "";
            address1TI.text = "";
            address1TI.visible = true;
            try
            {
                address1TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_cityTI_ContestForm_en_inputs_1()
        {
            try
            {
                cityTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            cityTI.displayAsPassword = false;
            cityTI.editable = true;
            cityTI.enabled = true;
            cityTI.maxChars = 255;
            cityTI.restrict = "";
            cityTI.text = "";
            cityTI.visible = true;
            try
            {
                cityTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_eveningPhone3TI_ContestForm_en_labels_1()
        {
            try
            {
                eveningPhone3TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            eveningPhone3TI.displayAsPassword = false;
            eveningPhone3TI.editable = true;
            eveningPhone3TI.enabled = true;
            eveningPhone3TI.maxChars = 3;
            eveningPhone3TI.restrict = " 0-9";
            eveningPhone3TI.text = "";
            eveningPhone3TI.visible = true;
            try
            {
                eveningPhone3TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_postalCodeTI_ContestForm_en_inputs_1()
        {
            try
            {
                postalCodeTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            postalCodeTI.displayAsPassword = false;
            postalCodeTI.editable = true;
            postalCodeTI.enabled = true;
            postalCodeTI.maxChars = 7;
            postalCodeTI.restrict = "";
            postalCodeTI.text = "";
            postalCodeTI.visible = true;
            try
            {
                postalCodeTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_yearTI_ContestForm_en_inputs_1()
        {
            try
            {
                yearTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            yearTI.displayAsPassword = false;
            yearTI.editable = true;
            yearTI.enabled = true;
            yearTI.maxChars = 4;
            yearTI.restrict = "0-9";
            yearTI.text = "";
            yearTI.visible = true;
            try
            {
                yearTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dayPhone4TI_ContestForm_en_inputs_1()
        {
            try
            {
                dayPhone4TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            dayPhone4TI.displayAsPassword = false;
            dayPhone4TI.editable = true;
            dayPhone4TI.enabled = true;
            dayPhone4TI.maxChars = 4;
            dayPhone4TI.restrict = " 0-9";
            dayPhone4TI.text = "";
            dayPhone4TI.visible = true;
            try
            {
                dayPhone4TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_lastNameTI_ContestForm_en_inputs_1()
        {
            try
            {
                lastNameTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            lastNameTI.displayAsPassword = false;
            lastNameTI.editable = true;
            lastNameTI.enabled = true;
            lastNameTI.maxChars = 255;
            lastNameTI.restrict = "";
            lastNameTI.text = "";
            lastNameTI.visible = true;
            try
            {
                lastNameTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_provinceCB_ContestForm_en_inputs_1()
        {
            try
            {
                provinceCB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            collObj1 = new DataProvider();
            collProps1 = [];
            i1 = 0;
            while (i1 < collProps1.length)
            {
                
                itemObj1 = new SimpleCollectionItem();
                collProp1 = collProps1[i1];
                for (j1 in collProp1)
                {
                    
                    itemObj1[j1] = collProp1[j1];
                }
                collObj1.addItem(itemObj1);
                var _loc_3:* = i1 + 1;
                i1 = _loc_3;
            }
            provinceCB.dataProvider = collObj1;
            provinceCB.editable = false;
            provinceCB.enabled = true;
            provinceCB.prompt = "";
            provinceCB.restrict = "";
            provinceCB.rowCount = 5;
            provinceCB.visible = true;
            try
            {
                provinceCB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_eveningPhoneExtTI_ContestForm_en_labels_1()
        {
            try
            {
                eveningPhoneExtTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            eveningPhoneExtTI.displayAsPassword = false;
            eveningPhoneExtTI.editable = true;
            eveningPhoneExtTI.enabled = true;
            eveningPhoneExtTI.maxChars = 5;
            eveningPhoneExtTI.restrict = "0-9";
            eveningPhoneExtTI.text = "";
            eveningPhoneExtTI.visible = true;
            try
            {
                eveningPhoneExtTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dayPhoneAreaTI_ContestForm_en_inputs_1()
        {
            try
            {
                dayPhoneAreaTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            dayPhoneAreaTI.displayAsPassword = false;
            dayPhoneAreaTI.editable = true;
            dayPhoneAreaTI.enabled = true;
            dayPhoneAreaTI.maxChars = 3;
            dayPhoneAreaTI.restrict = " 0-9";
            dayPhoneAreaTI.text = "";
            dayPhoneAreaTI.visible = true;
            try
            {
                dayPhoneAreaTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_address2TI_ContestForm_en_inputs_1()
        {
            try
            {
                address2TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            address2TI.displayAsPassword = false;
            address2TI.editable = true;
            address2TI.enabled = true;
            address2TI.maxChars = 255;
            address2TI.restrict = "";
            address2TI.text = "";
            address2TI.visible = true;
            try
            {
                address2TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dayTI_ContestForm_en_inputs_1()
        {
            try
            {
                dayTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            dayTI.displayAsPassword = false;
            dayTI.editable = true;
            dayTI.enabled = true;
            dayTI.maxChars = 2;
            dayTI.restrict = "0-9";
            dayTI.text = "";
            dayTI.visible = true;
            try
            {
                dayTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_shellCB_ContestForm_en_inputs_1()
        {
            try
            {
                shellCB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            shellCB.enabled = true;
            shellCB.label = "";
            shellCB.labelPlacement = "right";
            shellCB.selected = false;
            shellCB.visible = true;
            try
            {
                shellCB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_femaleRB_ContestForm_en_inputs_1()
        {
            try
            {
                femaleRB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            femaleRB.enabled = true;
            femaleRB.groupName = "RadioButtonGroup";
            femaleRB.label = "";
            femaleRB.labelPlacement = "left";
            femaleRB.selected = false;
            femaleRB.value = "";
            femaleRB.visible = true;
            try
            {
                femaleRB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_maleRB_ContestForm_en_inputs_1()
        {
            try
            {
                maleRB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            maleRB.enabled = true;
            maleRB.groupName = "RadioButtonGroup";
            maleRB.label = "";
            maleRB.labelPlacement = "left";
            maleRB.selected = false;
            maleRB.value = "";
            maleRB.visible = true;
            try
            {
                maleRB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_eveningPhone4TI_ContestForm_en_labels_1()
        {
            try
            {
                eveningPhone4TI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            eveningPhone4TI.displayAsPassword = false;
            eveningPhone4TI.editable = true;
            eveningPhone4TI.enabled = true;
            eveningPhone4TI.maxChars = 4;
            eveningPhone4TI.restrict = " 0-9";
            eveningPhone4TI.text = "";
            eveningPhone4TI.visible = true;
            try
            {
                eveningPhone4TI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dayPhoneExtTI_ContestForm_en_inputs_1()
        {
            try
            {
                dayPhoneExtTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            dayPhoneExtTI.displayAsPassword = false;
            dayPhoneExtTI.editable = true;
            dayPhoneExtTI.enabled = true;
            dayPhoneExtTI.maxChars = 5;
            dayPhoneExtTI.restrict = "0-9";
            dayPhoneExtTI.text = "";
            dayPhoneExtTI.visible = true;
            try
            {
                dayPhoneExtTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_captchaTI_ContestForm_en_inputs_1()
        {
            try
            {
                captchaTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            captchaTI.displayAsPassword = false;
            captchaTI.editable = true;
            captchaTI.enabled = true;
            captchaTI.maxChars = 0;
            captchaTI.restrict = "[A-Z][0-9]";
            captchaTI.text = "";
            captchaTI.visible = true;
            try
            {
                captchaTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_monthTI_ContestForm_en_inputs_1()
        {
            try
            {
                monthTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            monthTI.displayAsPassword = false;
            monthTI.editable = true;
            monthTI.enabled = true;
            monthTI.maxChars = 2;
            monthTI.restrict = "0-9";
            monthTI.text = "";
            monthTI.visible = true;
            try
            {
                monthTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_firstNameTI_ContestForm_en_inputs_1()
        {
            try
            {
                firstNameTI["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            firstNameTI.displayAsPassword = false;
            firstNameTI.editable = true;
            firstNameTI.enabled = true;
            firstNameTI.maxChars = 255;
            firstNameTI.restrict = "";
            firstNameTI.text = "";
            firstNameTI.visible = true;
            try
            {
                firstNameTI["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_rulesCB_ContestForm_en_labels_1()
        {
            try
            {
                rulesCB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            rulesCB.enabled = true;
            rulesCB.label = "";
            rulesCB.labelPlacement = "right";
            rulesCB.selected = false;
            rulesCB.visible = true;
            try
            {
                rulesCB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
