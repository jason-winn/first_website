package com.google.analytics.ecommerce
{
    import com.google.analytics.utils.*;

    public class Transaction extends Object
    {
        private var _items:Array;
        private var _total:String;
        private var _vars:Variables;
        private var _shipping:String;
        private var _city:String;
        private var _state:String;
        private var _country:String;
        private var _tax:String;
        private var _affiliation:String;
        private var _id:String;

        public function Transaction(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String)
        {
            this._id = param1;
            this._affiliation = param2;
            this._total = param3;
            this._tax = param4;
            this._shipping = param5;
            this._city = param6;
            this._state = param7;
            this._country = param8;
            _items = new Array();
            return;
        }// end function

        public function get total() : String
        {
            return _total;
        }// end function

        public function getItemFromArray(param1:Number) : Item
        {
            return _items[param1];
        }// end function

        public function set total(param1:String) : void
        {
            _total = param1;
            return;
        }// end function

        public function getItem(param1:String) : Item
        {
            var _loc_2:Number = NaN;
            _loc_2 = 0;
            while (_loc_2 < _items.length)
            {
                
                if (_items[_loc_2].sku == param1)
                {
                    return _items[_loc_2];
                }
                _loc_2 = _loc_2 + 1;
            }
            return null;
        }// end function

        public function getItemsLength() : Number
        {
            return _items.length;
        }// end function

        public function addItem(param1:String, param2:String, param3:String, param4:String, param5:String) : void
        {
            var _loc_6:Item = null;
            _loc_6 = getItem(param1);
            if (_loc_6 == null)
            {
                _loc_6 = new Item(_id, param1, param2, param3, param4, param5);
                _items.push(_loc_6);
            }
            else
            {
                _loc_6.name = param2;
                _loc_6.category = param3;
                _loc_6.price = param4;
                _loc_6.quantity = param5;
            }
            return;
        }// end function

        public function set shipping(param1:String) : void
        {
            _shipping = param1;
            return;
        }// end function

        public function get country() : String
        {
            return _country;
        }// end function

        public function get state() : String
        {
            return _state;
        }// end function

        public function set tax(param1:String) : void
        {
            _tax = param1;
            return;
        }// end function

        public function set affiliation(param1:String) : void
        {
            _affiliation = param1;
            return;
        }// end function

        public function set state(param1:String) : void
        {
            _state = param1;
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        public function get tax() : String
        {
            return _tax;
        }// end function

        public function toGifParams() : Variables
        {
            var _loc_1:* = new Variables();
            _loc_1.URIencode = true;
            _loc_1.utmt = "tran";
            _loc_1.utmtid = id;
            _loc_1.utmtst = affiliation;
            _loc_1.utmtto = total;
            _loc_1.utmttx = tax;
            _loc_1.utmtsp = shipping;
            _loc_1.utmtci = city;
            _loc_1.utmtrg = state;
            _loc_1.utmtco = country;
            _loc_1.post = ["utmtid", "utmtst", "utmtto", "utmttx", "utmtsp", "utmtci", "utmtrg", "utmtco"];
            return _loc_1;
        }// end function

        public function get affiliation() : String
        {
            return _affiliation;
        }// end function

        public function get city() : String
        {
            return _city;
        }// end function

        public function get shipping() : String
        {
            return _shipping;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
            return;
        }// end function

        public function set city(param1:String) : void
        {
            _city = param1;
            return;
        }// end function

        public function set country(param1:String) : void
        {
            _country = param1;
            return;
        }// end function

    }
}
