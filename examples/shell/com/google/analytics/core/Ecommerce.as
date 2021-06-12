package com.google.analytics.core
{
    import com.google.analytics.debug.*;
    import com.google.analytics.ecommerce.*;

    public class Ecommerce extends Object
    {
        private var _debug:DebugConfiguration;
        private var _trans:Array;

        public function Ecommerce(param1:DebugConfiguration)
        {
            this._debug = param1;
            _trans = new Array();
            return;
        }// end function

        public function getTransLength() : Number
        {
            return _trans.length;
        }// end function

        public function getTransFromArray(param1:Number) : Transaction
        {
            return _trans[param1];
        }// end function

        public function addTransaction(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String) : Transaction
        {
            var _loc_9:Transaction = null;
            _loc_9 = getTransaction(param1);
            if (_loc_9 == null)
            {
                _loc_9 = new Transaction(param1, param2, param3, param4, param5, param6, param7, param8);
                _trans.push(_loc_9);
            }
            else
            {
                _loc_9.affiliation = param2;
                _loc_9.total = param3;
                _loc_9.tax = param4;
                _loc_9.shipping = param5;
                _loc_9.city = param6;
                _loc_9.state = param7;
                _loc_9.country = param8;
            }
            return _loc_9;
        }// end function

        public function getTransaction(param1:String) : Transaction
        {
            var _loc_2:Number = NaN;
            _loc_2 = 0;
            while (_loc_2 < _trans.length)
            {
                
                if (_trans[_loc_2].id == param1)
                {
                    return _trans[_loc_2];
                }
                _loc_2 = _loc_2 + 1;
            }
            return null;
        }// end function

    }
}
