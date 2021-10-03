package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2036:int;
      
      private var var_1442:String;
      
      private var var_2033:int;
      
      private var var_2035:int;
      
      private var _category:int;
      
      private var var_1939:String;
      
      private var var_1342:int;
      
      private var var_2034:int;
      
      private var var_2031:int;
      
      private var var_2030:int;
      
      private var var_2029:int;
      
      private var var_2032:Boolean;
      
      private var var_2746:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2036 = param1;
         this.var_1442 = param2;
         this.var_2033 = param3;
         this.var_2035 = param4;
         this._category = param5;
         this.var_1939 = param6;
         this.var_1342 = param7;
         this.var_2034 = param8;
         this.var_2031 = param9;
         this.var_2030 = param10;
         this.var_2029 = param11;
         this.var_2032 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2036;
      }
      
      public function get itemType() : String
      {
         return this.var_1442;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2033;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2035;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1939;
      }
      
      public function get extra() : int
      {
         return this.var_1342;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2034;
      }
      
      public function get creationDay() : int
      {
         return this.var_2031;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2030;
      }
      
      public function get creationYear() : int
      {
         return this.var_2029;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2032;
      }
      
      public function get songID() : int
      {
         return this.var_1342;
      }
   }
}
