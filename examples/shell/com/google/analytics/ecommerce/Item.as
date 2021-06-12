package com.google.analytics.ecommerce
{
    import com.google.analytics.utils.*;

    public class Item extends Object
    {
        private var _price:String;
        private var _id:String;
        private var _sku:String;
        private var _category:String;
        private var _quantity:String;
        private var _name:String;

        public function Item(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String)
        {
            this._id = param1;
            this._sku = param2;
            this._name = param3;
            this._category = param4;
            this._price = param5;
            this._quantity = param6;
            return;
        }// end function

        public function set sku(param1:String) : void
        {
            _sku = param1;
            return;
        }// end function

        public function get price() : String
        {
            return _price;
        }// end function

        public function get name() : String
        {
            return _name;
        }// end function

        public function get quantity() : String
        {
            return _quantity;
        }// end function

        public function set name(param1:String) : void
        {
            _name = param1;
            return;
        }// end function

        public function set price(param1:String) : void
        {
            _price = param1;
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        public function get sku() : String
        {
            return _sku;
        }// end function

        public function set quantity(param1:String) : void
        {
            _quantity = param1;
            return;
        }// end function

        public function toGifParams() : Variables
        {
            var _loc_1:* = new Variables();
            _loc_1.URIencode = true;
            _loc_1.post = ["utmt", "utmtid", "utmipc", "utmipn", "utmiva", "utmipr", "utmiqt"];
            _loc_1.utmt = "item";
            _loc_1.utmtid = _id;
            _loc_1.utmipc = _sku;
            _loc_1.utmipn = _name;
            _loc_1.utmiva = _category;
            _loc_1.utmipr = _price;
            _loc_1.utmiqt = _quantity;
            return _loc_1;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
            return;
        }// end function

        public function set category(param1:String) : void
        {
            _category = param1;
            return;
        }// end function

        public function get category() : String
        {
            return _category;
        }// end function

    }
}
