package com.shell.data
{
    import com.shell.utils.*;

    public class RefererData extends Object
    {
        public var message:String;
        public var name:String;
        public var carType:int;
        public var licensePlate:String;
        public var destinationName:String;
        private static var _instance:RefererData;

        public function RefererData()
        {
            clear();
            return;
        }// end function

        public function clear() : void
        {
            if (Master.isDebug)
            {
                message = "Hey here\'s a message to test with. How do you like them apples?";
                name = "Cam";
                destinationName = "buenosAires";
                carType = 1;
                licensePlate = "hoooha";
            }
            else
            {
                message = "";
                name = "";
                destinationName = "";
                carType = 1;
                licensePlate = "";
            }
            return;
        }// end function

        public function get isSet() : Boolean
        {
            return name.length > 0 && destinationName.length > 0;
        }// end function

        public static function getInstance() : RefererData
        {
            if (_instance == null)
            {
                _instance = new RefererData;
            }
            return _instance;
        }// end function

    }
}
