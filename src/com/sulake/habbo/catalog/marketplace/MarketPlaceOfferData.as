package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2190:int;
      
      private var var_1939:String;
      
      private var var_1787:int;
      
      private var var_2096:int;
      
      private var var_2514:int;
      
      private var _status:int;
      
      private var var_2189:int = -1;
      
      private var var_1786:int;
      
      private var var_42:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2190 = param3;
         this.var_1939 = param4;
         this.var_1787 = param5;
         this._status = param6;
         this.var_2096 = param7;
         this.var_1786 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_42)
         {
            this.var_42.dispose();
            this.var_42 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2190;
      }
      
      public function get stuffData() : String
      {
         return this.var_1939;
      }
      
      public function get price() : int
      {
         return this.var_1787;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2096;
      }
      
      public function get image() : BitmapData
      {
         return this.var_42;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_42 != null)
         {
            this.var_42.dispose();
         }
         this.var_42 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2514 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2514;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2189;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1787 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1786;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1786 = param1;
      }
   }
}
