package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2190:int;
      
      private var var_1939:String;
      
      private var var_1787:int;
      
      private var _status:int;
      
      private var var_2189:int = -1;
      
      private var var_2096:int;
      
      private var var_1786:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2190 = param3;
         this.var_1939 = param4;
         this.var_1787 = param5;
         this._status = param6;
         this.var_2189 = param7;
         this.var_2096 = param8;
         this.var_1786 = param9;
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
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2189;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2096;
      }
      
      public function get offerCount() : int
      {
         return this.var_1786;
      }
   }
}
